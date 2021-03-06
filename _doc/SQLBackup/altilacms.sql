/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : altilacms

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2013-11-11 18:37:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_base_app_device`
-- ----------------------------
DROP TABLE IF EXISTS `admin_base_app_device`;
CREATE TABLE `admin_base_app_device` (
  `badid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `appdcode` int(6) NOT NULL DEFAULT '0' COMMENT '设备编码,可作唯一标示,二进制递增',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '设备名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`badid`),
  KEY `code` (`appdcode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='应该设备管理';

-- ----------------------------
-- Records of admin_base_app_device
-- ----------------------------
INSERT INTO `admin_base_app_device` VALUES ('1', '1', 'Wab', '1', '1', '2013-10-31 20:37:17', '2013-10-31 20:41:49');
INSERT INTO `admin_base_app_device` VALUES ('2', '2', 'Wap', '2', '1', '2013-10-31 20:37:26', '2013-10-31 20:41:41');
INSERT INTO `admin_base_app_device` VALUES ('3', '4', 'Android', '3', '1', '2013-10-31 20:37:40', '2013-10-31 20:41:34');
INSERT INTO `admin_base_app_device` VALUES ('4', '8', 'IOS', '4', '1', '2013-10-31 20:41:56', '2013-10-31 20:41:56');
INSERT INTO `admin_base_app_device` VALUES ('5', '16', 'Win', '5', '1', '2013-10-31 20:42:51', '2013-10-31 20:43:24');
INSERT INTO `admin_base_app_device` VALUES ('6', '32', 'Ipad', '6', '1', '2013-10-31 20:43:31', '2013-10-31 20:43:31');

-- ----------------------------
-- Table structure for `admin_base_area`
-- ----------------------------
DROP TABLE IF EXISTS `admin_base_area`;
CREATE TABLE `admin_base_area` (
  `baid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长,地区编码(行政代码)',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '地区父级ID',
  `crumb` varchar(100) NOT NULL DEFAULT '' COMMENT '面包屑，用横杠分割',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '中文名称',
  `name_full` varchar(60) DEFAULT '' COMMENT '中文全称',
  `ename` varchar(60) DEFAULT '' COMMENT '英文名称',
  `ename_full` varchar(60) DEFAULT '' COMMENT '英文全称',
  `abbrevia` varchar(5) DEFAULT '' COMMENT '英文缩写',
  `administrative_code` int(11) DEFAULT '0' COMMENT '行政代码',
  `zip_code` varchar(8) DEFAULT '0' COMMENT '邮政编码',
  `call_code` varchar(8) DEFAULT '0' COMMENT '长途区号',
  `time_zone` varchar(8) DEFAULT '' COMMENT '时区',
  `time_diff` varchar(8) DEFAULT '' COMMENT '与中国时差',
  `status` tinyint(1) unsigned DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=820001 DEFAULT CHARSET=utf8 COMMENT='地区管理';

-- ----------------------------
-- Records of admin_base_area
-- ----------------------------
INSERT INTO `admin_base_area` VALUES ('4', '0', '4-', '阿富汗', '阿富汗', 'Afghanistan', 'Afghanistan', 'AF', '4', '0', '0093', '+4:30', '-3:30', '1');
INSERT INTO `admin_base_area` VALUES ('8', '0', '8-', '阿尔巴尼亚', '阿尔巴尼亚', 'Albania', 'Albania', 'AL', '8', '0', '00355', '+1', '-7', '1');
INSERT INTO `admin_base_area` VALUES ('10', '0', '10-', '南极洲', '南极洲', 'Antarctica', 'Antarctica', 'AQ', '10', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('12', '0', '12-', '阿尔及利亚', '阿尔及利亚', 'Algeria', 'Algeria', 'DZ', '12', '0', '00213', '+1', '-7', '1');
INSERT INTO `admin_base_area` VALUES ('16', '0', '16-', '东萨摩亚', '美属萨摩亚', 'American Samoa', 'American Samoa', 'AS', '16', '0', '00684', '-11', '-19', '1');
INSERT INTO `admin_base_area` VALUES ('20', '0', '20-', '安道尔', '安道尔', 'Andorra', 'Andorra', 'AD', '20', '0', '00376', '+1', '-7', '1');
INSERT INTO `admin_base_area` VALUES ('24', '0', '24-', '安哥拉', '安哥拉', 'Angola', 'Angola', 'AO', '24', '0', '00244', '+1', '-7', '1');
INSERT INTO `admin_base_area` VALUES ('28', '0', '28-', '安提瓜和巴布达', '安提瓜和巴布达', 'Antigua And Barbuda', 'Antigua And Barbuda', 'AG', '28', '0', '001268', '-4', '-12', '1');
INSERT INTO `admin_base_area` VALUES ('31', '0', '31-', '阿塞拜疆', '阿塞拜疆', 'Azerbaijan', 'Azerbaijan', 'AZ', '31', '0', '00994', '+4', '-4', '1');
INSERT INTO `admin_base_area` VALUES ('32', '0', '32-', '阿根廷', '阿根廷', 'Argentina', 'Argentina', 'AR', '32', '0', '0054', '-3', '-11', '1');
INSERT INTO `admin_base_area` VALUES ('36', '0', '36-', '澳大利亚', '澳大利亚', 'Australia', 'Australia', 'AU', '36', '0', '0061', '+8-+10', '0-+2', '1');
INSERT INTO `admin_base_area` VALUES ('40', '0', '40-', '奥地利', '奥地利', 'Austria', 'Austria', 'AT', '40', '0', '0043', '+1', '-7', '1');
INSERT INTO `admin_base_area` VALUES ('44', '0', '44-', '巴哈马', '巴哈马', 'Bahamas', 'Bahamas', 'BS', '44', '0', '001242', '-5', '-13', '1');
INSERT INTO `admin_base_area` VALUES ('48', '0', '48-', '巴林', '巴林', 'Bahrain', 'Bahrain', 'BH', '48', '0', '00973', '+3', '-5', '1');
INSERT INTO `admin_base_area` VALUES ('50', '0', '50-', '孟加拉', '孟加拉国', 'Bangladesh', 'Bangladesh', 'BD', '50', '0', '00880', '+6', '-2', '1');
INSERT INTO `admin_base_area` VALUES ('51', '0', '51-', '亚美尼亚', '亚美尼亚', 'Armenia', 'Armenia', 'AM', '51', '0', '00374', '+4', '-4', '1');
INSERT INTO `admin_base_area` VALUES ('52', '0', '52-', '巴巴多斯', '巴巴多斯', 'Barbados', 'Barbados', 'BB', '52', '0', '001246', '-4', '-12', '1');
INSERT INTO `admin_base_area` VALUES ('56', '0', '56-', '比利时', '比利时', 'Belgium', 'Belgium', 'BE', '56', '0', '0032', '+1', '-7', '1');
INSERT INTO `admin_base_area` VALUES ('60', '0', '60-', '百慕大', '百慕大', 'Bermuda', 'Bermuda', 'BM', '60', '0', '001441', '-4', '-12', '1');
INSERT INTO `admin_base_area` VALUES ('64', '0', '64-', '不丹', '不丹', 'Bhutan', 'Bhutan', 'BT', '64', '0', '00975', '+6', '-2', '1');
INSERT INTO `admin_base_area` VALUES ('68', '0', '68-', '玻利维亚', '玻利维亚', 'Bolivia', 'Bolivia', 'BO', '68', '0', '00591', '-4', '-12', '1');
INSERT INTO `admin_base_area` VALUES ('70', '0', '70-', '波黑', '波黑', 'Bosnia and Herzegovina', 'Bosnia and Herzegovina', 'BA', '70', '0', '00387', '+1', '-7', '1');
INSERT INTO `admin_base_area` VALUES ('72', '0', '72-', '博茨瓦纳', '博茨瓦纳', 'Botswana', 'Botswana', 'BW', '72', '0', '00267', '+2', '-6', '1');
INSERT INTO `admin_base_area` VALUES ('74', '0', '74-', '布维岛', '布维岛', 'BOUVET ISLAND', 'BOUVET ISLAND', 'BV', '74', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('76', '0', '76-', '巴西', '巴西', 'Brazil', 'Brazil', 'BR', '76', '0', '0055', '-3--5', '-11--13', '1');
INSERT INTO `admin_base_area` VALUES ('84', '0', '84-', '伯利兹', '伯利兹', 'Belize', 'Belize', 'BZ', '84', '0', '00501', '-6', '-14', '1');
INSERT INTO `admin_base_area` VALUES ('86', '0', '86-', '英属印度洋领土', '英属印度洋领土', 'BRITISH INDIAN OCEAN TER-RITORY', 'BRITISH INDIAN OCEAN TER-RITORY', 'IO', '86', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('90', '0', '90-', '所罗门群岛', '所罗门群岛', 'SOLOMON ISLANDS', 'SOLOMON ISLANDS', 'SB', '90', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('92', '0', '92-', '英属维尔京群岛', '英属维尔京群岛', 'VIRGIN ISLANDS, BRITISH', 'VIRGIN ISLANDS, BRITISH', 'VG', '92', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('96', '0', '96-', '文莱', '文莱', 'BRUNEI DARUSSALAM', 'BRUNEI DARUSSALAM', 'BN', '96', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('100', '0', '100-', '保加利亚', '保加利亚', 'BULGARIA', 'BULGARIA', 'BG', '100', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('104', '0', '104-', '缅甸', '缅甸', 'MYANMAR', 'MYANMAR', 'MM', '104', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('108', '0', '108-', '布隆迪', '布隆迪', 'BURUNDI', 'BURUNDI', 'BI', '108', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('112', '0', '112-', '白俄罗斯', '白俄罗斯', 'BELARUS', 'BELARUS', 'BY', '112', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('116', '0', '116-', '柬埔寨', '柬埔寨', 'CAMBODIA', 'CAMBODIA', 'KH', '116', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120', '0', '120-', '喀麦隆', '喀麦隆', 'CAMEROON', 'CAMEROON', 'CM', '120', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('124', '0', '124-', '加拿大', '加拿大', 'CANADA', 'CANADA', 'CA', '124', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('132', '0', '132-', '佛得角', '佛得角', 'CAPE VERDE', 'CAPE VERDE', 'CV', '132', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('136', '0', '136-', '开曼群岛', '开曼群岛', 'CAYMAN ISLANDS', 'CAYMAN ISLANDS', 'KY', '136', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140', '0', '140-', '中非', '中非', 'CENTRAL AFRICA', 'CENTRAL AFRICA', 'CF', '140', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('144', '0', '144-', '斯里兰卡', '斯里兰卡', 'SRI LANKA', 'SRI LANKA', 'LK', '144', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('148', '0', '148-', '乍得', '乍得', 'CHAD', 'CHAD', 'TD', '148', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152', '0', '152-', '智利', '智利', 'CHILE', 'CHILE', 'CL', '152', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('156', '0', '156-', '中国', '中国', 'China', 'China', 'CN', '156', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('162', '0', '162-', '圣诞岛', '圣诞岛', 'CHRISTMAS ISLAND', 'CHRISTMAS ISLAND', 'CS', '162', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('166', '0', '166-', '科科斯(基林)群岛', '科科斯(基林)群岛', 'COCOS(KEELING) ISLANDS', 'COCOS(KEELING) ISLANDS', 'CC', '166', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('170', '0', '170-', '哥伦比亚', '哥伦比亚', 'COLOMBIA', 'COLOMBIA', 'Co', '170', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('174', '0', '174-', '科摩罗', '科摩罗', 'COMOROS', 'COMOROS', 'KM', '174', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('175', '0', '175-', '马约特', '马约特', 'MAYOTTE', 'MAYOTTE', 'YT', '175', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('178', '0', '178-', '刚果（布）', '刚果（布）', 'CONGO', 'CONGO', 'CG', '178', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('180', '0', '180-', '刚果（金）', '刚果（金）', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'CD', '180', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('184', '0', '184-', '库克群岛', '库克群岛', 'COOK ISLANDS', 'COOK ISLANDS', 'CK', '184', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('188', '0', '188-', '哥斯达黎加', '哥斯达黎加', 'COSTA RICA', 'COSTA RICA', 'CR', '188', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('191', '0', '191-', '克罗地亚', '克罗地亚', 'CROATIA', 'CROATIA', 'HR', '191', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('192', '0', '192-', '古巴', '古巴', 'CUBA', 'CUBA', 'CU', '192', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('196', '0', '196-', '塞浦路斯', '塞浦路斯', 'CYPRUS', 'CYPRUS', 'CY', '196', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('203', '0', '203-', '捷克', '捷克', 'CZECH REPOUBLIC', 'CZECH REPOUBLIC', 'CZ', '203', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('204', '0', '204-', '贝宁', '贝宁', 'BENIN', 'BENIN', 'BJ', '204', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('208', '0', '208-', '丹麦', '丹麦', 'DENMARK', 'DENMARK', 'DK', '208', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('212', '0', '212-', '多米尼克', '多米尼克', 'DOMINICA', 'DOMINICA', 'DM', '212', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('214', '0', '214-', '多米尼加', '多米尼加', 'DOMINICAN REPUBLIC', 'DOMINICAN REPUBLIC', 'DO', '214', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('218', '0', '218-', '厄瓜多尔', '厄瓜多尔', 'ECUADOR', 'ECUADOR', 'EC', '218', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222', '0', '222-', '萨尔瓦多', '萨尔瓦多', 'EL SALVADOR', 'EL SALVADOR', 'SV', '222', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('226', '0', '226-', '赤道几内亚', '赤道几内亚', 'EQUATORIAL GUINEA', 'EQUATORIAL GUINEA', 'GQ', '226', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231', '0', '231-', '埃塞俄比亚', '埃塞俄比亚', 'ETHIOPIA', 'ETHIOPIA', 'ET', '231', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('232', '0', '232-', '厄立特里亚', '厄立特里亚', 'ERITREA', 'ERITREA', 'ER', '232', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('233', '0', '233-', '爱沙尼亚', '爱沙尼亚', 'ESTONIA', 'ESTONIA', 'EE', '233', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('234', '0', '234-', '法罗群岛', '法罗群岛', 'FAROE ISLANDS', 'FAROE ISLANDS', 'FO', '234', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('238', '0', '238-', '福克兰群岛(马尔维纳斯)', '福克兰群岛(马尔维纳斯)', 'FALKLAND ISLANDS(MALVINAS)', 'FALKLAND ISLANDS(MALVINAS)', 'FK', '238', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('239', '0', '239-', '南乔治亚岛和南桑德韦奇岛', '南乔治亚岛和南桑德韦奇岛', 'SOUTH GEORGIA AND SOUTH SANDWICH ISLANDS', 'SOUTH GEORGIA AND SOUTH SANDWICH ISLANDS', 'GS', '239', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('242', '0', '242-', '斐济', '斐济', 'FIJI', 'FIJI', 'FJ', '242', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('246', '0', '246-', '芬兰', '芬兰', 'FINLAND', 'FINLAND', 'FI', '246', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('250', '0', '250-', '法国', '法国', 'FRANCE', 'FRANCE', 'FR', '250', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('254', '0', '254-', '法属圭亚那', '法属圭亚那', 'FRENCH GUIANA', 'FRENCH GUIANA', 'GF', '254', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('258', '0', '258-', '法属波利尼西亚', '法属波利尼西亚', 'FRENCH POLYNESIA', 'FRENCH POLYNESIA', 'PF', '258', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('260', '0', '260-', '法属南部领土', '法属南部领土', 'FRENCH SOUTHERN TERRITO-RIES', 'FRENCH SOUTHERN TERRITO-RIES', 'TF', '260', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('262', '0', '262-', '吉布提', '吉布提', 'DJIBOUTI', 'DJIBOUTI', 'DJ', '262', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('266', '0', '266-', '加蓬', '加蓬', 'GABON', 'GABON', 'GA', '266', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('268', '0', '268-', '格鲁吉亚', '格鲁吉亚', 'GEORGIA', 'GEORGIA', 'GE', '268', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('270', '0', '270-', '冈比亚', '冈比亚', 'Gambia', 'Gambia', 'GM', '270', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('276', '0', '276-', '德国', '德国', 'GERMANY', 'GERMANY', 'DE', '276', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('288', '0', '288-', '加纳', '加纳', 'GHANA', 'GHANA', 'GH', '288', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('292', '0', '292-', '直布罗陀', '直布罗陀', 'GIBRALTAR', 'GIBRALTAR', 'GI', '292', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('296', '0', '296-', '基里巴斯', '基里巴斯', 'KIRIBATI', 'KIRIBATI', 'KI', '296', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('300', '0', '300-', '希腊', '希腊', 'GREECE', 'GREECE', 'GR', '300', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('304', '0', '304-', '格陵兰', '格陵兰', 'GREENLAND', 'GREENLAND', 'GL', '304', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('308', '0', '308-', '格林纳达', '格林纳达', 'GRENADA', 'GRENADA', 'GD', '308', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('312', '0', '312-', '瓜德罗普', '瓜德罗普', 'GUADELOUPE', 'GUADELOUPE', 'GP', '312', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('316', '0', '316-', '关岛', '关岛', 'GUAM', 'GUAM', 'GU', '316', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320', '0', '320-', '危地马拉', '危地马拉', 'GUATEMALA', 'GUATEMALA', 'GT', '320', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('324', '0', '324-', '几内亚', '几内亚', 'GUINEA', 'GUINEA', 'GN', '324', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('328', '0', '328-', '圭亚那', '圭亚那', 'GUYANA', 'GUYANA', 'GY', '328', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('332', '0', '332-', '海地', '海地', 'HAITI', 'HAITI', 'HT', '332', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('334', '0', '334-', '赫德岛和麦克唐纳岛', '赫德岛和麦克唐纳岛', 'HEARD ISLANDS AND MC DONALD ISLANDS', 'HEARD ISLANDS AND MC DONALD ISLANDS', 'HM', '334', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('336', '0', '336-', '梵蒂冈', '梵蒂冈', 'VATICAN', 'VATICAN', 'VA', '336', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340', '0', '340-', '洪都拉斯', '洪都拉斯', 'HONDURAS', 'HONDURAS', 'HN', '340', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('348', '0', '348-', '匈牙利', '匈牙利', 'HUNGARY', 'HUNGARY', 'HU', '348', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('352', '0', '352-', '冰岛', '冰岛', 'ICELAND', 'ICELAND', 'IS', '352', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('356', '0', '356-', '印度', '印度', 'INDIA', 'INDIA', 'IN', '356', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360', '0', '360-', '印度尼西亚', '印度尼西亚', 'INDONESIA', 'INDONESIA', 'ID', '360', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('364', '0', '364-', '伊朗', '伊朗', 'IRAN', 'IRAN', 'IR', '364', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('368', '0', '368-', '伊拉克', '伊拉克', 'IRAQ', 'IRAQ', 'IQ', '368', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('372', '0', '372-', '爱尔兰', '爱尔兰', 'IRELAND', 'IRELAND', 'IE', '372', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('374', '0', '374-', '巴勒斯坦', '巴勒斯坦', 'PALESTINE', 'PALESTINE', 'PS', '374', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('376', '0', '376-', '以色列', '以色列', 'ISRAEL', 'ISRAEL', 'IL', '376', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('380', '0', '380-', '意大利', '意大利', 'ITALY', 'ITALY', 'IT', '380', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('384', '0', '384-', '科特迪瓦', '科特迪瓦', 'COTE D\'IVOIRE', 'COTE D\'IVOIRE', 'CI', '384', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('388', '0', '388-', '牙买加', '牙买加', 'JAMAICA', 'JAMAICA', 'JM', '388', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('392', '0', '392-', '日本', '日本', 'JAPAN', 'JAPAN', 'JP', '392', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('398', '0', '398-', '哈萨克斯坦', '哈萨克斯坦', 'KAZAKHSTAN', 'KAZAKHSTAN', 'KZ', '398', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('400', '0', '400-', '约旦', '约旦', 'JORDAN', 'JORDAN', 'JO', '400', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('404', '0', '404-', '肯尼亚', '肯尼亚', 'KENYA', 'KENYA', 'KE', '404', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('408', '0', '408-', '朝鲜', '朝鲜', 'KOREA,DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'KOREA,DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'KP', '408', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410', '0', '410-', '韩国', '韩国', 'KOREA,REPUBLIC OF', 'KOREA,REPUBLIC OF', 'KR', '410', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('414', '0', '414-', '科威特', '科威特', 'KUWAIT', 'KUWAIT', 'KW', '414', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('417', '0', '417-', '吉尔吉斯斯坦', '吉尔吉斯斯坦', 'KYRGYZSTAN', 'KYRGYZSTAN', 'KG', '417', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('418', '0', '418-', '老挝', '老挝', 'LAOS', 'LAOS', 'LA', '418', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422', '0', '422-', '黎巴嫩', '黎巴嫩', 'LEBANON', 'LEBANON', 'LB', '422', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('426', '0', '426-', '莱索托', '莱索托', 'LESOTHO', 'LESOTHO', 'LS', '426', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('428', '0', '428-', '拉脱维亚', '拉脱维亚', 'LATVIA', 'LATVIA', 'LV', '428', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430', '0', '430-', '利比里亚', '利比里亚', 'LIBERIA', 'LIBERIA', 'LR', '430', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('434', '0', '434-', '利比亚', '利比亚', 'LIBYA', 'LIBYA', 'LY', '434', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('438', '0', '438-', '列支敦士登', '列支敦士登', 'LIECHTENSTEIN', 'LIECHTENSTEIN', 'LI', '438', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440', '0', '440-', '立陶宛', '立陶宛', 'LITHUANIA', 'LITHUANIA', 'LT', '440', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('442', '0', '442-', '卢森堡', '卢森堡', 'LUXEMBOURG', 'LUXEMBOURG', 'LU', '442', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450', '0', '450-', '马达加斯加', '马达加斯加', 'MADAGASCAR', 'MADAGASCAR', 'MG', '450', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('454', '0', '454-', '马拉维', '马拉维', 'MALAWI', 'MALAWI', 'MW', '454', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('458', '0', '458-', '马来西亚', '马来西亚', 'MALAYSIA', 'MALAYSIA', 'MY', '458', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('462', '0', '462-', '马尔代夫', '马尔代夫', 'MALDIVES', 'MALDIVES', 'MV', '462', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('466', '0', '466-', '马里', '马里', 'MALI', 'MALI', 'ML', '466', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('470', '0', '470-', '马耳他', '马耳他', 'MALTA', 'MALTA', 'MT', '470', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('474', '0', '474-', '马提尼克', '马提尼克', 'MARTINIQUE', 'MARTINIQUE', 'MQ', '474', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('478', '0', '478-', '毛里塔尼亚', '毛里塔尼亚', 'MAURITANIA', 'MAURITANIA', 'MR', '478', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('480', '0', '480-', '毛里求斯', '毛里求斯', 'MAURITIUS', 'MAURITIUS', 'MU', '480', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('484', '0', '484-', '墨西哥', '墨西哥', 'MEXICO', 'MEXICO', 'MX', '484', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('492', '0', '492-', '摩纳哥', '摩纳哥', 'MONACO', 'MONACO', 'MC', '492', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('496', '0', '496-', '蒙古', '蒙古', 'MONGOLIA', 'MONGOLIA', 'MN', '496', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('498', '0', '498-', '摩尔多瓦', '摩尔多瓦', 'MOLDOVA', 'MOLDOVA', 'MD', '498', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500', '0', '500-', '蒙特塞拉特', '蒙特塞拉特', 'MONTSERRAT', 'MONTSERRAT', 'MS', '500', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('504', '0', '504-', '摩洛哥', '摩洛哥', 'MOROCCO', 'MOROCCO', 'MA', '504', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('508', '0', '508-', '莫桑比克', '莫桑比克', 'MOZAMBIQUE', 'MOZAMBIQUE', 'MZ', '508', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('512', '0', '512-', '阿曼', '阿曼', 'OMAN', 'OMAN', 'OM', '512', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('516', '0', '516-', '纳米比亚', '纳米比亚', 'NAMIBIA', 'NAMIBIA', 'NA', '516', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520', '0', '520-', '瑙鲁', '瑙鲁', 'NAURU', 'NAURU', 'NR', '520', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('524', '0', '524-', '尼泊尔', '尼泊尔', 'NEPAL', 'NEPAL', 'NP', '524', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('528', '0', '528-', '荷兰', '荷兰', 'NETHERLANDS', 'NETHERLANDS', 'NL', '528', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530', '0', '530-', '荷属安的列斯', '荷属安的列斯', 'NETHERLANDS ANTILLES', 'NETHERLANDS ANTILLES', 'AN', '530', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533', '0', '533-', '阿鲁巴', '阿鲁巴', 'ARUBA', 'ARUBA', 'AW', '533', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540', '0', '540-', '新喀里多尼亚', '新喀里多尼亚', 'NEW CALEDONIA', 'NEW CALEDONIA', 'NC', '540', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('548', '0', '548-', '瓦努阿图', '瓦努阿图', 'VANUATU', 'VANUATU', 'VU', '548', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('554', '0', '554-', '新西兰', '新西兰', 'NEW ZEALAND', 'NEW ZEALAND', 'NZ', '554', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('558', '0', '558-', '尼加拉瓜', '尼加拉瓜', 'NICARAGUA', 'NICARAGUA', 'NI', '558', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('562', '0', '562-', '尼日尔', '尼日尔', 'NIGER', 'NIGER', 'NE', '562', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('566', '0', '566-', '尼日利亚', '尼日利亚', 'NIGERIA', 'NIGERIA', 'NG', '566', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('570', '0', '570-', '纽埃', '纽埃', 'NIUE', 'NIUE', 'NU', '570', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('574', '0', '574-', '诺福克岛', '诺福克岛', 'NORFOLK ISLAND', 'NORFOLK ISLAND', 'NF', '574', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('578', '0', '578-', '挪威', '挪威', 'NORWAY', 'NORWAY', 'NO', '578', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('580', '0', '580-', '北马里亚纳', '北马里亚纳', 'NORTHERN MARIANAS', 'NORTHERN MARIANAS', 'MP', '580', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('581', '0', '581-', '美国本土外小岛屿', '美国本土外小岛屿', 'UNITED STATES MINOR OUTLYING ISLANDS', 'UNITED STATES MINOR OUTLYING ISLANDS', 'UM', '581', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('583', '0', '583-', '密克罗尼西亚联邦', '密克罗尼西亚联邦', 'MICRONESIA, FEDERATED STATES OF', 'MICRONESIA, FEDERATED STATES OF', 'FM', '583', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('584', '0', '584-', '马绍尔群岛', '马绍尔群岛', 'MARSHALL ISLANDS', 'MARSHALL ISLANDS', 'MH', '584', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('585', '0', '585-', '帕劳', '帕劳', 'PALAU', 'PALAU', 'PW', '585', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('586', '0', '586-', '巴基斯坦', '巴基斯坦', 'PAKISTAN', 'PAKISTAN', 'PK', '586', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('591', '0', '591-', '巴拿马', '巴拿马', 'PANAMA', 'PANAMA', 'PA', '591', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('598', '0', '598-', '巴布亚新几内亚', '巴布亚新几内亚', 'PAPUA NEW GUINEA', 'PAPUA NEW GUINEA', 'PG', '598', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('600', '0', '600-', '巴拉圭', '巴拉圭', 'PARAGUAY', 'PARAGUAY', 'PY', '600', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('604', '0', '604-', '秘鲁', '秘鲁', 'PERU', 'PERU', 'PE', '604', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('608', '0', '608-', '菲律宾', '菲律宾', 'PHILIPPINES', 'PHILIPPINES', 'PH', '608', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('612', '0', '612-', '皮特凯恩群岛', '皮特凯恩群岛', 'PITCAIRN ISLANDS GROUP', 'PITCAIRN ISLANDS GROUP', 'PN', '612', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('616', '0', '616-', '波兰', '波兰', 'POLAND', 'POLAND', 'PL', '616', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620', '0', '620-', '葡萄牙', '葡萄牙', 'PORTUGAL', 'PORTUGAL', 'PT', '620', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('624', '0', '624-', '几内亚比绍', '几内亚比绍', 'GUINE-BISSAU', 'GUINE-BISSAU', 'GW', '624', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('626', '0', '626-', '东帝汶', '东帝汶', 'EAST TIMOR', 'EAST TIMOR', 'TP', '626', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630', '0', '630-', '波多黎各', '波多黎各', 'PUERTO RICO', 'PUERTO RICO', 'PR', '630', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('634', '0', '634-', '卡塔尔', '卡塔尔', 'QATAR', 'QATAR', 'QA', '634', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('638', '0', '638-', '留尼汪', '留尼汪', 'REUNION', 'REUNION', 'RE', '638', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('642', '0', '642-', '罗马尼亚', '罗马尼亚', 'ROMANIA', 'ROMANIA', 'RO', '642', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('643', '0', '643-', '俄罗斯', '俄罗斯', 'RUSSIAN FEDERATION', 'RUSSIAN FEDERATION', 'RU', '643', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('646', '0', '646-', '卢旺达', '卢旺达', 'RWANDA', 'RWANDA', 'RW', '646', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654', '0', '654-', '圣赫勒拿', '圣赫勒拿', 'SAINT HELENA', 'SAINT HELENA', 'Sh', '654', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('659', '0', '659-', '圣基茨和尼维斯', '圣基茨和尼维斯', 'SAINT KITTS AND NEVIS', 'SAINT KITTS AND NEVIS', 'KN', '659', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('660', '0', '660-', '安圭拉', '安圭拉', 'Anguilla', 'Anguilla', 'AI', '660', '0', '001264', '', '-12', '1');
INSERT INTO `admin_base_area` VALUES ('662', '0', '662-', '圣卢西亚', '圣卢西亚', 'SAINT LUCIA', 'SAINT LUCIA', 'LC', '662', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('666', '0', '666-', '圣皮埃尔和密克隆', '圣皮埃尔和密克隆', 'SAINT PIERRE AND MIQUELON', 'SAINT PIERRE AND MIQUELON', 'PM', '666', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('670', '0', '670-', '圣文森特和格林纳丁斯', '圣文森特和格林纳丁斯', 'SAINT VINCENT AND THE GRENADINES', 'SAINT VINCENT AND THE GRENADINES', 'VC', '670', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('674', '0', '674-', '圣马力诺', '圣马力诺', 'SAN MARION', 'SAN MARION', 'SM', '674', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('678', '0', '678-', '圣多美和普林西比', '圣多美和普林西比', 'SAO TOME AND PRINCIPE', 'SAO TOME AND PRINCIPE', 'St', '678', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('682', '0', '682-', '沙特阿拉伯', '沙特阿拉伯', 'SAUDI ARABIA', 'SAUDI ARABIA', 'SA', '682', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('686', '0', '686-', '塞内加尔', '塞内加尔', 'SENEGAL', 'SENEGAL', 'SN', '686', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('690', '0', '690-', '塞舌尔', '塞舌尔', 'SEYCHELLS', 'SEYCHELLS', 'SC', '690', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('694', '0', '694-', '塞拉利昂', '塞拉利昂', 'SIERRA LEONE', 'SIERRA LEONE', 'SL', '694', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('702', '0', '702-', '新加坡', '新加坡', 'SINGAPORE', 'SINGAPORE', 'SG', '702', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('703', '0', '703-', '斯洛伐克', '斯洛伐克', 'SLOVAKIA', 'SLOVAKIA', 'SK', '703', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('704', '0', '704-', '越南', '越南', 'VIET NAM', 'VIET NAM', 'VN', '704', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('705', '0', '705-', '斯洛文尼亚', '斯洛文尼亚', 'SLOVENIA', 'SLOVENIA', 'SI', '705', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('706', '0', '706-', '索马里', '索马里', 'SOMALIA', 'SOMALIA', 'SO', '706', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('710', '0', '710-', '南非', '南非', 'SOUTH AFRICA', 'SOUTH AFRICA', 'ZA', '710', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('716', '0', '716-', '津巴布韦', '津巴布韦', 'ZIMBABWE', 'ZIMBABWE', 'ZW', '716', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('724', '0', '724-', '西班牙', '西班牙', 'SPAIN', 'SPAIN', 'ES', '724', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('732', '0', '732-', '西撒哈拉', '西撒哈拉', 'WESTERN SAHARA', 'WESTERN SAHARA', 'EH', '732', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('736', '0', '736-', '苏丹', '苏丹', 'SUDAN', 'SUDAN', 'SD', '736', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('740', '0', '740-', '苏里南', '苏里南', 'SURINAME', 'SURINAME', 'SR', '740', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('744', '0', '744-', '斯瓦尔巴群岛', '斯瓦尔巴群岛', 'SVALBARD AND JAN MAYEN ISLANDS', 'SVALBARD AND JAN MAYEN ISLANDS', 'SJ', '744', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('748', '0', '748-', '斯威士兰', '斯威士兰', 'SWAZILAND', 'SWAZILAND', 'SZ', '748', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('752', '0', '752-', '瑞典', '瑞典', 'SWEDEN', 'SWEDEN', 'SE', '752', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('756', '0', '756-', '瑞士', '瑞士', 'SWITZERLAND', 'SWITZERLAND', 'CH', '756', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('760', '0', '760-', '叙利亚', '叙利亚', 'SYRIA', 'SYRIA', 'SY', '760', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('762', '0', '762-', '塔吉克斯坦', '塔吉克斯坦', 'TAJIKISTAN', 'TAJIKISTAN', 'TJ', '762', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('764', '0', '764-', '泰国', '泰国', 'THAILAND', 'THAILAND', 'TH', '764', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('768', '0', '768-', '多哥', '多哥', 'TOGO', 'TOGO', 'TG', '768', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('772', '0', '772-', '托克劳', '托克劳', 'TOKELAU', 'TOKELAU', 'TK', '772', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('776', '0', '776-', '汤加', '汤加', 'TONGA', 'TONGA', 'TO', '776', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('780', '0', '780-', '特立尼达和多巴哥', '特立尼达和多巴哥', 'TRINIDAD AND TOBAGO', 'TRINIDAD AND TOBAGO', 'TT', '780', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('784', '0', '784-', '阿联酋', '阿联酋', 'UNITED ARAB EMIRATES', 'UNITED ARAB EMIRATES', 'AE', '784', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('788', '0', '788-', '突尼斯', '突尼斯', 'TUNISIA', 'TUNISIA', 'TN', '788', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('792', '0', '792-', '土耳其', '土耳其', 'TURKEY', 'TURKEY', 'TR', '792', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('795', '0', '795-', '土库曼斯坦', '土库曼斯坦', 'TURKMENISTAN', 'TURKMENISTAN', 'TM', '795', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('796', '0', '796-', '特克斯科斯群岛', '特克斯科斯群岛', 'TURKS AND CAICOS ISLANDS', 'TURKS AND CAICOS ISLANDS', 'TC', '796', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('798', '0', '798-', '图瓦卢', '图瓦卢', 'TUVALU', 'TUVALU', 'TV', '798', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('800', '0', '800-', '乌干达', '乌干达', 'UGANDA', 'UGANDA', 'UG', '800', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('804', '0', '804-', '乌克兰', '乌克兰', 'UKRAINE', 'UKRAINE', 'UA', '804', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('807', '0', '807-', '前南马其顿', '前南马其顿', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'MK', '807', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('818', '0', '818-', '埃及', '埃及', 'EGYPT', 'EGYPT', 'EG', '818', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('826', '0', '826-', '英国', '英国', 'UNITED KINGDOM', 'UNITED KINGDOM', 'GB', '826', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('834', '0', '834-', '坦桑尼亚', '坦桑尼亚', 'TANZANIA', 'TANZANIA', 'TZ', '834', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('840', '0', '840-', '美国', '美国', 'UNITED STATES', 'UNITED STATES', 'US', '840', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('850', '0', '850-', '美属维尔京群岛', '美属维尔京群岛', 'VIRGIN ISLANDS,U.S.', 'VIRGIN ISLANDS,U.S.', 'VI', '850', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('854', '0', '854-', '布基纳法索', '布基纳法索', 'BURKINA FASO', 'BURKINA FASO', 'BF', '854', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('858', '0', '858-', '乌拉圭', '乌拉圭', 'URUGUAY', 'URUGUAY', 'UY', '858', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('860', '0', '860-', '乌兹别克斯坦', '乌兹别克斯坦', 'UZBEKISTAN', 'UZBEKISTAN', 'UZ', '860', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('862', '0', '862-', '委内瑞拉', '委内瑞拉', 'VENEZUELA', 'VENEZUELA', 'VE', '862', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('876', '0', '876-', '瓦利斯和富图纳', '瓦利斯和富图纳', 'WALLIS AND FUTUNA', 'WALLIS AND FUTUNA', 'WF', '876', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('882', '0', '882-', '萨摩亚', '萨摩亚', 'SAMOA', 'SAMOA', 'WS', '882', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('887', '0', '887-', '也门', '也门', 'YEMEN', 'YEMEN', 'YE', '887', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('891', '0', '891-', '南斯拉夫', '南斯拉夫', 'YUGOSLAVIA', 'YUGOSLAVIA', 'YU', '891', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('894', '0', '894-', '赞比亚', '赞比亚', 'ZAMBIA', 'ZAMBIA', 'ZM', '894', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110000', '156', '156-110000-', '北京', '北京市', 'BeiJing', 'BeiJing', 'BJ', '110000', '100000', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110100', '110000', '156-110000-110100-', '市辖区', '市辖区', '', '', '', '110100', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110101', '110100', '156-110000-110100-110101-', '东城区', '东城区', '', '', '', '110101', '100000', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110102', '110100', '156-110000-110100-110102-', '西城区', '西城区', '', '', '', '110102', '100000', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110105', '110100', '156-110000-110100-110105-', '朝阳区', '朝阳区', '', '', '', '110105', '100000', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110106', '110100', '156-110000-110100-110106-', '丰台区', '丰台区', '', '', '', '110106', '100000', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110107', '110100', '156-110000-110100-110107-', '石景山区', '石景山区', '', '', '', '110107', '100000', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110108', '110100', '156-110000-110100-110108-', '海淀区', '海淀区', '', '', '', '110108', '100000', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110109', '110100', '156-110000-110100-110109-', '门头沟区', '门头沟区', '', '', '', '110109', '102300', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110111', '110100', '156-110000-110100-110111-', '房山区', '房山区', '', '', '', '110111', '102400', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110112', '110100', '156-110000-110100-110112-', '通州区', '通州区', '', '', '', '110112', '101100', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110113', '110100', '156-110000-110100-110113-', '顺义区', '顺义区', '', '', '', '110113', '101300', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110114', '110100', '156-110000-110100-110114-', '昌平区', '昌平区', '', '', '', '110114', '102200', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110115', '110100', '156-110000-110100-110115-', '大兴区', '大兴区', '', '', '', '110115', '102600', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110116', '110100', '156-110000-110100-110116-', '怀柔区', '怀柔区', '', '', '', '110116', '101400', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110117', '110100', '156-110000-110100-110117-', '平谷区', '平谷区', '', '', '', '110117', '101200', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110200', '110000', '156-110000-110200-', '县', '县', '', '', '', '110200', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110228', '110200', '156-110000-110200-110228-', '密云县', '密云县', '', '', '', '110228', '101500', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('110229', '110200', '156-110000-110200-110229-', '延庆县', '延庆县', '', '', '', '110229', '102100', '010', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120000', '156', '156-120000-', '天津', '天津市', 'TianJin', 'TianJin', 'TJ', '120000', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120100', '120000', '156-120000-120100-', '市辖区', '市辖区', '', '', '', '120100', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120101', '120100', '156-120000-120100-120101-', '和平区', '和平区', '', '', '', '120101', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120102', '120100', '156-120000-120100-120102-', '河东区', '河东区', '', '', '', '120102', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120103', '120100', '156-120000-120100-120103-', '河西区', '河西区', '', '', '', '120103', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120104', '120100', '156-120000-120100-120104-', '南开区', '南开区', '', '', '', '120104', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120105', '120100', '156-120000-120100-120105-', '河北区', '河北区', '', '', '', '120105', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120106', '120100', '156-120000-120100-120106-', '红桥区', '红桥区', '', '', '', '120106', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120110', '120100', '156-120000-120100-120110-', '东丽区', '东丽区', '', '', '', '120110', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120111', '120100', '156-120000-120100-120111-', '西青区', '西青区', '', '', '', '120111', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120112', '120100', '156-120000-120100-120112-', '津南区', '津南区', '', '', '', '120112', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120113', '120100', '156-120000-120100-120113-', '北辰区', '北辰区', '', '', '', '120113', '300000', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120114', '120100', '156-120000-120100-120114-', '武清区', '武清区', '', '', '', '120114', '301700', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120115', '120100', '156-120000-120100-120115-', '宝坻区', '宝坻区', '', '', '', '120115', '301800', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120116', '120100', '156-120000-120100-120116-', '滨海新区', '滨海新区', '', '', '', '120116', '300450', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120200', '120000', '156-120000-120200-', '县', '县', '', '', '', '120200', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120221', '120200', '156-120000-120200-120221-', '宁河县', '宁河县', '', '', '', '120221', '301500', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120223', '120200', '156-120000-120200-120223-', '静海县', '静海县', '', '', '', '120223', '301600', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('120225', '120200', '156-120000-120200-120225-', '蓟县', '蓟县', '', '', '', '120225', '301900', '022', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130000', '156', '156-130000-', '河北', '河北省', 'HeBei', 'HeBei', 'HB', '130000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130100', '130000', '156-130000-130100-', '石家庄', '石家庄市', '', '', '', '130100', '050000', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130101', '130100', '156-130000-130100-130101-', '市辖区', '市辖区', '', '', '', '130101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130102', '130100', '156-130000-130100-130102-', '长安区', '长安区', '', '', '', '130102', '050000', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130103', '130100', '156-130000-130100-130103-', '桥东区', '桥东区', '', '', '', '130103', '050000', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130104', '130100', '156-130000-130100-130104-', '桥西区', '桥西区', '', '', '', '130104', '050000', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130105', '130100', '156-130000-130100-130105-', '新华区', '新华区', '', '', '', '130105', '050000', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130107', '130100', '156-130000-130100-130107-', '井陉矿区', '井陉矿区', '', '', '', '130107', '050100', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130108', '130100', '156-130000-130100-130108-', '裕华区', '裕华区', '', '', '', '130108', '050000', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130121', '130100', '156-130000-130100-130121-', '井陉县', '井陉县', '', '', '', '130121', '050300', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130123', '130100', '156-130000-130100-130123-', '正定县', '正定县', '', '', '', '130123', '050800', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130124', '130100', '156-130000-130100-130124-', '栾城县', '栾城县', '', '', '', '130124', '051430', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130125', '130100', '156-130000-130100-130125-', '行唐县', '行唐县', '', '', '', '130125', '050600', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130126', '130100', '156-130000-130100-130126-', '灵寿县', '灵寿县', '', '', '', '130126', '050500', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130127', '130100', '156-130000-130100-130127-', '高邑县', '高邑县', '', '', '', '130127', '051330', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130128', '130100', '156-130000-130100-130128-', '深泽县', '深泽县', '', '', '', '130128', '052500', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130129', '130100', '156-130000-130100-130129-', '赞皇县', '赞皇县', '', '', '', '130129', '051230', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130130', '130100', '156-130000-130100-130130-', '无极县', '无极县', '', '', '', '130130', '052400', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130131', '130100', '156-130000-130100-130131-', '平山县', '平山县', '', '', '', '130131', '050400', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130132', '130100', '156-130000-130100-130132-', '元氏县', '元氏县', '', '', '', '130132', '051130', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130133', '130100', '156-130000-130100-130133-', '赵县', '赵县', '', '', '', '130133', '051530', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130181', '130100', '156-130000-130100-130181-', '辛集市', '辛集市', '', '', '', '130181', '052300', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130182', '130100', '156-130000-130100-130182-', '藁城市', '藁城市', '', '', '', '130182', '052160', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130183', '130100', '156-130000-130100-130183-', '晋州市', '晋州市', '', '', '', '130183', '052200', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130184', '130100', '156-130000-130100-130184-', '新乐市', '新乐市', '', '', '', '130184', '050700', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130185', '130100', '156-130000-130100-130185-', '鹿泉市', '鹿泉市', '', '', '', '130185', '050200', '0311', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130200', '130000', '156-130000-130200-', '唐山', '唐山市', '', '', '', '130200', '063000', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130201', '130200', '156-130000-130200-130201-', '市辖区', '市辖区', '', '', '', '130201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130202', '130200', '156-130000-130200-130202-', '路南区', '路南区', '', '', '', '130202', '063000', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130203', '130200', '156-130000-130200-130203-', '路北区', '路北区', '', '', '', '130203', '063000', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130204', '130200', '156-130000-130200-130204-', '古冶区', '古冶区', '', '', '', '130204', '063100', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130205', '130200', '156-130000-130200-130205-', '开平区', '开平区', '', '', '', '130205', '063000', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130207', '130200', '156-130000-130200-130207-', '丰南区', '丰南区', '', '', '', '130207', '063300', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130208', '130200', '156-130000-130200-130208-', '丰润区', '丰润区', '', '', '', '130208', '063000', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130209', '130200', '156-130000-130200-130209-', '曹妃甸区', '曹妃甸区', '', '', '', '130209', '0', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130223', '130200', '156-130000-130200-130223-', '滦县', '滦县', '', '', '', '130223', '063700', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130224', '130200', '156-130000-130200-130224-', '滦南县', '滦南县', '', '', '', '130224', '063500', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130225', '130200', '156-130000-130200-130225-', '乐亭县', '乐亭县', '', '', '', '130225', '063600', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130227', '130200', '156-130000-130200-130227-', '迁西县', '迁西县', '', '', '', '130227', '064300', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130229', '130200', '156-130000-130200-130229-', '玉田县', '玉田县', '', '', '', '130229', '064100', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130281', '130200', '156-130000-130200-130281-', '遵化市', '遵化市', '', '', '', '130281', '064200', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130283', '130200', '156-130000-130200-130283-', '迁安市', '迁安市', '', '', '', '130283', '064400', '0315', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130300', '130000', '156-130000-130300-', '秦皇岛', '秦皇岛市', '', '', '', '130300', '066000', '0335', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130301', '130300', '156-130000-130300-130301-', '市辖区', '市辖区', '', '', '', '130301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130302', '130300', '156-130000-130300-130302-', '海港区', '海港区', '', '', '', '130302', '066000', '0335', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130303', '130300', '156-130000-130300-130303-', '山海关区', '山海关区', '', '', '', '130303', '066200', '0335', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130304', '130300', '156-130000-130300-130304-', '北戴河区', '北戴河区', '', '', '', '130304', '066100', '0335', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130321', '130300', '156-130000-130300-130321-', '青龙满族自治县', '青龙满族自治县', '', '', '', '130321', '066500', '0335', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130322', '130300', '156-130000-130300-130322-', '昌黎县', '昌黎县', '', '', '', '130322', '066600', '0335', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130323', '130300', '156-130000-130300-130323-', '抚宁县', '抚宁县', '', '', '', '130323', '066300', '0335', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130324', '130300', '156-130000-130300-130324-', '卢龙县', '卢龙县', '', '', '', '130324', '066400', '0335', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130400', '130000', '156-130000-130400-', '邯郸', '邯郸市', '', '', '', '130400', '056000', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130401', '130400', '156-130000-130400-130401-', '市辖区', '市辖区', '', '', '', '130401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130402', '130400', '156-130000-130400-130402-', '邯山区', '邯山区', '', '', '', '130402', '056000', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130403', '130400', '156-130000-130400-130403-', '丛台区', '丛台区', '', '', '', '130403', '056000', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130404', '130400', '156-130000-130400-130404-', '复兴区', '复兴区', '', '', '', '130404', '056000', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130406', '130400', '156-130000-130400-130406-', '峰峰矿区', '峰峰矿区', '', '', '', '130406', '056200', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130421', '130400', '156-130000-130400-130421-', '邯郸县', '邯郸县', '', '', '', '130421', '056000', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130423', '130400', '156-130000-130400-130423-', '临漳县', '临漳县', '', '', '', '130423', '056600', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130424', '130400', '156-130000-130400-130424-', '成安县', '成安县', '', '', '', '130424', '056700', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130425', '130400', '156-130000-130400-130425-', '大名县', '大名县', '', '', '', '130425', '056900', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130426', '130400', '156-130000-130400-130426-', '涉县', '涉县', '', '', '', '130426', '056400', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130427', '130400', '156-130000-130400-130427-', '磁县', '磁县', '', '', '', '130427', '056500', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130428', '130400', '156-130000-130400-130428-', '肥乡县', '肥乡县', '', '', '', '130428', '057550', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130429', '130400', '156-130000-130400-130429-', '永年县', '永年县', '', '', '', '130429', '057150', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130430', '130400', '156-130000-130400-130430-', '邱县', '邱县', '', '', '', '130430', '057450', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130431', '130400', '156-130000-130400-130431-', '鸡泽县', '鸡泽县', '', '', '', '130431', '057350', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130432', '130400', '156-130000-130400-130432-', '广平县', '广平县', '', '', '', '130432', '057650', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130433', '130400', '156-130000-130400-130433-', '馆陶县', '馆陶县', '', '', '', '130433', '057750', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130434', '130400', '156-130000-130400-130434-', '魏县', '魏县', '', '', '', '130434', '056800', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130435', '130400', '156-130000-130400-130435-', '曲周县', '曲周县', '', '', '', '130435', '057250', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130481', '130400', '156-130000-130400-130481-', '武安市', '武安市', '', '', '', '130481', '056300', '0310', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130500', '130000', '156-130000-130500-', '邢台', '邢台市', '', '', '', '130500', '054000', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130501', '130500', '156-130000-130500-130501-', '市辖区', '市辖区', '', '', '', '130501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130502', '130500', '156-130000-130500-130502-', '桥东区', '桥东区', '', '', '', '130502', '054000', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130503', '130500', '156-130000-130500-130503-', '桥西区', '桥西区', '', '', '', '130503', '054000', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130521', '130500', '156-130000-130500-130521-', '邢台县', '邢台县', '', '', '', '130521', '054000', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130522', '130500', '156-130000-130500-130522-', '临城县', '临城县', '', '', '', '130522', '054300', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130523', '130500', '156-130000-130500-130523-', '内丘县', '内丘县', '', '', '', '130523', '054200', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130524', '130500', '156-130000-130500-130524-', '柏乡县', '柏乡县', '', '', '', '130524', '055450', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130525', '130500', '156-130000-130500-130525-', '隆尧县', '隆尧县', '', '', '', '130525', '055350', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130526', '130500', '156-130000-130500-130526-', '任县', '任县', '', '', '', '130526', '055150', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130527', '130500', '156-130000-130500-130527-', '南和县', '南和县', '', '', '', '130527', '054400', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130528', '130500', '156-130000-130500-130528-', '宁晋县', '宁晋县', '', '', '', '130528', '055550', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130529', '130500', '156-130000-130500-130529-', '巨鹿县', '巨鹿县', '', '', '', '130529', '055250', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130530', '130500', '156-130000-130500-130530-', '新河县', '新河县', '', '', '', '130530', '051730', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130531', '130500', '156-130000-130500-130531-', '广宗县', '广宗县', '', '', '', '130531', '054600', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130532', '130500', '156-130000-130500-130532-', '平乡县', '平乡县', '', '', '', '130532', '054500', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130533', '130500', '156-130000-130500-130533-', '威县', '威县', '', '', '', '130533', '054700', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130534', '130500', '156-130000-130500-130534-', '清河县', '清河县', '', '', '', '130534', '054800', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130535', '130500', '156-130000-130500-130535-', '临西县', '临西县', '', '', '', '130535', '054900', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130581', '130500', '156-130000-130500-130581-', '南宫市', '南宫市', '', '', '', '130581', '051800', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130582', '130500', '156-130000-130500-130582-', '沙河市', '沙河市', '', '', '', '130582', '054100', '0319', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130600', '130000', '156-130000-130600-', '保定', '保定市', '', '', '', '130600', '071000', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130601', '130600', '156-130000-130600-130601-', '市辖区', '市辖区', '', '', '', '130601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130602', '130600', '156-130000-130600-130602-', '新市区', '新市区', '', '', '', '130602', '071000', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130603', '130600', '156-130000-130600-130603-', '北市区', '北市区', '', '', '', '130603', '071000', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130604', '130600', '156-130000-130600-130604-', '南市区', '南市区', '', '', '', '130604', '071000', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130621', '130600', '156-130000-130600-130621-', '满城县', '满城县', '', '', '', '130621', '072150', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130622', '130600', '156-130000-130600-130622-', '清苑县', '清苑县', '', '', '', '130622', '071100', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130623', '130600', '156-130000-130600-130623-', '涞水县', '涞水县', '', '', '', '130623', '074100', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130624', '130600', '156-130000-130600-130624-', '阜平县', '阜平县', '', '', '', '130624', '073200', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130625', '130600', '156-130000-130600-130625-', '徐水县', '徐水县', '', '', '', '130625', '072550', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130626', '130600', '156-130000-130600-130626-', '定兴县', '定兴县', '', '', '', '130626', '072650', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130627', '130600', '156-130000-130600-130627-', '唐县', '唐县', '', '', '', '130627', '072350', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130628', '130600', '156-130000-130600-130628-', '高阳县', '高阳县', '', '', '', '130628', '071500', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130629', '130600', '156-130000-130600-130629-', '容城县', '容城县', '', '', '', '130629', '071700', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130630', '130600', '156-130000-130600-130630-', '涞源县', '涞源县', '', '', '', '130630', '074300', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130631', '130600', '156-130000-130600-130631-', '望都县', '望都县', '', '', '', '130631', '072450', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130632', '130600', '156-130000-130600-130632-', '安新县', '安新县', '', '', '', '130632', '071600', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130633', '130600', '156-130000-130600-130633-', '易县', '易县', '', '', '', '130633', '074200', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130634', '130600', '156-130000-130600-130634-', '曲阳县', '曲阳县', '', '', '', '130634', '073100', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130635', '130600', '156-130000-130600-130635-', '蠡县', '蠡县', '', '', '', '130635', '071400', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130636', '130600', '156-130000-130600-130636-', '顺平县', '顺平县', '', '', '', '130636', '072250', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130637', '130600', '156-130000-130600-130637-', '博野县', '博野县', '', '', '', '130637', '071300', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130638', '130600', '156-130000-130600-130638-', '雄县', '雄县', '', '', '', '130638', '071800', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130681', '130600', '156-130000-130600-130681-', '涿州市', '涿州市', '', '', '', '130681', '072750', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130682', '130600', '156-130000-130600-130682-', '定州市', '定州市', '', '', '', '130682', '073000', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130683', '130600', '156-130000-130600-130683-', '安国市', '安国市', '', '', '', '130683', '071200', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130684', '130600', '156-130000-130600-130684-', '高碑店市', '高碑店市', '', '', '', '130684', '074000', '0312', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130700', '130000', '156-130000-130700-', '张家口', '张家口市', '', '', '', '130700', '075000', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130701', '130700', '156-130000-130700-130701-', '市辖区', '市辖区', '', '', '', '130701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130702', '130700', '156-130000-130700-130702-', '桥东区', '桥东区', '', '', '', '130702', '075000', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130703', '130700', '156-130000-130700-130703-', '桥西区', '桥西区', '', '', '', '130703', '075000', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130705', '130700', '156-130000-130700-130705-', '宣化区', '宣化区', '', '', '', '130705', '075000', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130706', '130700', '156-130000-130700-130706-', '下花园区', '下花园区', '', '', '', '130706', '075300', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130721', '130700', '156-130000-130700-130721-', '宣化县', '宣化县', '', '', '', '130721', '075100', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130722', '130700', '156-130000-130700-130722-', '张北县', '张北县', '', '', '', '130722', '076450', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130723', '130700', '156-130000-130700-130723-', '康保县', '康保县', '', '', '', '130723', '076650', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130724', '130700', '156-130000-130700-130724-', '沽源县', '沽源县', '', '', '', '130724', '076550', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130725', '130700', '156-130000-130700-130725-', '尚义县', '尚义县', '', '', '', '130725', '076750', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130726', '130700', '156-130000-130700-130726-', '蔚县', '蔚县', '', '', '', '130726', '075700', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130727', '130700', '156-130000-130700-130727-', '阳原县', '阳原县', '', '', '', '130727', '075800', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130728', '130700', '156-130000-130700-130728-', '怀安县', '怀安县', '', '', '', '130728', '076150', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130729', '130700', '156-130000-130700-130729-', '万全县', '万全县', '', '', '', '130729', '076250', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130730', '130700', '156-130000-130700-130730-', '怀来县', '怀来县', '', '', '', '130730', '075400', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130731', '130700', '156-130000-130700-130731-', '涿鹿县', '涿鹿县', '', '', '', '130731', '075600', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130732', '130700', '156-130000-130700-130732-', '赤城县', '赤城县', '', '', '', '130732', '075500', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130733', '130700', '156-130000-130700-130733-', '崇礼县', '崇礼县', '', '', '', '130733', '076350', '0313', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130800', '130000', '156-130000-130800-', '承德', '承德市', '', '', '', '130800', '067000', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130801', '130800', '156-130000-130800-130801-', '市辖区', '市辖区', '', '', '', '130801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130802', '130800', '156-130000-130800-130802-', '双桥区', '双桥区', '', '', '', '130802', '067000', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130803', '130800', '156-130000-130800-130803-', '双滦区', '双滦区', '', '', '', '130803', '067000', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130804', '130800', '156-130000-130800-130804-', '鹰手营子矿区', '鹰手营子矿区', '', '', '', '130804', '067200', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130821', '130800', '156-130000-130800-130821-', '承德县', '承德县', '', '', '', '130821', '067400', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130822', '130800', '156-130000-130800-130822-', '兴隆县', '兴隆县', '', '', '', '130822', '067300', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130823', '130800', '156-130000-130800-130823-', '平泉县', '平泉县', '', '', '', '130823', '067500', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130824', '130800', '156-130000-130800-130824-', '滦平县', '滦平县', '', '', '', '130824', '068250', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130825', '130800', '156-130000-130800-130825-', '隆化县', '隆化县', '', '', '', '130825', '068150', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130826', '130800', '156-130000-130800-130826-', '丰宁满族自治县', '丰宁满族自治县', '', '', '', '130826', '068350', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130827', '130800', '156-130000-130800-130827-', '宽城满族自治县', '宽城满族自治县', '', '', '', '130827', '067600', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130828', '130800', '156-130000-130800-130828-', '围场满族蒙古族自治县', '围场满族蒙古族自治县', '', '', '', '130828', '068450', '0314', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130900', '130000', '156-130000-130900-', '沧州', '沧州市', '', '', '', '130900', '061000', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130901', '130900', '156-130000-130900-130901-', '市辖区', '市辖区', '', '', '', '130901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130902', '130900', '156-130000-130900-130902-', '新华区', '新华区', '', '', '', '130902', '061000', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130903', '130900', '156-130000-130900-130903-', '运河区', '运河区', '', '', '', '130903', '061000', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130921', '130900', '156-130000-130900-130921-', '沧县', '沧县', '', '', '', '130921', '061000', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130922', '130900', '156-130000-130900-130922-', '青县', '青县', '', '', '', '130922', '062650', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130923', '130900', '156-130000-130900-130923-', '东光县', '东光县', '', '', '', '130923', '061600', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130924', '130900', '156-130000-130900-130924-', '海兴县', '海兴县', '', '', '', '130924', '061200', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130925', '130900', '156-130000-130900-130925-', '盐山县', '盐山县', '', '', '', '130925', '061300', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130926', '130900', '156-130000-130900-130926-', '肃宁县', '肃宁县', '', '', '', '130926', '062350', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130927', '130900', '156-130000-130900-130927-', '南皮县', '南皮县', '', '', '', '130927', '061500', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130928', '130900', '156-130000-130900-130928-', '吴桥县', '吴桥县', '', '', '', '130928', '061800', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130929', '130900', '156-130000-130900-130929-', '献县', '献县', '', '', '', '130929', '062250', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130930', '130900', '156-130000-130900-130930-', '孟村回族自治县', '孟村回族自治县', '', '', '', '130930', '061400', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130981', '130900', '156-130000-130900-130981-', '泊头市', '泊头市', '', '', '', '130981', '062150', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130982', '130900', '156-130000-130900-130982-', '任丘市', '任丘市', '', '', '', '130982', '062550', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130983', '130900', '156-130000-130900-130983-', '黄骅市', '黄骅市', '', '', '', '130983', '061100', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('130984', '130900', '156-130000-130900-130984-', '河间市', '河间市', '', '', '', '130984', '062450', '0317', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131000', '130000', '156-130000-131000-', '廊坊', '廊坊市', '', '', '', '131000', '065000', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131001', '131000', '156-130000-131000-131001-', '市辖区', '市辖区', '', '', '', '131001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131002', '131000', '156-130000-131000-131002-', '安次区', '安次区', '', '', '', '131002', '065000', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131003', '131000', '156-130000-131000-131003-', '广阳区', '广阳区', '', '', '', '131003', '065000', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131022', '131000', '156-130000-131000-131022-', '固安县', '固安县', '', '', '', '131022', '065500', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131023', '131000', '156-130000-131000-131023-', '永清县', '永清县', '', '', '', '131023', '065600', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131024', '131000', '156-130000-131000-131024-', '香河县', '香河县', '', '', '', '131024', '065400', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131025', '131000', '156-130000-131000-131025-', '大城县', '大城县', '', '', '', '131025', '065900', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131026', '131000', '156-130000-131000-131026-', '文安县', '文安县', '', '', '', '131026', '065800', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131028', '131000', '156-130000-131000-131028-', '大厂回族自治县', '大厂回族自治县', '', '', '', '131028', '065300', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131081', '131000', '156-130000-131000-131081-', '霸州市', '霸州市', '', '', '', '131081', '065700', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131082', '131000', '156-130000-131000-131082-', '三河市', '三河市', '', '', '', '131082', '065200', '0316', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131100', '130000', '156-130000-131100-', '衡水', '衡水市', '', '', '', '131100', '053000', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131101', '131100', '156-130000-131100-131101-', '市辖区', '市辖区', '', '', '', '131101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131102', '131100', '156-130000-131100-131102-', '桃城区', '桃城区', '', '', '', '131102', '053000', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131121', '131100', '156-130000-131100-131121-', '枣强县', '枣强县', '', '', '', '131121', '053100', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131122', '131100', '156-130000-131100-131122-', '武邑县', '武邑县', '', '', '', '131122', '053400', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131123', '131100', '156-130000-131100-131123-', '武强县', '武强县', '', '', '', '131123', '053300', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131124', '131100', '156-130000-131100-131124-', '饶阳县', '饶阳县', '', '', '', '131124', '053900', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131125', '131100', '156-130000-131100-131125-', '安平县', '安平县', '', '', '', '131125', '053600', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131126', '131100', '156-130000-131100-131126-', '故城县', '故城县', '', '', '', '131126', '253800', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131127', '131100', '156-130000-131100-131127-', '景县', '景县', '', '', '', '131127', '053500', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131128', '131100', '156-130000-131100-131128-', '阜城县', '阜城县', '', '', '', '131128', '053700', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131181', '131100', '156-130000-131100-131181-', '冀州市', '冀州市', '', '', '', '131181', '053200', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('131182', '131100', '156-130000-131100-131182-', '深州市', '深州市', '', '', '', '131182', '052800', '0318', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140000', '156', '156-140000-', '山西', '山西省', 'ShanXi', 'ShanXi', 'SX', '140000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140100', '140000', '156-140000-140100-', '太原', '太原市', '', '', '', '140100', '030000', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140101', '140100', '156-140000-140100-140101-', '市辖区', '市辖区', '', '', '', '140101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140105', '140100', '156-140000-140100-140105-', '小店区', '小店区', '', '', '', '140105', '030000', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140106', '140100', '156-140000-140100-140106-', '迎泽区', '迎泽区', '', '', '', '140106', '030000', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140107', '140100', '156-140000-140100-140107-', '杏花岭区', '杏花岭区', '', '', '', '140107', '030000', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140108', '140100', '156-140000-140100-140108-', '尖草坪区', '尖草坪区', '', '', '', '140108', '030000', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140109', '140100', '156-140000-140100-140109-', '万柏林区', '万柏林区', '', '', '', '140109', '030000', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140110', '140100', '156-140000-140100-140110-', '晋源区', '晋源区', '', '', '', '140110', '030000', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140121', '140100', '156-140000-140100-140121-', '清徐县', '清徐县', '', '', '', '140121', '030400', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140122', '140100', '156-140000-140100-140122-', '阳曲县', '阳曲县', '', '', '', '140122', '030100', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140123', '140100', '156-140000-140100-140123-', '娄烦县', '娄烦县', '', '', '', '140123', '030300', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140181', '140100', '156-140000-140100-140181-', '古交市', '古交市', '', '', '', '140181', '030200', '0351', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140200', '140000', '156-140000-140200-', '大同', '大同市', '', '', '', '140200', '037000', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140201', '140200', '156-140000-140200-140201-', '市辖区', '市辖区', '', '', '', '140201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140202', '140200', '156-140000-140200-140202-', '城区', '城区', '', '', '', '140202', '037000', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140203', '140200', '156-140000-140200-140203-', '矿区', '矿区', '', '', '', '140203', '037000', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140211', '140200', '156-140000-140200-140211-', '南郊区', '南郊区', '', '', '', '140211', '037000', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140212', '140200', '156-140000-140200-140212-', '新荣区', '新荣区', '', '', '', '140212', '037000', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140221', '140200', '156-140000-140200-140221-', '阳高县', '阳高县', '', '', '', '140221', '038100', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140222', '140200', '156-140000-140200-140222-', '天镇县', '天镇县', '', '', '', '140222', '038200', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140223', '140200', '156-140000-140200-140223-', '广灵县', '广灵县', '', '', '', '140223', '037500', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140224', '140200', '156-140000-140200-140224-', '灵丘县', '灵丘县', '', '', '', '140224', '034400', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140225', '140200', '156-140000-140200-140225-', '浑源县', '浑源县', '', '', '', '140225', '037400', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140226', '140200', '156-140000-140200-140226-', '左云县', '左云县', '', '', '', '140226', '037100', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140227', '140200', '156-140000-140200-140227-', '大同县', '大同县', '', '', '', '140227', '037300', '0352', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140300', '140000', '156-140000-140300-', '阳泉', '阳泉市', '', '', '', '140300', '045000', '0353', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140301', '140300', '156-140000-140300-140301-', '市辖区', '市辖区', '', '', '', '140301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140302', '140300', '156-140000-140300-140302-', '城区', '城区', '', '', '', '140302', '045000', '0353', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140303', '140300', '156-140000-140300-140303-', '矿区', '矿区', '', '', '', '140303', '045000', '0353', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140311', '140300', '156-140000-140300-140311-', '郊区', '郊区', '', '', '', '140311', '045000', '0353', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140321', '140300', '156-140000-140300-140321-', '平定县', '平定县', '', '', '', '140321', '045200', '0353', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140322', '140300', '156-140000-140300-140322-', '盂县', '盂县', '', '', '', '140322', '045100', '0353', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140400', '140000', '156-140000-140400-', '长治', '长治市', '', '', '', '140400', '046000', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140401', '140400', '156-140000-140400-140401-', '市辖区', '市辖区', '', '', '', '140401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140402', '140400', '156-140000-140400-140402-', '城区', '城区', '', '', '', '140402', '046000', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140411', '140400', '156-140000-140400-140411-', '郊区', '郊区', '', '', '', '140411', '046000', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140421', '140400', '156-140000-140400-140421-', '长治县', '长治县', '', '', '', '140421', '047100', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140423', '140400', '156-140000-140400-140423-', '襄垣县', '襄垣县', '', '', '', '140423', '046200', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140424', '140400', '156-140000-140400-140424-', '屯留县', '屯留县', '', '', '', '140424', '046100', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140425', '140400', '156-140000-140400-140425-', '平顺县', '平顺县', '', '', '', '140425', '047400', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140426', '140400', '156-140000-140400-140426-', '黎城县', '黎城县', '', '', '', '140426', '047600', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140427', '140400', '156-140000-140400-140427-', '壶关县', '壶关县', '', '', '', '140427', '047300', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140428', '140400', '156-140000-140400-140428-', '长子县', '长子县', '', '', '', '140428', '046600', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140429', '140400', '156-140000-140400-140429-', '武乡县', '武乡县', '', '', '', '140429', '046300', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140430', '140400', '156-140000-140400-140430-', '沁县', '沁县', '', '', '', '140430', '046400', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140431', '140400', '156-140000-140400-140431-', '沁源县', '沁源县', '', '', '', '140431', '046500', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140481', '140400', '156-140000-140400-140481-', '潞城市', '潞城市', '', '', '', '140481', '047500', '0355', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140500', '140000', '156-140000-140500-', '晋城', '晋城市', '', '', '', '140500', '048000', '0356', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140501', '140500', '156-140000-140500-140501-', '市辖区', '晋城市市辖区', '', '', '', '140501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140502', '140500', '156-140000-140500-140502-', '城区', '城区', '', '', '', '140502', '048000', '0356', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140521', '140500', '156-140000-140500-140521-', '沁水县', '沁水县', '', '', '', '140521', '048200', '0356', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140522', '140500', '156-140000-140500-140522-', '阳城县', '阳城县', '', '', '', '140522', '048100', '0356', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140524', '140500', '156-140000-140500-140524-', '陵川县', '陵川县', '', '', '', '140524', '048300', '0356', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140525', '140500', '156-140000-140500-140525-', '泽州县', '泽州县', '', '', '', '140525', '048000', '0356', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140581', '140500', '156-140000-140500-140581-', '高平市', '高平市', '', '', '', '140581', '046700', '0356', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140600', '140000', '156-140000-140600-', '朔州', '朔州市', '', '', '', '140600', '036000', '0349', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140601', '140600', '156-140000-140600-140601-', '市辖区', '市辖区', '', '', '', '140601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140602', '140600', '156-140000-140600-140602-', '朔城区', '朔城区', '', '', '', '140602', '036002', '0349', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140603', '140600', '156-140000-140600-140603-', '平鲁区', '平鲁区', '', '', '', '140603', '036800', '0349', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140621', '140600', '156-140000-140600-140621-', '山阴县', '山阴县', '', '', '', '140621', '036900', '0349', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140622', '140600', '156-140000-140600-140622-', '应县', '应县', '', '', '', '140622', '037600', '0349', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140623', '140600', '156-140000-140600-140623-', '右玉县', '右玉县', '', '', '', '140623', '037200', '0349', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140624', '140600', '156-140000-140600-140624-', '怀仁县', '怀仁县', '', '', '', '140624', '038300', '0349', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140700', '140000', '156-140000-140700-', '晋中', '晋中市', '', '', '', '140700', '030600', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140701', '140700', '156-140000-140700-140701-', '市辖区', '市辖区', '', '', '', '140701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140702', '140700', '156-140000-140700-140702-', '榆次区', '榆次区', '', '', '', '140702', '030600', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140721', '140700', '156-140000-140700-140721-', '榆社县', '榆社县', '', '', '', '140721', '031800', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140722', '140700', '156-140000-140700-140722-', '左权县', '左权县', '', '', '', '140722', '032600', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140723', '140700', '156-140000-140700-140723-', '和顺县', '和顺县', '', '', '', '140723', '032700', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140724', '140700', '156-140000-140700-140724-', '昔阳县', '昔阳县', '', '', '', '140724', '045300', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140725', '140700', '156-140000-140700-140725-', '寿阳县', '寿阳县', '', '', '', '140725', '045400', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140726', '140700', '156-140000-140700-140726-', '太谷县', '太谷县', '', '', '', '140726', '030800', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140727', '140700', '156-140000-140700-140727-', '祁县', '祁县', '', '', '', '140727', '030900', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140728', '140700', '156-140000-140700-140728-', '平遥县', '平遥县', '', '', '', '140728', '031100', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140729', '140700', '156-140000-140700-140729-', '灵石县', '灵石县', '', '', '', '140729', '031300', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140781', '140700', '156-140000-140700-140781-', '介休市', '介休市', '', '', '', '140781', '032000', '0354', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140800', '140000', '156-140000-140800-', '运城', '运城市', '', '', '', '140800', '044000', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140801', '140800', '156-140000-140800-140801-', '市辖区', '市辖区', '', '', '', '140801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140802', '140800', '156-140000-140800-140802-', '盐湖区', '盐湖区', '', '', '', '140802', '044000', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140821', '140800', '156-140000-140800-140821-', '临猗县', '临猗县', '', '', '', '140821', '044100', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140822', '140800', '156-140000-140800-140822-', '万荣县', '万荣县', '', '', '', '140822', '044200', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140823', '140800', '156-140000-140800-140823-', '闻喜县', '闻喜县', '', '', '', '140823', '043800', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140824', '140800', '156-140000-140800-140824-', '稷山县', '稷山县', '', '', '', '140824', '043200', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140825', '140800', '156-140000-140800-140825-', '新绛县', '新绛县', '', '', '', '140825', '043100', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140826', '140800', '156-140000-140800-140826-', '绛县', '绛县', '', '', '', '140826', '043600', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140827', '140800', '156-140000-140800-140827-', '垣曲县', '垣曲县', '', '', '', '140827', '043700', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140828', '140800', '156-140000-140800-140828-', '夏县', '夏县', '', '', '', '140828', '044400', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140829', '140800', '156-140000-140800-140829-', '平陆县', '平陆县', '', '', '', '140829', '044300', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140830', '140800', '156-140000-140800-140830-', '芮城县', '芮城县', '', '', '', '140830', '044600', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140881', '140800', '156-140000-140800-140881-', '永济市', '永济市', '', '', '', '140881', '044500', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140882', '140800', '156-140000-140800-140882-', '河津市', '河津市', '', '', '', '140882', '043300', '0359', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140900', '140000', '156-140000-140900-', '忻州', '忻州市', '', '', '', '140900', '034000', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140901', '140900', '156-140000-140900-140901-', '市辖区', '市辖区', '', '', '', '140901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140902', '140900', '156-140000-140900-140902-', '忻府区', '忻府区', '', '', '', '140902', '034000', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140921', '140900', '156-140000-140900-140921-', '定襄县', '定襄县', '', '', '', '140921', '035400', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140922', '140900', '156-140000-140900-140922-', '五台县', '五台县', '', '', '', '140922', '035500', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140923', '140900', '156-140000-140900-140923-', '代县', '代县', '', '', '', '140923', '034200', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140924', '140900', '156-140000-140900-140924-', '繁峙县', '繁峙县', '', '', '', '140924', '034300', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140925', '140900', '156-140000-140900-140925-', '宁武县', '宁武县', '', '', '', '140925', '036000', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140926', '140900', '156-140000-140900-140926-', '静乐县', '静乐县', '', '', '', '140926', '035100', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140927', '140900', '156-140000-140900-140927-', '神池县', '神池县', '', '', '', '140927', '036100', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140928', '140900', '156-140000-140900-140928-', '五寨县', '五寨县', '', '', '', '140928', '036200', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140929', '140900', '156-140000-140900-140929-', '岢岚县', '岢岚县', '', '', '', '140929', '036300', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140930', '140900', '156-140000-140900-140930-', '河曲县', '河曲县', '', '', '', '140930', '036500', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140931', '140900', '156-140000-140900-140931-', '保德县', '保德县', '', '', '', '140931', '036600', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140932', '140900', '156-140000-140900-140932-', '偏关县', '偏关县', '', '', '', '140932', '036400', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('140981', '140900', '156-140000-140900-140981-', '原平市', '原平市', '', '', '', '140981', '034100', '0350', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141000', '140000', '156-140000-141000-', '临汾', '临汾市', '', '', '', '141000', '041000', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141001', '141000', '156-140000-141000-141001-', '市辖区', '市辖区', '', '', '', '141001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141002', '141000', '156-140000-141000-141002-', '尧都区', '尧都区', '', '', '', '141002', '041000', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141021', '141000', '156-140000-141000-141021-', '曲沃县', '曲沃县', '', '', '', '141021', '043400', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141022', '141000', '156-140000-141000-141022-', '翼城县', '翼城县', '', '', '', '141022', '043500', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141023', '141000', '156-140000-141000-141023-', '襄汾县', '襄汾县', '', '', '', '141023', '041500', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141024', '141000', '156-140000-141000-141024-', '洪洞县', '洪洞县', '', '', '', '141024', '041600', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141025', '141000', '156-140000-141000-141025-', '古县', '古县', '', '', '', '141025', '042400', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141026', '141000', '156-140000-141000-141026-', '安泽县', '安泽县', '', '', '', '141026', '042500', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141027', '141000', '156-140000-141000-141027-', '浮山县', '浮山县', '', '', '', '141027', '042600', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141028', '141000', '156-140000-141000-141028-', '吉县', '吉县', '', '', '', '141028', '042200', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141029', '141000', '156-140000-141000-141029-', '乡宁县', '乡宁县', '', '', '', '141029', '042100', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141030', '141000', '156-140000-141000-141030-', '大宁县', '大宁县', '', '', '', '141030', '042300', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141031', '141000', '156-140000-141000-141031-', '隰县', '隰县', '', '', '', '141031', '041300', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141032', '141000', '156-140000-141000-141032-', '永和县', '永和县', '', '', '', '141032', '041400', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141033', '141000', '156-140000-141000-141033-', '蒲县', '蒲县', '', '', '', '141033', '041200', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141034', '141000', '156-140000-141000-141034-', '汾西县', '汾西县', '', '', '', '141034', '031500', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141081', '141000', '156-140000-141000-141081-', '侯马市', '侯马市', '', '', '', '141081', '043000', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141082', '141000', '156-140000-141000-141082-', '霍州市', '霍州市', '', '', '', '141082', '031400', '0357', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141100', '140000', '156-140000-141100-', '吕梁', '吕梁市', '', '', '', '141100', '033000', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141101', '141100', '156-140000-141100-141101-', '市辖区', '市辖区', '', '', '', '141101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141102', '141100', '156-140000-141100-141102-', '离石区', '离石区', '', '', '', '141102', '033000', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141121', '141100', '156-140000-141100-141121-', '文水县', '文水县', '', '', '', '141121', '032100', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141122', '141100', '156-140000-141100-141122-', '交城县', '交城县', '', '', '', '141122', '030500', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141123', '141100', '156-140000-141100-141123-', '兴县', '兴县', '', '', '', '141123', '035300', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141124', '141100', '156-140000-141100-141124-', '临县', '临县', '', '', '', '141124', '033200', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141125', '141100', '156-140000-141100-141125-', '柳林县', '柳林县', '', '', '', '141125', '033300', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141126', '141100', '156-140000-141100-141126-', '石楼县', '石楼县', '', '', '', '141126', '032500', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141127', '141100', '156-140000-141100-141127-', '岚县', '岚县', '', '', '', '141127', '035200', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141128', '141100', '156-140000-141100-141128-', '方山县', '方山县', '', '', '', '141128', '033100', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141129', '141100', '156-140000-141100-141129-', '中阳县', '中阳县', '', '', '', '141129', '033400', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141130', '141100', '156-140000-141100-141130-', '交口县', '交口县', '', '', '', '141130', '032400', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141181', '141100', '156-140000-141100-141181-', '孝义市', '孝义市', '', '', '', '141181', '032300', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('141182', '141100', '156-140000-141100-141182-', '汾阳市', '汾阳市', '', '', '', '141182', '032200', '0358', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150000', '156', '156-150000-', '内蒙古', '内蒙古自治区', 'InnerMongolia', 'InnerMongolia', 'NM', '150000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150100', '150000', '156-150000-150100-', '呼和浩特', '呼和浩特市', '', '', '', '150100', '010000', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150101', '150100', '156-150000-150100-150101-', '市辖区', '市辖区', '', '', '', '150101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150102', '150100', '156-150000-150100-150102-', '新城区', '新城区', '', '', '', '150102', '010000', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150103', '150100', '156-150000-150100-150103-', '回民区', '回民区', '', '', '', '150103', '010000', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150104', '150100', '156-150000-150100-150104-', '玉泉区', '玉泉区', '', '', '', '150104', '010000', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150105', '150100', '156-150000-150100-150105-', '赛罕区', '赛罕区', '', '', '', '150105', '0', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150121', '150100', '156-150000-150100-150121-', '土默特左旗', '土默特左旗', '', '', '', '150121', '010100', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150122', '150100', '156-150000-150100-150122-', '托克托县', '托克托县', '', '', '', '150122', '010200', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150123', '150100', '156-150000-150100-150123-', '和林格尔县', '和林格尔县', '', '', '', '150123', '011500', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150124', '150100', '156-150000-150100-150124-', '清水河县', '清水河县', '', '', '', '150124', '011600', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150125', '150100', '156-150000-150100-150125-', '武川县', '武川县', '', '', '', '150125', '011700', '0471', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150200', '150000', '156-150000-150200-', '包头', '包头市', '', '', '', '150200', '014000', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150201', '150200', '156-150000-150200-150201-', '市辖区', '市辖区', '', '', '', '150201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150202', '150200', '156-150000-150200-150202-', '东河区', '东河区', '', '', '', '150202', '014040', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150203', '150200', '156-150000-150200-150203-', '昆都仑区', '昆都仑区', '', '', '', '150203', '014010', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150204', '150200', '156-150000-150200-150204-', '青山区', '青山区', '', '', '', '150204', '014000', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150205', '150200', '156-150000-150200-150205-', '石拐区', '石拐区', '', '', '', '150205', '014070', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150206', '150200', '156-150000-150200-150206-', '白云矿区', '白云鄂博矿区', '', '', '', '150206', '014000', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150207', '150200', '156-150000-150200-150207-', '九原区', '九原区', '', '', '', '150207', '014000', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150221', '150200', '156-150000-150200-150221-', '土默特右旗', '土默特右旗', '', '', '', '150221', '014100', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150222', '150200', '156-150000-150200-150222-', '固阳县', '固阳县', '', '', '', '150222', '014200', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150223', '150200', '156-150000-150200-150223-', '达尔罕茂明安联合旗', '达尔罕茂明安联合旗', '', '', '', '150223', '014500', '0472', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150300', '150000', '156-150000-150300-', '乌海', '乌海市', '', '', '', '150300', '016000', '0473', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150301', '150300', '156-150000-150300-150301-', '市辖区', '市辖区', '', '', '', '150301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150302', '150300', '156-150000-150300-150302-', '海勃湾区', '海勃湾区', '', '', '', '150302', '016000', '0473', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150303', '150300', '156-150000-150300-150303-', '海南区', '海南区', '', '', '', '150303', '016000', '0473', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150304', '150300', '156-150000-150300-150304-', '乌达区', '乌达区', '', '', '', '150304', '016000', '0473', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150400', '150000', '156-150000-150400-', '赤峰', '赤峰市', '', '', '', '150400', '024000', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150401', '150400', '156-150000-150400-150401-', '市辖区', '市辖区', '', '', '', '150401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150402', '150400', '156-150000-150400-150402-', '红山区', '红山区', '', '', '', '150402', '024000', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150403', '150400', '156-150000-150400-150403-', '元宝山区', '元宝山区', '', '', '', '150403', '024000', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150404', '150400', '156-150000-150400-150404-', '松山区', '松山区', '', '', '', '150404', '024000', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150421', '150400', '156-150000-150400-150421-', '阿鲁科尔沁旗', '阿鲁科尔沁旗', '', '', '', '150421', '025500', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150422', '150400', '156-150000-150400-150422-', '巴林左旗', '巴林左旗', '', '', '', '150422', '025450', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150423', '150400', '156-150000-150400-150423-', '巴林右旗', '巴林右旗', '', '', '', '150423', '025150', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150424', '150400', '156-150000-150400-150424-', '林西县', '林西县', '', '', '', '150424', '025250', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150425', '150400', '156-150000-150400-150425-', '克什克腾旗', '克什克腾旗', '', '', '', '150425', '025350', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150426', '150400', '156-150000-150400-150426-', '翁牛特旗', '翁牛特旗', '', '', '', '150426', '024500', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150428', '150400', '156-150000-150400-150428-', '喀喇沁旗', '喀喇沁旗', '', '', '', '150428', '024400', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150429', '150400', '156-150000-150400-150429-', '宁城县', '宁城县', '', '', '', '150429', '024200', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150430', '150400', '156-150000-150400-150430-', '敖汉旗', '敖汉旗', '', '', '', '150430', '024300', '0476', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150500', '150000', '156-150000-150500-', '通辽', '通辽市', '', '', '', '150500', '028000', '0475', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150501', '150500', '156-150000-150500-150501-', '市辖区', '市辖区', '', '', '', '150501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150502', '150500', '156-150000-150500-150502-', '科尔沁区', '科尔沁区', '', '', '', '150502', '028000', '0475', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150521', '150500', '156-150000-150500-150521-', '科尔沁左翼中旗', '科尔沁左翼中旗', '', '', '', '150521', '029300', '0475', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150522', '150500', '156-150000-150500-150522-', '科尔沁左翼后旗', '科尔沁左翼后旗', '', '', '', '150522', '028100', '0475', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150523', '150500', '156-150000-150500-150523-', '开鲁县', '开鲁县', '', '', '', '150523', '028400', '0475', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150524', '150500', '156-150000-150500-150524-', '库伦旗', '库伦旗', '', '', '', '150524', '028200', '0475', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150525', '150500', '156-150000-150500-150525-', '奈曼旗', '奈曼旗', '', '', '', '150525', '028300', '0475', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150526', '150500', '156-150000-150500-150526-', '扎鲁特旗', '扎鲁特旗', '', '', '', '150526', '029100', '0475', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150581', '150500', '156-150000-150500-150581-', '霍林郭勒市', '霍林郭勒市', '', '', '', '150581', '029200', '0475', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150600', '150000', '156-150000-150600-', '鄂尔多斯', '鄂尔多斯市', '', '', '', '150600', '017000', '0477', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150601', '150600', '156-150000-150600-150601-', '市辖区', '市辖区', '', '', '', '150601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150602', '150600', '156-150000-150600-150602-', '东胜区', '东胜区', '', '', '', '150602', '017000', '0477', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150621', '150600', '156-150000-150600-150621-', '达拉特旗', '达拉特旗', '', '', '', '150621', '014300', '0477', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150622', '150600', '156-150000-150600-150622-', '准格尔旗', '准格尔旗', '', '', '', '150622', '017100', '0477', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150623', '150600', '156-150000-150600-150623-', '鄂托克前旗', '鄂托克前旗', '', '', '', '150623', '016200', '0477', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150624', '150600', '156-150000-150600-150624-', '鄂托克旗', '鄂托克旗', '', '', '', '150624', '016100', '0477', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150625', '150600', '156-150000-150600-150625-', '杭锦旗', '杭锦旗', '', '', '', '150625', '017400', '0477', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150626', '150600', '156-150000-150600-150626-', '乌审旗', '乌审旗', '', '', '', '150626', '017300', '0477', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150627', '150600', '156-150000-150600-150627-', '伊金霍洛旗', '伊金霍洛旗', '', '', '', '150627', '017200', '0477', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150700', '150000', '156-150000-150700-', '呼伦贝尔', '呼伦贝尔市', '', '', '', '150700', '021000', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150701', '150700', '156-150000-150700-150701-', '市辖区', '市辖区', '', '', '', '150701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150702', '150700', '156-150000-150700-150702-', '海拉尔区', '海拉尔区', '', '', '', '150702', '021000', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150721', '150700', '156-150000-150700-150721-', '阿荣旗', '阿荣旗', '', '', '', '150721', '162750', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150722', '150700', '156-150000-150700-150722-', '莫力达瓦达斡尔族自治旗', '莫力达瓦达斡尔族自治旗', '', '', '', '150722', '162850', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150723', '150700', '156-150000-150700-150723-', '鄂伦春自治旗', '鄂伦春自治旗', '', '', '', '150723', '022450', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150724', '150700', '156-150000-150700-150724-', '鄂温克族自治旗', '鄂温克族自治旗', '', '', '', '150724', '021100', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150725', '150700', '156-150000-150700-150725-', '陈巴尔虎旗', '陈巴尔虎旗', '', '', '', '150725', '021500', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150726', '150700', '156-150000-150700-150726-', '新巴尔虎左旗', '新巴尔虎左旗', '', '', '', '150726', '021200', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150727', '150700', '156-150000-150700-150727-', '新巴尔虎右旗', '新巴尔虎右旗', '', '', '', '150727', '021300', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150781', '150700', '156-150000-150700-150781-', '满洲里市', '满洲里市', '', '', '', '150781', '021400', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150782', '150700', '156-150000-150700-150782-', '牙克石市', '牙克石市', '', '', '', '150782', '022150', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150783', '150700', '156-150000-150700-150783-', '扎兰屯市', '扎兰屯市', '', '', '', '150783', '162650', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150784', '150700', '156-150000-150700-150784-', '额尔古纳市', '额尔古纳市', '', '', '', '150784', '022250', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150785', '150700', '156-150000-150700-150785-', '根河市', '根河市', '', '', '', '150785', '022350', '0470', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150800', '150000', '156-150000-150800-', '巴彦淖尔', '巴彦淖尔市', '', '', '', '150800', '015000', '0478', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150801', '150800', '156-150000-150800-150801-', '市辖区', '市辖区', '', '', '', '150801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150802', '150800', '156-150000-150800-150802-', '临河区', '临河区', '', '', '', '150802', '015000', '0478', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150821', '150800', '156-150000-150800-150821-', '五原县', '五原县', '', '', '', '150821', '015100', '0478', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150822', '150800', '156-150000-150800-150822-', '磴口县', '磴口县', '', '', '', '150822', '015200', '0478', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150823', '150800', '156-150000-150800-150823-', '乌拉特前旗', '乌拉特前旗', '', '', '', '150823', '014400', '0478', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150824', '150800', '156-150000-150800-150824-', '乌拉特中旗', '乌拉特中旗', '', '', '', '150824', '015300', '0478', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150825', '150800', '156-150000-150800-150825-', '乌拉特后旗', '乌拉特后旗', '', '', '', '150825', '015500', '0478', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150826', '150800', '156-150000-150800-150826-', '杭锦后旗', '杭锦后旗', '', '', '', '150826', '015400', '0478', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150900', '150000', '156-150000-150900-', '乌兰察布', '乌兰察布市', '', '', '', '150900', '012000', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150901', '150900', '156-150000-150900-150901-', '市辖区', '市辖区', '', '', '', '150901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150902', '150900', '156-150000-150900-150902-', '集宁区', '集宁区', '', '', '', '150902', '012000', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150921', '150900', '156-150000-150900-150921-', '卓资县', '卓资县', '', '', '', '150921', '012300', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150922', '150900', '156-150000-150900-150922-', '化德县', '化德县', '', '', '', '150922', '013350', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150923', '150900', '156-150000-150900-150923-', '商都县', '商都县', '', '', '', '150923', '013400', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150924', '150900', '156-150000-150900-150924-', '兴和县', '兴和县', '', '', '', '150924', '013650', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150925', '150900', '156-150000-150900-150925-', '凉城县', '凉城县', '', '', '', '150925', '013750', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150926', '150900', '156-150000-150900-150926-', '察哈尔右翼前旗', '察哈尔右翼前旗', '', '', '', '150926', '012200', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150927', '150900', '156-150000-150900-150927-', '察哈尔右翼中旗', '察哈尔右翼中旗', '', '', '', '150927', '013500', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150928', '150900', '156-150000-150900-150928-', '察哈尔右翼后旗', '察哈尔右翼后旗', '', '', '', '150928', '012400', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150929', '150900', '156-150000-150900-150929-', '四子王旗', '四子王旗', '', '', '', '150929', '011800', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('150981', '150900', '156-150000-150900-150981-', '丰镇市', '丰镇市', '', '', '', '150981', '012100', '0474', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152200', '150000', '156-150000-152200-', '兴安盟', '兴安盟', '', '', '', '152200', '137400', '0482', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152201', '152200', '156-150000-152200-152201-', '乌兰浩特市', '乌兰浩特市', '', '', '', '152201', '137400', '0482', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152202', '152200', '156-150000-152200-152202-', '阿尔山市', '阿尔山市', '', '', '', '152202', '137400', '0482', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152221', '152200', '156-150000-152200-152221-', '科尔沁右翼前旗', '科尔沁右翼前旗', '', '', '', '152221', '137400', '0482', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152222', '152200', '156-150000-152200-152222-', '科尔沁右翼中旗', '科尔沁右翼中旗', '', '', '', '152222', '029400', '0482', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152223', '152200', '156-150000-152200-152223-', '扎赉特旗', '扎赉特旗', '', '', '', '152223', '137600', '0482', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152224', '152200', '156-150000-152200-152224-', '突泉县', '突泉县', '', '', '', '152224', '137500', '0482', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152500', '150000', '156-150000-152500-', '锡林郭勒盟', '锡林郭勒盟', '', '', '', '152500', '026000', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152501', '152500', '156-150000-152500-152501-', '二连浩特市', '二连浩特市', '', '', '', '152501', '012600', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152502', '152500', '156-150000-152500-152502-', '锡林浩特市', '锡林浩特市', '', '', '', '152502', '026000', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152522', '152500', '156-150000-152500-152522-', '阿巴嘎旗', '阿巴嘎旗', '', '', '', '152522', '011400', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152523', '152500', '156-150000-152500-152523-', '苏尼特左旗', '苏尼特左旗', '', '', '', '152523', '011300', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152524', '152500', '156-150000-152500-152524-', '苏尼特右旗', '苏尼特右旗', '', '', '', '152524', '011200', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152525', '152500', '156-150000-152500-152525-', '东乌珠穆沁旗', '东乌珠穆沁旗', '', '', '', '152525', '026300', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152526', '152500', '156-150000-152500-152526-', '西乌珠穆沁旗', '西乌珠穆沁旗', '', '', '', '152526', '026200', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152527', '152500', '156-150000-152500-152527-', '太仆寺旗', '太仆寺旗', '', '', '', '152527', '027000', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152528', '152500', '156-150000-152500-152528-', '镶黄旗', '镶黄旗', '', '', '', '152528', '013250', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152529', '152500', '156-150000-152500-152529-', '正镶白旗', '正镶白旗', '', '', '', '152529', '013800', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152530', '152500', '156-150000-152500-152530-', '正蓝旗', '正蓝旗', '', '', '', '152530', '027200', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152531', '152500', '156-150000-152500-152531-', '多伦县', '多伦县', '', '', '', '152531', '027300', '0479', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152900', '150000', '156-150000-152900-', '阿拉善盟', '阿拉善盟', '', '', '', '152900', '735000', '0483', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152921', '152900', '156-150000-152900-152921-', '阿拉善左旗', '阿拉善左旗', '', '', '', '152921', '750300', '0483', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152922', '152900', '156-150000-152900-152922-', '阿拉善右旗', '阿拉善右旗', '', '', '', '152922', '737300', '0483', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('152923', '152900', '156-150000-152900-152923-', '额济纳旗', '额济纳旗', '', '', '', '152923', '735400', '0483', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210000', '156', '156-210000-', '辽宁', '辽宁省', 'LiaoNing', 'LiaoNing', 'LN', '210000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210100', '210000', '156-210000-210100-', '沈阳', '沈阳市', '', '', '', '210100', '110000', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210101', '210100', '156-210000-210100-210101-', '市辖区', '市辖区', '', '', '', '210101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210102', '210100', '156-210000-210100-210102-', '和平区', '和平区', '', '', '', '210102', '110000', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210103', '210100', '156-210000-210100-210103-', '沈河区', '沈河区', '', '', '', '210103', '110000', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210104', '210100', '156-210000-210100-210104-', '大东区', '大东区', '', '', '', '210104', '110000', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210105', '210100', '156-210000-210100-210105-', '皇姑区', '皇姑区', '', '', '', '210105', '110000', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210106', '210100', '156-210000-210100-210106-', '铁西区', '铁西区', '', '', '', '210106', '110020', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210111', '210100', '156-210000-210100-210111-', '苏家屯区', '苏家屯区', '', '', '', '210111', '110100', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210112', '210100', '156-210000-210100-210112-', '东陵区', '东陵区', '', '', '', '210112', '110000', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210113', '210100', '156-210000-210100-210113-', '沈北新区', '沈北新区', '', '', '', '210113', '110000', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210114', '210100', '156-210000-210100-210114-', '于洪区', '于洪区', '', '', '', '210114', '110000', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210122', '210100', '156-210000-210100-210122-', '辽中县', '辽中县', '', '', '', '210122', '110200', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210123', '210100', '156-210000-210100-210123-', '康平县', '康平县', '', '', '', '210123', '110500', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210124', '210100', '156-210000-210100-210124-', '法库县', '法库县', '', '', '', '210124', '110400', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210181', '210100', '156-210000-210100-210181-', '新民市', '新民市', '', '', '', '210181', '110300', '024', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210200', '210000', '156-210000-210200-', '大连', '大连市', '', '', '', '210200', '116000', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210201', '210200', '156-210000-210200-210201-', '市辖区', '市辖区', '', '', '', '210201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210202', '210200', '156-210000-210200-210202-', '中山区', '中山区', '', '', '', '210202', '116000', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210203', '210200', '156-210000-210200-210203-', '西岗区', '西岗区', '', '', '', '210203', '116000', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210204', '210200', '156-210000-210200-210204-', '沙河口区', '沙河口区', '', '', '', '210204', '116000', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210211', '210200', '156-210000-210200-210211-', '甘井子区', '甘井子区', '', '', '', '210211', '116000', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210212', '210200', '156-210000-210200-210212-', '旅顺口区', '旅顺口区', '', '', '', '210212', '116000', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210213', '210200', '156-210000-210200-210213-', '金州区', '金州区', '', '', '', '210213', '116000', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210224', '210200', '156-210000-210200-210224-', '长海县', '长海县', '', '', '', '210224', '116500', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210281', '210200', '156-210000-210200-210281-', '瓦房店市', '瓦房店市', '', '', '', '210281', '116300', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210282', '210200', '156-210000-210200-210282-', '普兰店市', '普兰店市', '', '', '', '210282', '116200', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210283', '210200', '156-210000-210200-210283-', '庄河市', '庄河市', '', '', '', '210283', '116400', '0411', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210300', '210000', '156-210000-210300-', '鞍山', '鞍山市', '', '', '', '210300', '114000', '0412', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210301', '210300', '156-210000-210300-210301-', '市辖区', '市辖区', '', '', '', '210301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210302', '210300', '156-210000-210300-210302-', '铁东区', '铁东区', '', '', '', '210302', '114000', '0412', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210303', '210300', '156-210000-210300-210303-', '铁西区', '铁西区', '', '', '', '210303', '114000', '0412', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210304', '210300', '156-210000-210300-210304-', '立山区', '立山区', '', '', '', '210304', '114000', '0412', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210311', '210300', '156-210000-210300-210311-', '千山区', '千山区', '', '', '', '210311', '114000', '0412', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210321', '210300', '156-210000-210300-210321-', '台安县', '台安县', '', '', '', '210321', '114100', '0412', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210323', '210300', '156-210000-210300-210323-', '岫岩满族自治县', '岫岩满族自治县', '', '', '', '210323', '114300', '0412', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210381', '210300', '156-210000-210300-210381-', '海城市', '海城市', '', '', '', '210381', '114200', '0412', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210400', '210000', '156-210000-210400-', '抚顺', '抚顺市', '', '', '', '210400', '113000', '0413', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210401', '210400', '156-210000-210400-210401-', '市辖区', '市辖区', '', '', '', '210401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210402', '210400', '156-210000-210400-210402-', '新抚区', '新抚区', '', '', '', '210402', '113000', '0413', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210403', '210400', '156-210000-210400-210403-', '东洲区', '东洲区', '', '', '', '210403', '113000', '0413', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210404', '210400', '156-210000-210400-210404-', '望花区', '望花区', '', '', '', '210404', '113000', '0413', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210411', '210400', '156-210000-210400-210411-', '顺城区', '顺城区', '', '', '', '210411', '113000', '0413', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210421', '210400', '156-210000-210400-210421-', '抚顺县', '抚顺县', '', '', '', '210421', '113100', '0413', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210422', '210400', '156-210000-210400-210422-', '新宾满族自治县', '新宾满族自治县', '', '', '', '210422', '113200', '0413', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210423', '210400', '156-210000-210400-210423-', '清原满族自治县', '清原满族自治县', '', '', '', '210423', '113300', '0413', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210500', '210000', '156-210000-210500-', '本溪', '本溪市', '', '', '', '210500', '117000', '0414', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210501', '210500', '156-210000-210500-210501-', '市辖区', '市辖区', '', '', '', '210501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210502', '210500', '156-210000-210500-210502-', '平山区', '平山区', '', '', '', '210502', '117000', '0414', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210503', '210500', '156-210000-210500-210503-', '溪湖区', '溪湖区', '', '', '', '210503', '117000', '0414', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210504', '210500', '156-210000-210500-210504-', '明山区', '明山区', '', '', '', '210504', '117000', '0414', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210505', '210500', '156-210000-210500-210505-', '南芬区', '南芬区', '', '', '', '210505', '117000', '0414', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210521', '210500', '156-210000-210500-210521-', '本溪满族自治县', '本溪满族自治县', '', '', '', '210521', '117100', '0414', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210522', '210500', '156-210000-210500-210522-', '桓仁满族自治县', '桓仁满族自治县', '', '', '', '210522', '117200', '0414', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210600', '210000', '156-210000-210600-', '丹东', '丹东市', '', '', '', '210600', '118000', '0415', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210601', '210600', '156-210000-210600-210601-', '市辖区', '市辖区', '', '', '', '210601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210602', '210600', '156-210000-210600-210602-', '元宝区', '元宝区', '', '', '', '210602', '118000', '0415', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210603', '210600', '156-210000-210600-210603-', '振兴区', '振兴区', '', '', '', '210603', '118000', '0415', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210604', '210600', '156-210000-210600-210604-', '振安区', '振安区', '', '', '', '210604', '118000', '0415', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210624', '210600', '156-210000-210600-210624-', '宽甸满族自治县', '宽甸满族自治县', '', '', '', '210624', '118200', '0415', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210681', '210600', '156-210000-210600-210681-', '东港市', '东港市', '', '', '', '210681', '118300', '0415', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210682', '210600', '156-210000-210600-210682-', '凤城市', '凤城市', '', '', '', '210682', '118100', '0415', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210700', '210000', '156-210000-210700-', '锦州', '锦州市', '', '', '', '210700', '121000', '0416', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210701', '210700', '156-210000-210700-210701-', '市辖区', '市辖区', '', '', '', '210701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210702', '210700', '156-210000-210700-210702-', '古塔区', '古塔区', '', '', '', '210702', '121000', '0416', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210703', '210700', '156-210000-210700-210703-', '凌河区', '凌河区', '', '', '', '210703', '121000', '0416', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210711', '210700', '156-210000-210700-210711-', '太和区', '太和区', '', '', '', '210711', '121000', '0416', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210726', '210700', '156-210000-210700-210726-', '黑山县', '黑山县', '', '', '', '210726', '121400', '0416', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210727', '210700', '156-210000-210700-210727-', '义县', '义县', '', '', '', '210727', '121100', '0416', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210781', '210700', '156-210000-210700-210781-', '凌海市', '凌海市', '', '', '', '210781', '121200', '0416', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210782', '210700', '156-210000-210700-210782-', '北镇市', '北镇市', '', '', '', '210782', '121300', '0416', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210800', '210000', '156-210000-210800-', '营口', '营口市', '', '', '', '210800', '115000', '0417', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210801', '210800', '156-210000-210800-210801-', '市辖区', '市辖区', '', '', '', '210801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210802', '210800', '156-210000-210800-210802-', '站前区', '站前区', '', '', '', '210802', '115000', '0417', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210803', '210800', '156-210000-210800-210803-', '西市区', '西市区', '', '', '', '210803', '115000', '0417', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210804', '210800', '156-210000-210800-210804-', '鲅鱼圈区', '鲅鱼圈区', '', '', '', '210804', '115007', '0417', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210811', '210800', '156-210000-210800-210811-', '老边区', '老边区', '', '', '', '210811', '115000', '0417', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210881', '210800', '156-210000-210800-210881-', '盖州市', '盖州市', '', '', '', '210881', '115200', '0417', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210882', '210800', '156-210000-210800-210882-', '大石桥市', '大石桥市', '', '', '', '210882', '115100', '0417', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210900', '210000', '156-210000-210900-', '阜新', '阜新市', '', '', '', '210900', '123000', '0418', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210901', '210900', '156-210000-210900-210901-', '市辖区', '市辖区', '', '', '', '210901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210902', '210900', '156-210000-210900-210902-', '海州区', '海州区', '', '', '', '210902', '123000', '0418', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210903', '210900', '156-210000-210900-210903-', '新邱区', '新邱区', '', '', '', '210903', '123000', '0418', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210904', '210900', '156-210000-210900-210904-', '太平区', '太平区', '', '', '', '210904', '123000', '0418', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210905', '210900', '156-210000-210900-210905-', '清河门区', '清河门区', '', '', '', '210905', '123000', '0418', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210911', '210900', '156-210000-210900-210911-', '细河区', '细河区', '', '', '', '210911', '123000', '0418', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210921', '210900', '156-210000-210900-210921-', '阜新蒙古族自治县', '阜新蒙古族自治县', '', '', '', '210921', '123100', '0418', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('210922', '210900', '156-210000-210900-210922-', '彰武县', '彰武县', '', '', '', '210922', '123200', '0418', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211000', '210000', '156-210000-211000-', '辽阳', '辽阳市', '', '', '', '211000', '111000', '0419', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211001', '211000', '156-210000-211000-211001-', '市辖区', '市辖区', '', '', '', '211001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211002', '211000', '156-210000-211000-211002-', '白塔区', '白塔区', '', '', '', '211002', '111000', '0419', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211003', '211000', '156-210000-211000-211003-', '文圣区', '文圣区', '', '', '', '211003', '111000', '0419', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211004', '211000', '156-210000-211000-211004-', '宏伟区', '宏伟区', '', '', '', '211004', '111000', '0419', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211005', '211000', '156-210000-211000-211005-', '弓长岭区', '弓长岭区', '', '', '', '211005', '111000', '0419', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211011', '211000', '156-210000-211000-211011-', '太子河区', '太子河区', '', '', '', '211011', '111000', '0419', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211021', '211000', '156-210000-211000-211021-', '辽阳县', '辽阳县', '', '', '', '211021', '111200', '0419', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211081', '211000', '156-210000-211000-211081-', '灯塔市', '灯塔市', '', '', '', '211081', '111300', '0419', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211100', '210000', '156-210000-211100-', '盘锦', '盘锦市', '', '', '', '211100', '124000', '0427', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211101', '211100', '156-210000-211100-211101-', '市辖区', '市辖区', '', '', '', '211101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211102', '211100', '156-210000-211100-211102-', '双台子区', '双台子区', '', '', '', '211102', '124000', '0427', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211103', '211100', '156-210000-211100-211103-', '兴隆台区', '兴隆台区', '', '', '', '211103', '124000', '0427', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211121', '211100', '156-210000-211100-211121-', '大洼县', '大洼县', '', '', '', '211121', '124200', '0427', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211122', '211100', '156-210000-211100-211122-', '盘山县', '盘山县', '', '', '', '211122', '124100', '0427', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211200', '210000', '156-210000-211200-', '铁岭', '铁岭市', '', '', '', '211200', '112000', '0410', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211201', '211200', '156-210000-211200-211201-', '市辖区', '市辖区', '', '', '', '211201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211202', '211200', '156-210000-211200-211202-', '银州区', '银州区', '', '', '', '211202', '112000', '0410', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211204', '211200', '156-210000-211200-211204-', '清河区', '清河区', '', '', '', '211204', '112000', '0410', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211221', '211200', '156-210000-211200-211221-', '铁岭县', '铁岭县', '', '', '', '211221', '112600', '0410', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211223', '211200', '156-210000-211200-211223-', '西丰县', '西丰县', '', '', '', '211223', '112400', '0410', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211224', '211200', '156-210000-211200-211224-', '昌图县', '昌图县', '', '', '', '211224', '112500', '0410', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211281', '211200', '156-210000-211200-211281-', '调兵山市', '调兵山市', '', '', '', '211281', '112700', '0410', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211282', '211200', '156-210000-211200-211282-', '开原市', '开原市', '', '', '', '211282', '112300', '0410', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211300', '210000', '156-210000-211300-', '朝阳', '朝阳市', '', '', '', '211300', '122000', '0421', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211301', '211300', '156-210000-211300-211301-', '市辖区', '市辖区', '', '', '', '211301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211302', '211300', '156-210000-211300-211302-', '双塔区', '双塔区', '', '', '', '211302', '122000', '0421', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211303', '211300', '156-210000-211300-211303-', '龙城区', '龙城区', '', '', '', '211303', '122000', '0421', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211321', '211300', '156-210000-211300-211321-', '朝阳县', '朝阳县', '', '', '', '211321', '122000', '0421', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211322', '211300', '156-210000-211300-211322-', '建平县', '建平县', '', '', '', '211322', '122400', '0421', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211324', '211300', '156-210000-211300-211324-', '喀喇沁左翼蒙古族自治县', '喀喇沁左翼蒙古族自治县', '', '', '', '211324', '122300', '0421', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211381', '211300', '156-210000-211300-211381-', '北票市', '北票市', '', '', '', '211381', '122100', '0421', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211382', '211300', '156-210000-211300-211382-', '凌源市', '凌源市', '', '', '', '211382', '122500', '0421', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211400', '210000', '156-210000-211400-', '葫芦岛', '葫芦岛市', '', '', '', '211400', '125000', '0429', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211401', '211400', '156-210000-211400-211401-', '市辖区', '市辖区', '', '', '', '211401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211402', '211400', '156-210000-211400-211402-', '连山区', '连山区', '', '', '', '211402', '125000', '0429', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211403', '211400', '156-210000-211400-211403-', '龙港区', '龙港区', '', '', '', '211403', '125000', '0429', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211404', '211400', '156-210000-211400-211404-', '南票区', '南票区', '', '', '', '211404', '125000', '0429', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211421', '211400', '156-210000-211400-211421-', '绥中县', '绥中县', '', '', '', '211421', '125200', '0429', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211422', '211400', '156-210000-211400-211422-', '建昌县', '建昌县', '', '', '', '211422', '125300', '0429', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('211481', '211400', '156-210000-211400-211481-', '兴城市', '兴城市', '', '', '', '211481', '125100', '0429', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220000', '156', '156-220000-', '吉林', '吉林省', 'JiLin', 'JiLin', 'JL', '220000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220100', '220000', '156-220000-220100-', '长春', '长春市', '', '', '', '220100', '130000', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220101', '220100', '156-220000-220100-220101-', '市辖区', '市辖区', '', '', '', '220101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220102', '220100', '156-220000-220100-220102-', '南关区', '南关区', '', '', '', '220102', '130000', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220103', '220100', '156-220000-220100-220103-', '宽城区', '宽城区', '', '', '', '220103', '130000', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220104', '220100', '156-220000-220100-220104-', '朝阳区', '朝阳区', '', '', '', '220104', '130000', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220105', '220100', '156-220000-220100-220105-', '二道区', '二道区', '', '', '', '220105', '130000', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220106', '220100', '156-220000-220100-220106-', '绿园区', '绿园区', '', '', '', '220106', '130000', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220112', '220100', '156-220000-220100-220112-', '双阳区', '双阳区', '', '', '', '220112', '130600', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220122', '220100', '156-220000-220100-220122-', '农安县', '农安县', '', '', '', '220122', '130200', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220181', '220100', '156-220000-220100-220181-', '九台市', '九台市', '', '', '', '220181', '130500', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220182', '220100', '156-220000-220100-220182-', '榆树市', '榆树市', '', '', '', '220182', '130400', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220183', '220100', '156-220000-220100-220183-', '德惠市', '德惠市', '', '', '', '220183', '130300', '0431', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220200', '220000', '156-220000-220200-', '吉林', '吉林市', '', '', '', '220200', '132000', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220201', '220200', '156-220000-220200-220201-', '市辖区', '市辖区', '', '', '', '220201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220202', '220200', '156-220000-220200-220202-', '昌邑区', '昌邑区', '', '', '', '220202', '132000', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220203', '220200', '156-220000-220200-220203-', '龙潭区', '龙潭区', '', '', '', '220203', '132000', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220204', '220200', '156-220000-220200-220204-', '船营区', '船营区', '', '', '', '220204', '132000', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220211', '220200', '156-220000-220200-220211-', '丰满区', '丰满区', '', '', '', '220211', '132000', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220221', '220200', '156-220000-220200-220221-', '永吉县', '永吉县', '', '', '', '220221', '132100', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220281', '220200', '156-220000-220200-220281-', '蛟河市', '蛟河市', '', '', '', '220281', '132500', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220282', '220200', '156-220000-220200-220282-', '桦甸市', '桦甸市', '', '', '', '220282', '132400', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220283', '220200', '156-220000-220200-220283-', '舒兰市', '舒兰市', '', '', '', '220283', '132600', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220284', '220200', '156-220000-220200-220284-', '磐石市', '磐石市', '', '', '', '220284', '132300', '0432', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220300', '220000', '156-220000-220300-', '四平', '四平市', '', '', '', '220300', '136000', '0434', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220301', '220300', '156-220000-220300-220301-', '市辖区', '市辖区', '', '', '', '220301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220302', '220300', '156-220000-220300-220302-', '铁西区', '铁西区', '', '', '', '220302', '136000', '0434', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220303', '220300', '156-220000-220300-220303-', '铁东区', '铁东区', '', '', '', '220303', '136000', '0434', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220322', '220300', '156-220000-220300-220322-', '梨树县', '梨树县', '', '', '', '220322', '136500', '0434', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220323', '220300', '156-220000-220300-220323-', '伊通满族自治县', '伊通满族自治县', '', '', '', '220323', '130700', '0434', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220381', '220300', '156-220000-220300-220381-', '公主岭市', '公主岭市', '', '', '', '220381', '136100', '0434', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220382', '220300', '156-220000-220300-220382-', '双辽市', '双辽市', '', '', '', '220382', '136400', '0434', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220400', '220000', '156-220000-220400-', '辽源', '辽源市', '', '', '', '220400', '136200', '0437', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220401', '220400', '156-220000-220400-220401-', '市辖区', '市辖区', '', '', '', '220401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220402', '220400', '156-220000-220400-220402-', '龙山区', '龙山区', '', '', '', '220402', '136200', '0437', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220403', '220400', '156-220000-220400-220403-', '西安区', '西安区', '', '', '', '220403', '136200', '0437', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220421', '220400', '156-220000-220400-220421-', '东丰县', '东丰县', '', '', '', '220421', '136300', '0437', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220422', '220400', '156-220000-220400-220422-', '东辽县', '东辽县', '', '', '', '220422', '136600', '0437', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220500', '220000', '156-220000-220500-', '通化', '通化市', '', '', '', '220500', '134000', '0435', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220501', '220500', '156-220000-220500-220501-', '市辖区', '市辖区', '', '', '', '220501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220502', '220500', '156-220000-220500-220502-', '东昌区', '东昌区', '', '', '', '220502', '134000', '0435', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220503', '220500', '156-220000-220500-220503-', '二道江区', '二道江区', '', '', '', '220503', '134000', '0435', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220521', '220500', '156-220000-220500-220521-', '通化县', '通化县', '', '', '', '220521', '134100', '0435', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220523', '220500', '156-220000-220500-220523-', '辉南县', '辉南县', '', '', '', '220523', '135100', '0435', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220524', '220500', '156-220000-220500-220524-', '柳河县', '柳河县', '', '', '', '220524', '135300', '0435', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220581', '220500', '156-220000-220500-220581-', '梅河口市', '梅河口市', '', '', '', '220581', '135000', '0435', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220582', '220500', '156-220000-220500-220582-', '集安市', '集安市', '', '', '', '220582', '134200', '0435', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220600', '220000', '156-220000-220600-', '白山', '白山市', '', '', '', '220600', '134300', '0439', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220601', '220600', '156-220000-220600-220601-', '市辖区', '市辖区', '', '', '', '220601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220602', '220600', '156-220000-220600-220602-', '浑江区', '浑江区', '', '', '', '220602', '134300', '0439', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220605', '220600', '156-220000-220600-220605-', '江源区', '江源区', '', '', '', '220605', '134700', '0439', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220621', '220600', '156-220000-220600-220621-', '抚松县', '抚松县', '', '', '', '220621', '134500', '0439', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220622', '220600', '156-220000-220600-220622-', '靖宇县', '靖宇县', '', '', '', '220622', '135200', '0439', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220623', '220600', '156-220000-220600-220623-', '长白朝鲜族自治县', '长白朝鲜族自治县', '', '', '', '220623', '134400', '0439', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220681', '220600', '156-220000-220600-220681-', '临江市', '临江市', '', '', '', '220681', '134600', '0439', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220700', '220000', '156-220000-220700-', '松原', '松原市', '', '', '', '220700', '138000', '0438', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220701', '220700', '156-220000-220700-220701-', '市辖区', '市辖区', '', '', '', '220701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220702', '220700', '156-220000-220700-220702-', '宁江区', '宁江区', '', '', '', '220702', '138000', '0438', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220721', '220700', '156-220000-220700-220721-', '前郭尔罗斯蒙古族自治县', '前郭尔罗斯蒙古族自治县', '', '', '', '220721', '131100', '0438', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220722', '220700', '156-220000-220700-220722-', '长岭县', '长岭县', '', '', '', '220722', '131500', '0438', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220723', '220700', '156-220000-220700-220723-', '乾安县', '乾安县', '', '', '', '220723', '131400', '0438', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220724', '220700', '156-220000-220700-220724-', '扶余县', '扶余县', '', '', '', '220724', '131200', '0438', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220800', '220000', '156-220000-220800-', '白城', '白城市', '', '', '', '220800', '137000', '0436', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220801', '220800', '156-220000-220800-220801-', '市辖区', '市辖区', '', '', '', '220801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220802', '220800', '156-220000-220800-220802-', '洮北区', '洮北区', '', '', '', '220802', '137000', '0436', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220821', '220800', '156-220000-220800-220821-', '镇赉县', '镇赉县', '', '', '', '220821', '137300', '0436', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220822', '220800', '156-220000-220800-220822-', '通榆县', '通榆县', '', '', '', '220822', '137200', '0436', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220881', '220800', '156-220000-220800-220881-', '洮南市', '洮南市', '', '', '', '220881', '137100', '0436', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('220882', '220800', '156-220000-220800-220882-', '大安市', '大安市', '', '', '', '220882', '131300', '0436', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222400', '220000', '156-220000-222400-', '延边', '延边朝鲜族自治州', '', '', '', '222400', '133000', '0433', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222401', '222400', '156-220000-222400-222401-', '延吉市', '延吉市', '', '', '', '222401', '133000', '0433', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222402', '222400', '156-220000-222400-222402-', '图们市', '图们市', '', '', '', '222402', '133100', '0433', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222403', '222400', '156-220000-222400-222403-', '敦化市', '敦化市', '', '', '', '222403', '133700', '0433', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222404', '222400', '156-220000-222400-222404-', '珲春市', '珲春市', '', '', '', '222404', '133300', '0433', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222405', '222400', '156-220000-222400-222405-', '龙井市', '龙井市', '', '', '', '222405', '133400', '0433', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222406', '222400', '156-220000-222400-222406-', '和龙市', '和龙市', '', '', '', '222406', '133500', '0433', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222424', '222400', '156-220000-222400-222424-', '汪清县', '汪清县', '', '', '', '222424', '133200', '0433', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('222426', '222400', '156-220000-222400-222426-', '安图县', '安图县', '', '', '', '222426', '133600', '0433', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230000', '156', '156-230000-', '黑龙江', '黑龙江省', 'HeiLongJiang', 'HeiLongJiang', 'HL', '230000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230100', '230000', '156-230000-230100-', '哈尔滨', '哈尔滨市', '', '', '', '230100', '150000', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230101', '230100', '156-230000-230100-230101-', '市辖区', '市辖区', '', '', '', '230101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230102', '230100', '156-230000-230100-230102-', '道里区', '道里区', '', '', '', '230102', '150000', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230103', '230100', '156-230000-230100-230103-', '南岗区', '南岗区', '', '', '', '230103', '150000', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230104', '230100', '156-230000-230100-230104-', '道外区', '道外区', '', '', '', '230104', '150000', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230108', '230100', '156-230000-230100-230108-', '平房区', '平房区', '', '', '', '230108', '150000', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230109', '230100', '156-230000-230100-230109-', '松北区', '松北区', '', '', '', '230109', '150000', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230110', '230100', '156-230000-230100-230110-', '香坊区', '香坊区', '', '', '', '230110', '150000', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230111', '230100', '156-230000-230100-230111-', '呼兰区', '呼兰区', '', '', '', '230111', '150500', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230112', '230100', '156-230000-230100-230112-', '阿城区', '阿城区', '', '', '', '230112', '150300', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230123', '230100', '156-230000-230100-230123-', '依兰县', '依兰县', '', '', '', '230123', '154800', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230124', '230100', '156-230000-230100-230124-', '方正县', '方正县', '', '', '', '230124', '150800', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230125', '230100', '156-230000-230100-230125-', '宾县', '宾县', '', '', '', '230125', '150400', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230126', '230100', '156-230000-230100-230126-', '巴彦县', '巴彦县', '', '', '', '230126', '151800', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230127', '230100', '156-230000-230100-230127-', '木兰县', '木兰县', '', '', '', '230127', '151900', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230128', '230100', '156-230000-230100-230128-', '通河县', '通河县', '', '', '', '230128', '150900', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230129', '230100', '156-230000-230100-230129-', '延寿县', '延寿县', '', '', '', '230129', '150700', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230182', '230100', '156-230000-230100-230182-', '双城市', '双城市', '', '', '', '230182', '150100', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230183', '230100', '156-230000-230100-230183-', '尚志市', '尚志市', '', '', '', '230183', '150600', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230184', '230100', '156-230000-230100-230184-', '五常市', '五常市', '', '', '', '230184', '150200', '0451', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230200', '230000', '156-230000-230200-', '齐齐哈尔', '齐齐哈尔市', '', '', '', '230200', '161000', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230201', '230200', '156-230000-230200-230201-', '市辖区', '市辖区', '', '', '', '230201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230202', '230200', '156-230000-230200-230202-', '龙沙区', '龙沙区', '', '', '', '230202', '161000', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230203', '230200', '156-230000-230200-230203-', '建华区', '建华区', '', '', '', '230203', '161000', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230204', '230200', '156-230000-230200-230204-', '铁锋区', '铁锋区', '', '', '', '230204', '161000', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230205', '230200', '156-230000-230200-230205-', '昂昂溪区', '昂昂溪区', '', '', '', '230205', '161000', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230206', '230200', '156-230000-230200-230206-', '富拉尔基区', '富拉尔基区', '', '', '', '230206', '161000', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230207', '230200', '156-230000-230200-230207-', '碾子山区', '碾子山区', '', '', '', '230207', '161000', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230208', '230200', '156-230000-230200-230208-', '梅里斯达斡尔族区', '梅里斯达斡尔族区', '', '', '', '230208', '161000', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230221', '230200', '156-230000-230200-230221-', '龙江县', '龙江县', '', '', '', '230221', '161100', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230223', '230200', '156-230000-230200-230223-', '依安县', '依安县', '', '', '', '230223', '161500', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230224', '230200', '156-230000-230200-230224-', '泰来县', '泰来县', '', '', '', '230224', '162400', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230225', '230200', '156-230000-230200-230225-', '甘南县', '甘南县', '', '', '', '230225', '162100', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230227', '230200', '156-230000-230200-230227-', '富裕县', '富裕县', '', '', '', '230227', '161200', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230229', '230200', '156-230000-230200-230229-', '克山县', '克山县', '', '', '', '230229', '161600', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230230', '230200', '156-230000-230200-230230-', '克东县', '克东县', '', '', '', '230230', '164800', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230231', '230200', '156-230000-230200-230231-', '拜泉县', '拜泉县', '', '', '', '230231', '164700', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230281', '230200', '156-230000-230200-230281-', '讷河市', '讷河市', '', '', '', '230281', '161300', '0452', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230300', '230000', '156-230000-230300-', '鸡西', '鸡西市', '', '', '', '230300', '158100', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230301', '230300', '156-230000-230300-230301-', '市辖区', '市辖区', '', '', '', '230301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230302', '230300', '156-230000-230300-230302-', '鸡冠区', '鸡冠区', '', '', '', '230302', '158100', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230303', '230300', '156-230000-230300-230303-', '恒山区', '恒山区', '', '', '', '230303', '158100', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230304', '230300', '156-230000-230300-230304-', '滴道区', '滴道区', '', '', '', '230304', '158100', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230305', '230300', '156-230000-230300-230305-', '梨树区', '梨树区', '', '', '', '230305', '158100', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230306', '230300', '156-230000-230300-230306-', '城子河区', '城子河区', '', '', '', '230306', '158100', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230307', '230300', '156-230000-230300-230307-', '麻山区', '麻山区', '', '', '', '230307', '158100', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230321', '230300', '156-230000-230300-230321-', '鸡东县', '鸡东县', '', '', '', '230321', '158200', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230381', '230300', '156-230000-230300-230381-', '虎林市', '虎林市', '', '', '', '230381', '158400', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230382', '230300', '156-230000-230300-230382-', '密山市', '密山市', '', '', '', '230382', '158300', '0467', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230400', '230000', '156-230000-230400-', '鹤岗', '鹤岗市', '', '', '', '230400', '154100', '0468', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230401', '230400', '156-230000-230400-230401-', '市辖区', '市辖区', '', '', '', '230401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230402', '230400', '156-230000-230400-230402-', '向阳区', '向阳区', '', '', '', '230402', '154100', '0468', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230403', '230400', '156-230000-230400-230403-', '工农区', '工农区', '', '', '', '230403', '154100', '0468', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230404', '230400', '156-230000-230400-230404-', '南山区', '南山区', '', '', '', '230404', '154100', '0468', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230405', '230400', '156-230000-230400-230405-', '兴安区', '兴安区', '', '', '', '230405', '154100', '0468', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230406', '230400', '156-230000-230400-230406-', '东山区', '东山区', '', '', '', '230406', '154100', '0468', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230407', '230400', '156-230000-230400-230407-', '兴山区', '兴山区', '', '', '', '230407', '154100', '0468', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230421', '230400', '156-230000-230400-230421-', '萝北县', '萝北县', '', '', '', '230421', '154200', '0468', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230422', '230400', '156-230000-230400-230422-', '绥滨县', '绥滨县', '', '', '', '230422', '156200', '0468', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230500', '230000', '156-230000-230500-', '双鸭山', '双鸭山市', '', '', '', '230500', '155100', '0469', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230501', '230500', '156-230000-230500-230501-', '市辖区', '市辖区', '', '', '', '230501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230502', '230500', '156-230000-230500-230502-', '尖山区', '尖山区', '', '', '', '230502', '155100', '0469', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230503', '230500', '156-230000-230500-230503-', '岭东区', '岭东区', '', '', '', '230503', '155100', '0469', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230505', '230500', '156-230000-230500-230505-', '四方台区', '四方台区', '', '', '', '230505', '155100', '0469', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230506', '230500', '156-230000-230500-230506-', '宝山区', '宝山区', '', '', '', '230506', '155100', '0469', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230521', '230500', '156-230000-230500-230521-', '集贤县', '集贤县', '', '', '', '230521', '155900', '0469', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230522', '230500', '156-230000-230500-230522-', '友谊县', '友谊县', '', '', '', '230522', '155800', '0469', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230523', '230500', '156-230000-230500-230523-', '宝清县', '宝清县', '', '', '', '230523', '155600', '0469', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230524', '230500', '156-230000-230500-230524-', '饶河县', '饶河县', '', '', '', '230524', '155700', '0469', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230600', '230000', '156-230000-230600-', '大庆', '大庆市', '', '', '', '230600', '163000', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230601', '230600', '156-230000-230600-230601-', '市辖区', '市辖区', '', '', '', '230601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230602', '230600', '156-230000-230600-230602-', '萨尔图区', '萨尔图区', '', '', '', '230602', '163000', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230603', '230600', '156-230000-230600-230603-', '龙凤区', '龙凤区', '', '', '', '230603', '163000', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230604', '230600', '156-230000-230600-230604-', '让胡路区', '让胡路区', '', '', '', '230604', '163000', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230605', '230600', '156-230000-230600-230605-', '红岗区', '红岗区', '', '', '', '230605', '163000', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230606', '230600', '156-230000-230600-230606-', '大同区', '大同区', '', '', '', '230606', '163000', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230621', '230600', '156-230000-230600-230621-', '肇州县', '肇州县', '', '', '', '230621', '166400', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230622', '230600', '156-230000-230600-230622-', '肇源县', '肇源县', '', '', '', '230622', '166500', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230623', '230600', '156-230000-230600-230623-', '林甸县', '林甸县', '', '', '', '230623', '166300', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230624', '230600', '156-230000-230600-230624-', '杜尔伯特蒙古族自治县', '杜尔伯特蒙古族自治县', '', '', '', '230624', '166200', '0459', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230700', '230000', '156-230000-230700-', '伊春', '伊春市', '', '', '', '230700', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230701', '230700', '156-230000-230700-230701-', '市辖区', '市辖区', '', '', '', '230701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230702', '230700', '156-230000-230700-230702-', '伊春区', '伊春区', '', '', '', '230702', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230703', '230700', '156-230000-230700-230703-', '南岔区', '南岔区', '', '', '', '230703', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230704', '230700', '156-230000-230700-230704-', '友好区', '友好区', '', '', '', '230704', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230705', '230700', '156-230000-230700-230705-', '西林区', '西林区', '', '', '', '230705', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230706', '230700', '156-230000-230700-230706-', '翠峦区', '翠峦区', '', '', '', '230706', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230707', '230700', '156-230000-230700-230707-', '新青区', '新青区', '', '', '', '230707', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230708', '230700', '156-230000-230700-230708-', '美溪区', '美溪区', '', '', '', '230708', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230709', '230700', '156-230000-230700-230709-', '金山屯区', '金山屯区', '', '', '', '230709', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230710', '230700', '156-230000-230700-230710-', '五营区', '五营区', '', '', '', '230710', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230711', '230700', '156-230000-230700-230711-', '乌马河区', '乌马河区', '', '', '', '230711', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230712', '230700', '156-230000-230700-230712-', '汤旺河区', '汤旺河区', '', '', '', '230712', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230713', '230700', '156-230000-230700-230713-', '带岭区', '带岭区', '', '', '', '230713', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230714', '230700', '156-230000-230700-230714-', '乌伊岭区', '乌伊岭区', '', '', '', '230714', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230715', '230700', '156-230000-230700-230715-', '红星区', '红星区', '', '', '', '230715', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230716', '230700', '156-230000-230700-230716-', '上甘岭区', '上甘岭区', '', '', '', '230716', '153000', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230722', '230700', '156-230000-230700-230722-', '嘉荫县', '嘉荫县', '', '', '', '230722', '153200', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230781', '230700', '156-230000-230700-230781-', '铁力市', '铁力市', '', '', '', '230781', '152500', '0458', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230800', '230000', '156-230000-230800-', '佳木斯', '佳木斯市', '', '', '', '230800', '154000', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230801', '230800', '156-230000-230800-230801-', '市辖区', '市辖区', '', '', '', '230801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230803', '230800', '156-230000-230800-230803-', '向阳区', '向阳区', '', '', '', '230803', '154000', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230804', '230800', '156-230000-230800-230804-', '前进区', '前进区', '', '', '', '230804', '154000', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230805', '230800', '156-230000-230800-230805-', '东风区', '东风区', '', '', '', '230805', '154000', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230811', '230800', '156-230000-230800-230811-', '郊区', '郊区', '', '', '', '230811', '0', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230822', '230800', '156-230000-230800-230822-', '桦南县', '桦南县', '', '', '', '230822', '154400', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230826', '230800', '156-230000-230800-230826-', '桦川县', '桦川县', '', '', '', '230826', '154300', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230828', '230800', '156-230000-230800-230828-', '汤原县', '汤原县', '', '', '', '230828', '154700', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230833', '230800', '156-230000-230800-230833-', '抚远县', '抚远县', '', '', '', '230833', '156500', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230881', '230800', '156-230000-230800-230881-', '同江市', '同江市', '', '', '', '230881', '156400', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230882', '230800', '156-230000-230800-230882-', '富锦市', '富锦市', '', '', '', '230882', '156100', '0454', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230900', '230000', '156-230000-230900-', '七台河', '七台河市', '', '', '', '230900', '154600', '0464', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230901', '230900', '156-230000-230900-230901-', '市辖区', '市辖区', '', '', '', '230901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230902', '230900', '156-230000-230900-230902-', '新兴区', '新兴区', '', '', '', '230902', '154600', '0464', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230903', '230900', '156-230000-230900-230903-', '桃山区', '桃山区', '', '', '', '230903', '154600', '0464', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230904', '230900', '156-230000-230900-230904-', '茄子河区', '茄子河区', '', '', '', '230904', '154600', '0464', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('230921', '230900', '156-230000-230900-230921-', '勃利县', '勃利县', '', '', '', '230921', '154500', '0464', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231000', '230000', '156-230000-231000-', '牡丹江', '牡丹江市', '', '', '', '231000', '157000', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231001', '231000', '156-230000-231000-231001-', '市辖区', '市辖区', '', '', '', '231001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231002', '231000', '156-230000-231000-231002-', '东安区', '东安区', '', '', '', '231002', '157000', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231003', '231000', '156-230000-231000-231003-', '阳明区', '阳明区', '', '', '', '231003', '157000', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231004', '231000', '156-230000-231000-231004-', '爱民区', '爱民区', '', '', '', '231004', '157000', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231005', '231000', '156-230000-231000-231005-', '西安区', '西安区', '', '', '', '231005', '157000', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231024', '231000', '156-230000-231000-231024-', '东宁县', '东宁县', '', '', '', '231024', '157200', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231025', '231000', '156-230000-231000-231025-', '林口县', '林口县', '', '', '', '231025', '157600', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231081', '231000', '156-230000-231000-231081-', '绥芬河市', '绥芬河市', '', '', '', '231081', '157300', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231083', '231000', '156-230000-231000-231083-', '海林市', '海林市', '', '', '', '231083', '157100', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231084', '231000', '156-230000-231000-231084-', '宁安市', '宁安市', '', '', '', '231084', '157400', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231085', '231000', '156-230000-231000-231085-', '穆棱市', '穆棱市', '', '', '', '231085', '157500', '0453', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231100', '230000', '156-230000-231100-', '黑河', '黑河市', '', '', '', '231100', '164300', '0456', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231101', '231100', '156-230000-231100-231101-', '市辖区', '市辖区', '', '', '', '231101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231102', '231100', '156-230000-231100-231102-', '爱辉区', '爱辉区', '', '', '', '231102', '164300', '0456', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231121', '231100', '156-230000-231100-231121-', '嫩江县', '嫩江县', '', '', '', '231121', '161400', '0456', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231123', '231100', '156-230000-231100-231123-', '逊克县', '逊克县', '', '', '', '231123', '164400', '0456', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231124', '231100', '156-230000-231100-231124-', '孙吴县', '孙吴县', '', '', '', '231124', '164200', '0456', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231181', '231100', '156-230000-231100-231181-', '北安市', '北安市', '', '', '', '231181', '164000', '0456', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231182', '231100', '156-230000-231100-231182-', '五大连池市', '五大连池市', '', '', '', '231182', '164100', '0456', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231200', '230000', '156-230000-231200-', '绥化', '绥化市', '', '', '', '231200', '152000', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231201', '231200', '156-230000-231200-231201-', '市辖区', '市辖区', '', '', '', '231201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231202', '231200', '156-230000-231200-231202-', '北林区', '北林区', '', '', '', '231202', '152000', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231221', '231200', '156-230000-231200-231221-', '望奎县', '望奎县', '', '', '', '231221', '152100', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231222', '231200', '156-230000-231200-231222-', '兰西县', '兰西县', '', '', '', '231222', '151500', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231223', '231200', '156-230000-231200-231223-', '青冈县', '青冈县', '', '', '', '231223', '151600', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231224', '231200', '156-230000-231200-231224-', '庆安县', '庆安县', '', '', '', '231224', '152400', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231225', '231200', '156-230000-231200-231225-', '明水县', '明水县', '', '', '', '231225', '151700', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231226', '231200', '156-230000-231200-231226-', '绥棱县', '绥棱县', '', '', '', '231226', '152200', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231281', '231200', '156-230000-231200-231281-', '安达市', '安达市', '', '', '', '231281', '151400', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231282', '231200', '156-230000-231200-231282-', '肇东市', '肇东市', '', '', '', '231282', '151100', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('231283', '231200', '156-230000-231200-231283-', '海伦市', '海伦市', '', '', '', '231283', '152300', '0455', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('232700', '230000', '156-230000-232700-', '大兴安岭', '大兴安岭地区', '', '', '', '232700', '165000', '0457', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('232721', '232700', '156-230000-232700-232721-', '呼玛县', '呼玛县', '', '', '', '232721', '165100', '0457', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('232722', '232700', '156-230000-232700-232722-', '塔河县', '塔河县', '', '', '', '232722', '165200', '0457', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('232723', '232700', '156-230000-232700-232723-', '漠河县', '漠河县', '', '', '', '232723', '165300', '0457', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310000', '156', '156-310000-', '上海', '上海市', 'ShangHai', 'ShangHai', 'SH', '310000', '200000', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310100', '310000', '156-310000-310100-', '市辖区', '市辖区', '', '', '', '310100', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310101', '310100', '156-310000-310100-310101-', '黄浦区', '黄浦区', '', '', '', '310101', '200000', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310104', '310100', '156-310000-310100-310104-', '徐汇区', '徐汇区', '', '', '', '310104', '200000', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310105', '310100', '156-310000-310100-310105-', '长宁区', '长宁区', '', '', '', '310105', '200000', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310106', '310100', '156-310000-310100-310106-', '静安区', '静安区', '', '', '', '310106', '200000', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310107', '310100', '156-310000-310100-310107-', '普陀区', '普陀区', '', '', '', '310107', '200000', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310108', '310100', '156-310000-310100-310108-', '闸北区', '闸北区', '', '', '', '310108', '200000', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310109', '310100', '156-310000-310100-310109-', '虹口区', '虹口区', '', '', '', '310109', '200000', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310110', '310100', '156-310000-310100-310110-', '杨浦区', '杨浦区', '', '', '', '310110', '200000', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310112', '310100', '156-310000-310100-310112-', '闵行区', '闵行区', '', '', '', '310112', '201100', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310113', '310100', '156-310000-310100-310113-', '宝山区', '宝山区', '', '', '', '310113', '201900', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310114', '310100', '156-310000-310100-310114-', '嘉定区', '嘉定区', '', '', '', '310114', '201800', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310115', '310100', '156-310000-310100-310115-', '浦东新区', '浦东新区', '', '', '', '310115', '200120', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310116', '310100', '156-310000-310100-310116-', '金山区', '金山区', '', '', '', '310116', '201500', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310117', '310100', '156-310000-310100-310117-', '松江区', '松江区', '', '', '', '310117', '201600', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310118', '310100', '156-310000-310100-310118-', '青浦区', '青浦区', '', '', '', '310118', '201700', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310120', '310100', '156-310000-310100-310120-', '奉贤区', '奉贤区', '', '', '', '310120', '201400', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310200', '310000', '156-310000-310200-', '县', '县', '', '', '', '310200', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('310230', '310200', '156-310000-310200-310230-', '崇明县', '崇明县', '', '', '', '310230', '202150', '021', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320000', '156', '156-320000-', '江苏', '江苏省', 'JiangSu', 'JiangSu', 'JX', '320000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320100', '320000', '156-320000-320100-', '南京', '南京市', '', '', '', '320100', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320101', '320100', '156-320000-320100-320101-', '市辖区', '市辖区', '', '', '', '320101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320102', '320100', '156-320000-320100-320102-', '玄武区', '玄武区', '', '', '', '320102', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320103', '320100', '156-320000-320100-320103-', '白下区', '白下区', '', '', '', '320103', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320104', '320100', '156-320000-320100-320104-', '秦淮区', '秦淮区', '', '', '', '320104', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320105', '320100', '156-320000-320100-320105-', '建邺区', '建邺区', '', '', '', '320105', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320106', '320100', '156-320000-320100-320106-', '鼓楼区', '鼓楼区', '', '', '', '320106', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320107', '320100', '156-320000-320100-320107-', '下关区', '下关区', '', '', '', '320107', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320111', '320100', '156-320000-320100-320111-', '浦口区', '浦口区', '', '', '', '320111', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320113', '320100', '156-320000-320100-320113-', '栖霞区', '栖霞区', '', '', '', '320113', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320114', '320100', '156-320000-320100-320114-', '雨花台区', '雨花台区', '', '', '', '320114', '210000', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320115', '320100', '156-320000-320100-320115-', '江宁区', '江宁区', '', '', '', '320115', '211100', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320116', '320100', '156-320000-320100-320116-', '六合区', '六合区', '', '', '', '320116', '211500', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320124', '320100', '156-320000-320100-320124-', '溧水县', '溧水县', '', '', '', '320124', '211200', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320125', '320100', '156-320000-320100-320125-', '高淳县', '高淳县', '', '', '', '320125', '211300', '025', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320200', '320000', '156-320000-320200-', '无锡', '无锡市', '', '', '', '320200', '214000', '0510', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320201', '320200', '156-320000-320200-320201-', '市辖区', '市辖区', '', '', '', '320201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320202', '320200', '156-320000-320200-320202-', '崇安区', '崇安区', '', '', '', '320202', '214000', '0510', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320203', '320200', '156-320000-320200-320203-', '南长区', '南长区', '', '', '', '320203', '214000', '0510', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320204', '320200', '156-320000-320200-320204-', '北塘区', '北塘区', '', '', '', '320204', '214000', '0510', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320205', '320200', '156-320000-320200-320205-', '锡山区', '锡山区', '', '', '', '320205', '214000', '0510', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320206', '320200', '156-320000-320200-320206-', '惠山区', '惠山区', '', '', '', '320206', '214000', '0510', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320211', '320200', '156-320000-320200-320211-', '滨湖区', '滨湖区', '', '', '', '320211', '214062', '0510', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320281', '320200', '156-320000-320200-320281-', '江阴市', '江阴市', '', '', '', '320281', '214400', '0510', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320282', '320200', '156-320000-320200-320282-', '宜兴市', '宜兴市', '', '', '', '320282', '214200', '0510', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320300', '320000', '156-320000-320300-', '徐州', '徐州市', '', '', '', '320300', '221000', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320301', '320300', '156-320000-320300-320301-', '市辖区', '市辖区', '', '', '', '320301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320302', '320300', '156-320000-320300-320302-', '鼓楼区', '鼓楼区', '', '', '', '320302', '221000', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320303', '320300', '156-320000-320300-320303-', '云龙区', '云龙区', '', '', '', '320303', '221000', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320305', '320300', '156-320000-320300-320305-', '贾汪区', '贾汪区', '', '', '', '320305', '221000', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320311', '320300', '156-320000-320300-320311-', '泉山区', '泉山区', '', '', '', '320311', '221000', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320312', '320300', '156-320000-320300-320312-', '铜山区', '铜山区', '', '', '', '320312', '221100', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320321', '320300', '156-320000-320300-320321-', '丰县', '丰县', '', '', '', '320321', '221700', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320322', '320300', '156-320000-320300-320322-', '沛县', '沛县', '', '', '', '320322', '221600', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320324', '320300', '156-320000-320300-320324-', '睢宁县', '睢宁县', '', '', '', '320324', '221200', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320381', '320300', '156-320000-320300-320381-', '新沂市', '新沂市', '', '', '', '320381', '221400', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320382', '320300', '156-320000-320300-320382-', '邳州市', '邳州市', '', '', '', '320382', '221300', '0516', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320400', '320000', '156-320000-320400-', '常州', '常州市', '', '', '', '320400', '213000', '0519', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320401', '320400', '156-320000-320400-320401-', '市辖区', '市辖区', '', '', '', '320401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320402', '320400', '156-320000-320400-320402-', '天宁区', '天宁区', '', '', '', '320402', '213000', '0519', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320404', '320400', '156-320000-320400-320404-', '钟楼区', '钟楼区', '', '', '', '320404', '213000', '0519', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320405', '320400', '156-320000-320400-320405-', '戚墅堰区', '戚墅堰区', '', '', '', '320405', '213000', '0519', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320411', '320400', '156-320000-320400-320411-', '新北区', '新北区', '', '', '', '320411', '213001', '0519', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320412', '320400', '156-320000-320400-320412-', '武进区', '武进区', '', '', '', '320412', '213100', '0519', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320481', '320400', '156-320000-320400-320481-', '溧阳市', '溧阳市', '', '', '', '320481', '213300', '0519', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320482', '320400', '156-320000-320400-320482-', '金坛市', '金坛市', '', '', '', '320482', '213200', '0519', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320500', '320000', '156-320000-320500-', '苏州', '苏州市', '', '', '', '320500', '215000', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320501', '320500', '156-320000-320500-320501-', '市辖区', '市辖区', '', '', '', '320501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320505', '320500', '156-320000-320500-320505-', '虎丘区', '虎丘区', '', '', '', '320505', '215000', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320506', '320500', '156-320000-320500-320506-', '吴中区', '吴中区', '', '', '', '320506', '215100', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320507', '320500', '156-320000-320500-320507-', '相城区', '相城区', '', '', '', '320507', '215100', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320508', '320500', '156-320000-320500-320508-', '姑苏区', '姑苏区', '', '', '', '320508', '215008', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320509', '320500', '156-320000-320500-320509-', '吴江区', '吴江区', '', '', '', '320509', '215200', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320581', '320500', '156-320000-320500-320581-', '常熟市', '常熟市', '', '', '', '320581', '215500', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320582', '320500', '156-320000-320500-320582-', '张家港市', '张家港市', '', '', '', '320582', '215600', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320583', '320500', '156-320000-320500-320583-', '昆山市', '昆山市', '', '', '', '320583', '215300', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320585', '320500', '156-320000-320500-320585-', '太仓市', '太仓市', '', '', '', '320585', '215400', '0512', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320600', '320000', '156-320000-320600-', '南通', '南通市', '', '', '', '320600', '226000', '0513', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320601', '320600', '156-320000-320600-320601-', '市辖区', '市辖区', '', '', '', '320601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320602', '320600', '156-320000-320600-320602-', '崇川区', '崇川区', '', '', '', '320602', '226000', '0513', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320611', '320600', '156-320000-320600-320611-', '港闸区', '港闸区', '', '', '', '320611', '226000', '0513', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320612', '320600', '156-320000-320600-320612-', '通州区', '通州区', '', '', '', '320612', '226300', '0513', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320621', '320600', '156-320000-320600-320621-', '海安县', '海安县', '', '', '', '320621', '226600', '0513', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320623', '320600', '156-320000-320600-320623-', '如东县', '如东县', '', '', '', '320623', '226400', '0513', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320681', '320600', '156-320000-320600-320681-', '启东市', '启东市', '', '', '', '320681', '226200', '0513', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320682', '320600', '156-320000-320600-320682-', '如皋市', '如皋市', '', '', '', '320682', '226500', '0513', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320684', '320600', '156-320000-320600-320684-', '海门市', '海门市', '', '', '', '320684', '226100', '0513', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320700', '320000', '156-320000-320700-', '连云港', '连云港市', '', '', '', '320700', '222000', '0518', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320701', '320700', '156-320000-320700-320701-', '市辖区', '市辖区', '', '', '', '320701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320703', '320700', '156-320000-320700-320703-', '连云区', '连云区', '', '', '', '320703', '222000', '0518', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320705', '320700', '156-320000-320700-320705-', '新浦区', '新浦区', '', '', '', '320705', '222000', '0518', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320706', '320700', '156-320000-320700-320706-', '海州区', '海州区', '', '', '', '320706', '222000', '0518', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320721', '320700', '156-320000-320700-320721-', '赣榆县', '赣榆县', '', '', '', '320721', '222100', '0518', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320722', '320700', '156-320000-320700-320722-', '东海县', '东海县', '', '', '', '320722', '222300', '0518', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320723', '320700', '156-320000-320700-320723-', '灌云县', '灌云县', '', '', '', '320723', '222200', '0518', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320724', '320700', '156-320000-320700-320724-', '灌南县', '灌南县', '', '', '', '320724', '223500', '0518', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320800', '320000', '156-320000-320800-', '淮安', '淮安市', '', '', '', '320800', '223001', '0517', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320801', '320800', '156-320000-320800-320801-', '市辖区', '市辖区', '', '', '', '320801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320802', '320800', '156-320000-320800-320802-', '清河区', '清河区', '', '', '', '320802', '223001', '0517', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320803', '320800', '156-320000-320800-320803-', '淮安区', '淮安区', '', '', '', '320803', '223200', '0517', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320804', '320800', '156-320000-320800-320804-', '淮阴区', '淮阴区', '', '', '', '320804', '223300', '0517', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320811', '320800', '156-320000-320800-320811-', '清浦区', '清浦区', '', '', '', '320811', '223001', '0517', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320826', '320800', '156-320000-320800-320826-', '涟水县', '涟水县', '', '', '', '320826', '223400', '0517', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320829', '320800', '156-320000-320800-320829-', '洪泽县', '洪泽县', '', '', '', '320829', '223100', '0517', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320830', '320800', '156-320000-320800-320830-', '盱眙县', '盱眙县', '', '', '', '320830', '211700', '0517', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320831', '320800', '156-320000-320800-320831-', '金湖县', '金湖县', '', '', '', '320831', '211600', '0517', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320900', '320000', '156-320000-320900-', '盐城', '盐城市', '', '', '', '320900', '224000', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320901', '320900', '156-320000-320900-320901-', '市辖区', '市辖区', '', '', '', '320901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320902', '320900', '156-320000-320900-320902-', '亭湖区', '亭湖区', '', '', '', '320902', '0', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320903', '320900', '156-320000-320900-320903-', '盐都区', '盐都区', '', '', '', '320903', '224000', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320921', '320900', '156-320000-320900-320921-', '响水县', '响水县', '', '', '', '320921', '224600', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320922', '320900', '156-320000-320900-320922-', '滨海县', '滨海县', '', '', '', '320922', '224000', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320923', '320900', '156-320000-320900-320923-', '阜宁县', '阜宁县', '', '', '', '320923', '224400', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320924', '320900', '156-320000-320900-320924-', '射阳县', '射阳县', '', '', '', '320924', '224300', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320925', '320900', '156-320000-320900-320925-', '建湖县', '建湖县', '', '', '', '320925', '224700', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320981', '320900', '156-320000-320900-320981-', '东台市', '东台市', '', '', '', '320981', '224200', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('320982', '320900', '156-320000-320900-320982-', '大丰市', '大丰市', '', '', '', '320982', '224100', '0515', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321000', '320000', '156-320000-321000-', '扬州', '扬州市', '', '', '', '321000', '225000', '0514', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321001', '321000', '156-320000-321000-321001-', '市辖区', '市辖区', '', '', '', '321001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321002', '321000', '156-320000-321000-321002-', '广陵区', '广陵区', '', '', '', '321002', '225000', '0514', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321003', '321000', '156-320000-321000-321003-', '邗江区', '邗江区', '', '', '', '321003', '225100', '0514', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321012', '321000', '156-320000-321000-321012-', '江都区', '江都区', '', '', '', '321012', '225200', '0514', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321023', '321000', '156-320000-321000-321023-', '宝应县', '宝应县', '', '', '', '321023', '225800', '0514', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321081', '321000', '156-320000-321000-321081-', '仪征市', '仪征市', '', '', '', '321081', '211400', '0514', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321084', '321000', '156-320000-321000-321084-', '高邮市', '高邮市', '', '', '', '321084', '225600', '0514', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321100', '320000', '156-320000-321100-', '镇江', '镇江市', '', '', '', '321100', '212000', '0511', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321101', '321100', '156-320000-321100-321101-', '市辖区', '市辖区', '', '', '', '321101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321102', '321100', '156-320000-321100-321102-', '京口区', '京口区', '', '', '', '321102', '212000', '0511', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321111', '321100', '156-320000-321100-321111-', '润州区', '润州区', '', '', '', '321111', '212000', '0511', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321112', '321100', '156-320000-321100-321112-', '丹徒区', '丹徒区', '', '', '', '321112', '212100', '0511', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321181', '321100', '156-320000-321100-321181-', '丹阳市', '丹阳市', '', '', '', '321181', '212300', '0511', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321182', '321100', '156-320000-321100-321182-', '扬中市', '扬中市', '', '', '', '321182', '212200', '0511', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321183', '321100', '156-320000-321100-321183-', '句容市', '句容市', '', '', '', '321183', '212400', '0511', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321200', '320000', '156-320000-321200-', '泰州', '泰州市', '', '', '', '321200', '225300', '0523', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321201', '321200', '156-320000-321200-321201-', '市辖区', '市辖区', '', '', '', '321201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321202', '321200', '156-320000-321200-321202-', '海陵区', '海陵区', '', '', '', '321202', '225300', '0523', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321203', '321200', '156-320000-321200-321203-', '高港区', '高港区', '', '', '', '321203', '225300', '0523', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321281', '321200', '156-320000-321200-321281-', '兴化市', '兴化市', '', '', '', '321281', '225700', '0523', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321282', '321200', '156-320000-321200-321282-', '靖江市', '靖江市', '', '', '', '321282', '214500', '0523', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321283', '321200', '156-320000-321200-321283-', '泰兴市', '泰兴市', '', '', '', '321283', '225400', '0523', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321284', '321200', '156-320000-321200-321284-', '姜堰市', '姜堰市', '', '', '', '321284', '225500', '0523', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321300', '320000', '156-320000-321300-', '宿迁', '宿迁市', '', '', '', '321300', '223800', '0527', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321301', '321300', '156-320000-321300-321301-', '市辖区', '市辖区', '', '', '', '321301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321302', '321300', '156-320000-321300-321302-', '宿城区', '宿城区', '', '', '', '321302', '223800', '0527', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321311', '321300', '156-320000-321300-321311-', '宿豫区', '宿豫区', '', '', '', '321311', '223800', '0527', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321322', '321300', '156-320000-321300-321322-', '沭阳县', '沭阳县', '', '', '', '321322', '223600', '0527', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321323', '321300', '156-320000-321300-321323-', '泗阳县', '泗阳县', '', '', '', '321323', '223700', '0527', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('321324', '321300', '156-320000-321300-321324-', '泗洪县', '泗洪县', '', '', '', '321324', '223900', '0527', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330000', '156', '156-330000-', '浙江', '浙江省', 'ZheJiang', 'ZheJiang', 'ZJ', '330000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330100', '330000', '156-330000-330100-', '杭州', '杭州市', '', '', '', '330100', '310000', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330101', '330100', '156-330000-330100-330101-', '市辖区', '市辖区', '', '', '', '330101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330102', '330100', '156-330000-330100-330102-', '上城区', '上城区', '', '', '', '330102', '310000', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330103', '330100', '156-330000-330100-330103-', '下城区', '下城区', '', '', '', '330103', '310000', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330104', '330100', '156-330000-330100-330104-', '江干区', '江干区', '', '', '', '330104', '310000', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330105', '330100', '156-330000-330100-330105-', '拱墅区', '拱墅区', '', '', '', '330105', '310000', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330106', '330100', '156-330000-330100-330106-', '西湖区', '西湖区', '', '', '', '330106', '310000', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330108', '330100', '156-330000-330100-330108-', '滨江区', '滨江区', '', '', '', '330108', '310000', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330109', '330100', '156-330000-330100-330109-', '萧山区', '萧山区', '', '', '', '330109', '311200', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330110', '330100', '156-330000-330100-330110-', '余杭区', '余杭区', '', '', '', '330110', '311100', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330122', '330100', '156-330000-330100-330122-', '桐庐县', '桐庐县', '', '', '', '330122', '311500', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330127', '330100', '156-330000-330100-330127-', '淳安县', '淳安县', '', '', '', '330127', '311700', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330182', '330100', '156-330000-330100-330182-', '建德市', '建德市', '', '', '', '330182', '311600', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330183', '330100', '156-330000-330100-330183-', '富阳市', '富阳市', '', '', '', '330183', '311400', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330185', '330100', '156-330000-330100-330185-', '临安市', '临安市', '', '', '', '330185', '311300', '0571', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330200', '330000', '156-330000-330200-', '宁波', '宁波市', '', '', '', '330200', '315000', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330201', '330200', '156-330000-330200-330201-', '市辖区', '市辖区', '', '', '', '330201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330203', '330200', '156-330000-330200-330203-', '海曙区', '海曙区', '', '', '', '330203', '315000', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330204', '330200', '156-330000-330200-330204-', '江东区', '江东区', '', '', '', '330204', '315000', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330205', '330200', '156-330000-330200-330205-', '江北区', '江北区', '', '', '', '330205', '315000', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330206', '330200', '156-330000-330200-330206-', '北仑区', '北仑区', '', '', '', '330206', '315800', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330211', '330200', '156-330000-330200-330211-', '镇海区', '镇海区', '', '', '', '330211', '315200', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330212', '330200', '156-330000-330200-330212-', '鄞州区', '鄞州区', '', '', '', '330212', '315100', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330225', '330200', '156-330000-330200-330225-', '象山县', '象山县', '', '', '', '330225', '315700', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330226', '330200', '156-330000-330200-330226-', '宁海县', '宁海县', '', '', '', '330226', '315600', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330281', '330200', '156-330000-330200-330281-', '余姚市', '余姚市', '', '', '', '330281', '315400', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330282', '330200', '156-330000-330200-330282-', '慈溪市', '慈溪市', '', '', '', '330282', '315300', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330283', '330200', '156-330000-330200-330283-', '奉化市', '奉化市', '', '', '', '330283', '315500', '0574', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330300', '330000', '156-330000-330300-', '温州', '温州市', '', '', '', '330300', '325000', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330301', '330300', '156-330000-330300-330301-', '市辖区', '市辖区', '', '', '', '330301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330302', '330300', '156-330000-330300-330302-', '鹿城区', '鹿城区', '', '', '', '330302', '325000', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330303', '330300', '156-330000-330300-330303-', '龙湾区', '龙湾区', '', '', '', '330303', '325000', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330304', '330300', '156-330000-330300-330304-', '瓯海区', '瓯海区', '', '', '', '330304', '325000', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330322', '330300', '156-330000-330300-330322-', '洞头县', '洞头县', '', '', '', '330322', '325700', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330324', '330300', '156-330000-330300-330324-', '永嘉县', '永嘉县', '', '', '', '330324', '325100', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330326', '330300', '156-330000-330300-330326-', '平阳县', '平阳县', '', '', '', '330326', '325400', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330327', '330300', '156-330000-330300-330327-', '苍南县', '苍南县', '', '', '', '330327', '325800', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330328', '330300', '156-330000-330300-330328-', '文成县', '文成县', '', '', '', '330328', '325300', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330329', '330300', '156-330000-330300-330329-', '泰顺县', '泰顺县', '', '', '', '330329', '325500', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330381', '330300', '156-330000-330300-330381-', '瑞安市', '瑞安市', '', '', '', '330381', '325200', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330382', '330300', '156-330000-330300-330382-', '乐清市', '乐清市', '', '', '', '330382', '325600', '0577', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330400', '330000', '156-330000-330400-', '嘉兴', '嘉兴市', '', '', '', '330400', '314000', '0573', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330401', '330400', '156-330000-330400-330401-', '市辖区', '市辖区', '', '', '', '330401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330402', '330400', '156-330000-330400-330402-', '南湖区', '南湖区', '', '', '', '330402', '314001', '0573', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330411', '330400', '156-330000-330400-330411-', '秀洲区', '秀洲区', '', '', '', '330411', '314000', '0573', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330421', '330400', '156-330000-330400-330421-', '嘉善县', '嘉善县', '', '', '', '330421', '314100', '0573', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330424', '330400', '156-330000-330400-330424-', '海盐县', '海盐县', '', '', '', '330424', '314300', '0573', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330481', '330400', '156-330000-330400-330481-', '海宁市', '海宁市', '', '', '', '330481', '314400', '0573', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330482', '330400', '156-330000-330400-330482-', '平湖市', '平湖市', '', '', '', '330482', '314200', '0573', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330483', '330400', '156-330000-330400-330483-', '桐乡市', '桐乡市', '', '', '', '330483', '314500', '0573', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330500', '330000', '156-330000-330500-', '湖州', '湖州市', '', '', '', '330500', '313000', '0572', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330501', '330500', '156-330000-330500-330501-', '市辖区', '市辖区', '', '', '', '330501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330502', '330500', '156-330000-330500-330502-', '吴兴区', '吴兴区', '', '', '', '330502', '313000', '0572', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330503', '330500', '156-330000-330500-330503-', '南浔区', '南浔区', '', '', '', '330503', '313000', '0572', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330521', '330500', '156-330000-330500-330521-', '德清县', '德清县', '', '', '', '330521', '313200', '0572', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330522', '330500', '156-330000-330500-330522-', '长兴县', '长兴县', '', '', '', '330522', '313100', '0572', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330523', '330500', '156-330000-330500-330523-', '安吉县', '安吉县', '', '', '', '330523', '313300', '0572', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330600', '330000', '156-330000-330600-', '绍兴', '绍兴市', '', '', '', '330600', '312000', '0575', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330601', '330600', '156-330000-330600-330601-', '市辖区', '市辖区', '', '', '', '330601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330602', '330600', '156-330000-330600-330602-', '越城区', '越城区', '', '', '', '330602', '312000', '0575', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330621', '330600', '156-330000-330600-330621-', '绍兴县', '绍兴县', '', '', '', '330621', '312000', '0575', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330624', '330600', '156-330000-330600-330624-', '新昌县', '新昌县', '', '', '', '330624', '312500', '0575', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330681', '330600', '156-330000-330600-330681-', '诸暨市', '诸暨市', '', '', '', '330681', '311800', '0575', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330682', '330600', '156-330000-330600-330682-', '上虞市', '上虞市', '', '', '', '330682', '312300', '0575', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330683', '330600', '156-330000-330600-330683-', '嵊州市', '嵊州市', '', '', '', '330683', '312400', '0575', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330700', '330000', '156-330000-330700-', '金华', '金华市', '', '', '', '330700', '321000', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330701', '330700', '156-330000-330700-330701-', '市辖区', '市辖区', '', '', '', '330701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330702', '330700', '156-330000-330700-330702-', '婺城区', '婺城区', '', '', '', '330702', '321000', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330703', '330700', '156-330000-330700-330703-', '金东区', '金东区', '', '', '', '330703', '321000', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330723', '330700', '156-330000-330700-330723-', '武义县', '武义县', '', '', '', '330723', '321200', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330726', '330700', '156-330000-330700-330726-', '浦江县', '浦江县', '', '', '', '330726', '322200', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330727', '330700', '156-330000-330700-330727-', '磐安县', '磐安县', '', '', '', '330727', '322300', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330781', '330700', '156-330000-330700-330781-', '兰溪市', '兰溪市', '', '', '', '330781', '321100', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330782', '330700', '156-330000-330700-330782-', '义乌市', '义乌市', '', '', '', '330782', '322000', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330783', '330700', '156-330000-330700-330783-', '东阳市', '东阳市', '', '', '', '330783', '322100', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330784', '330700', '156-330000-330700-330784-', '永康市', '永康市', '', '', '', '330784', '321300', '0579', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330800', '330000', '156-330000-330800-', '衢州', '衢州市', '', '', '', '330800', '324000', '0570', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330801', '330800', '156-330000-330800-330801-', '市辖区', '市辖区', '', '', '', '330801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330802', '330800', '156-330000-330800-330802-', '柯城区', '柯城区', '', '', '', '330802', '324000', '0570', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330803', '330800', '156-330000-330800-330803-', '衢江区', '衢江区', '', '', '', '330803', '324000', '0570', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330822', '330800', '156-330000-330800-330822-', '常山县', '常山县', '', '', '', '330822', '324200', '0570', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330824', '330800', '156-330000-330800-330824-', '开化县', '开化县', '', '', '', '330824', '324300', '0570', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330825', '330800', '156-330000-330800-330825-', '龙游县', '龙游县', '', '', '', '330825', '324400', '0570', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330881', '330800', '156-330000-330800-330881-', '江山市', '江山市', '', '', '', '330881', '324100', '0570', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330900', '330000', '156-330000-330900-', '舟山', '舟山市', '', '', '', '330900', '316000', '0580', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330901', '330900', '156-330000-330900-330901-', '市辖区', '市辖区', '', '', '', '330901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330902', '330900', '156-330000-330900-330902-', '定海区', '定海区', '', '', '', '330902', '316000', '0580', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330903', '330900', '156-330000-330900-330903-', '普陀区', '普陀区', '', '', '', '330903', '316100', '0580', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330921', '330900', '156-330000-330900-330921-', '岱山县', '岱山县', '', '', '', '330921', '316200', '0580', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('330922', '330900', '156-330000-330900-330922-', '嵊泗县', '嵊泗县', '', '', '', '330922', '202450', '0580', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331000', '330000', '156-330000-331000-', '台州', '台州市', '', '', '', '331000', '318000', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331001', '331000', '156-330000-331000-331001-', '市辖区', '市辖区', '', '', '', '331001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331002', '331000', '156-330000-331000-331002-', '椒江区', '椒江区', '', '', '', '331002', '317700', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331003', '331000', '156-330000-331000-331003-', '黄岩区', '黄岩区', '', '', '', '331003', '318020', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331004', '331000', '156-330000-331000-331004-', '路桥区', '路桥区', '', '', '', '331004', '318000', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331021', '331000', '156-330000-331000-331021-', '玉环县', '玉环县', '', '', '', '331021', '317600', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331022', '331000', '156-330000-331000-331022-', '三门县', '三门县', '', '', '', '331022', '317100', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331023', '331000', '156-330000-331000-331023-', '天台县', '天台县', '', '', '', '331023', '317200', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331024', '331000', '156-330000-331000-331024-', '仙居县', '仙居县', '', '', '', '331024', '317300', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331081', '331000', '156-330000-331000-331081-', '温岭市', '温岭市', '', '', '', '331081', '317500', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331082', '331000', '156-330000-331000-331082-', '临海市', '临海市', '', '', '', '331082', '317000', '0576', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331100', '330000', '156-330000-331100-', '丽水', '丽水市', '', '', '', '331100', '323000', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331101', '331100', '156-330000-331100-331101-', '市辖区', '市辖区', '', '', '', '331101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331102', '331100', '156-330000-331100-331102-', '莲都区', '莲都区', '', '', '', '331102', '323000', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331121', '331100', '156-330000-331100-331121-', '青田县', '青田县', '', '', '', '331121', '323900', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331122', '331100', '156-330000-331100-331122-', '缙云县', '缙云县', '', '', '', '331122', '321400', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331123', '331100', '156-330000-331100-331123-', '遂昌县', '遂昌县', '', '', '', '331123', '323300', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331124', '331100', '156-330000-331100-331124-', '松阳县', '松阳县', '', '', '', '331124', '323400', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331125', '331100', '156-330000-331100-331125-', '云和县', '云和县', '', '', '', '331125', '323600', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331126', '331100', '156-330000-331100-331126-', '庆元县', '庆元县', '', '', '', '331126', '323800', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331127', '331100', '156-330000-331100-331127-', '景宁畲族自治县', '景宁畲族自治县', '', '', '', '331127', '323500', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('331181', '331100', '156-330000-331100-331181-', '龙泉市', '龙泉市', '', '', '', '331181', '323700', '0578', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340000', '156', '156-340000-', '安徽', '安徽省', 'AnHui', 'AnHui', 'AH', '340000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340100', '340000', '156-340000-340100-', '合肥', '合肥市', '', '', '', '340100', '230000', '0551', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340101', '340100', '156-340000-340100-340101-', '市辖区', '市辖区', '', '', '', '340101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340102', '340100', '156-340000-340100-340102-', '瑶海区', '瑶海区', '', '', '', '340102', '230000', '0551', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340103', '340100', '156-340000-340100-340103-', '庐阳区', '庐阳区', '', '', '', '340103', '230000', '0551', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340104', '340100', '156-340000-340100-340104-', '蜀山区', '蜀山区', '', '', '', '340104', '230000', '0551', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340111', '340100', '156-340000-340100-340111-', '包河区', '包河区', '', '', '', '340111', '230000', '0551', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340121', '340100', '156-340000-340100-340121-', '长丰县', '长丰县', '', '', '', '340121', '231100', '0551', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340122', '340100', '156-340000-340100-340122-', '肥东县', '肥东县', '', '', '', '340122', '230000', '0551', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340123', '340100', '156-340000-340100-340123-', '肥西县', '肥西县', '', '', '', '340123', '231200', '0551', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340124', '340100', '156-340000-340100-340124-', '庐江县', '庐江县', '', '', '', '340124', '231500', '0565', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340181', '340100', '156-340000-340100-340181-', '巢湖', '巢湖市', '', '', '', '340181', '238000', '0565', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340200', '340000', '156-340000-340200-', '芜湖', '芜湖市', '', '', '', '340200', '241000', '0553', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340201', '340200', '156-340000-340200-340201-', '市辖区', '市辖区', '', '', '', '340201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340202', '340200', '156-340000-340200-340202-', '镜湖区', '镜湖区', '', '', '', '340202', '241000', '0553', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340203', '340200', '156-340000-340200-340203-', '弋江区', '弋江区', '', '', '', '340203', '241000', '0553', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340207', '340200', '156-340000-340200-340207-', '鸠江区', '鸠江区', '', '', '', '340207', '241000', '0553', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340208', '340200', '156-340000-340200-340208-', '三山区', '三山区', '', '', '', '340208', '241000', '0553', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340221', '340200', '156-340000-340200-340221-', '芜湖县', '芜湖县', '', '', '', '340221', '241100', '0553', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340222', '340200', '156-340000-340200-340222-', '繁昌县', '繁昌县', '', '', '', '340222', '241200', '0553', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340223', '340200', '156-340000-340200-340223-', '南陵县', '南陵县', '', '', '', '340223', '242400', '0553', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340225', '340200', '156-340000-340200-340225-', '无为县', '无为县', '', '', '', '340225', '238300', '0565', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340300', '340000', '156-340000-340300-', '蚌埠', '蚌埠市', '', '', '', '340300', '233000', '0552', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340301', '340300', '156-340000-340300-340301-', '市辖区', '市辖区', '', '', '', '340301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340302', '340300', '156-340000-340300-340302-', '龙子湖区', '龙子湖区', '', '', '', '340302', '233000', '0552', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340303', '340300', '156-340000-340300-340303-', '蚌山区', '蚌山区', '', '', '', '340303', '233000', '0552', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340304', '340300', '156-340000-340300-340304-', '禹会区', '禹会区', '', '', '', '340304', '233000', '0552', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340311', '340300', '156-340000-340300-340311-', '淮上区', '淮上区', '', '', '', '340311', '233000', '0552', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340321', '340300', '156-340000-340300-340321-', '怀远县', '怀远县', '', '', '', '340321', '233400', '0552', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340322', '340300', '156-340000-340300-340322-', '五河县', '五河县', '', '', '', '340322', '233300', '0552', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340323', '340300', '156-340000-340300-340323-', '固镇县', '固镇县', '', '', '', '340323', '233700', '0552', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340400', '340000', '156-340000-340400-', '淮南', '淮南市', '', '', '', '340400', '232000', '0554', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340401', '340400', '156-340000-340400-340401-', '市辖区', '市辖区', '', '', '', '340401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340402', '340400', '156-340000-340400-340402-', '大通区', '大通区', '', '', '', '340402', '232000', '0554', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340403', '340400', '156-340000-340400-340403-', '田家庵区', '田家庵区', '', '', '', '340403', '232000', '0554', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340404', '340400', '156-340000-340400-340404-', '谢家集区', '谢家集区', '', '', '', '340404', '232000', '0554', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340405', '340400', '156-340000-340400-340405-', '八公山区', '八公山区', '', '', '', '340405', '232000', '0554', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340406', '340400', '156-340000-340400-340406-', '潘集区', '潘集区', '', '', '', '340406', '232000', '0554', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340421', '340400', '156-340000-340400-340421-', '凤台县', '凤台县', '', '', '', '340421', '232100', '0554', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340500', '340000', '156-340000-340500-', '马鞍山', '马鞍山市', '', '', '', '340500', '243000', '0555', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340501', '340500', '156-340000-340500-340501-', '市辖区', '市辖区', '', '', '', '340501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340503', '340500', '156-340000-340500-340503-', '花山区', '花山区', '', '', '', '340503', '243000', '0555', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340504', '340500', '156-340000-340500-340504-', '雨山区', '雨山区', '', '', '', '340504', '243000', '0555', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340506', '340500', '156-340000-340500-340506-', '博望区', '博望区', '', '', '', '340506', '0', '0555', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340521', '340500', '156-340000-340500-340521-', '当涂县', '当涂县', '', '', '', '340521', '243100', '0555', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340522', '340500', '156-340000-340500-340522-', '含山县', '含山县', '', '', '', '340522', '238100', '0565', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340523', '340500', '156-340000-340500-340523-', '和县', '和县', '', '', '', '340523', '238200', '0565', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340600', '340000', '156-340000-340600-', '淮北', '淮北市', '', '', '', '340600', '235000', '0561', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340601', '340600', '156-340000-340600-340601-', '市辖区', '市辖区', '', '', '', '340601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340602', '340600', '156-340000-340600-340602-', '杜集区', '杜集区', '', '', '', '340602', '235000', '0561', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340603', '340600', '156-340000-340600-340603-', '相山区', '相山区', '', '', '', '340603', '235000', '0561', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340604', '340600', '156-340000-340600-340604-', '烈山区', '烈山区', '', '', '', '340604', '235000', '0561', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340621', '340600', '156-340000-340600-340621-', '濉溪县', '濉溪县', '', '', '', '340621', '235100', '0561', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340700', '340000', '156-340000-340700-', '铜陵', '铜陵市', '', '', '', '340700', '244000', '0562', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340701', '340700', '156-340000-340700-340701-', '市辖区', '市辖区', '', '', '', '340701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340702', '340700', '156-340000-340700-340702-', '铜官山区', '铜官山区', '', '', '', '340702', '244000', '0562', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340703', '340700', '156-340000-340700-340703-', '狮子山区', '狮子山区', '', '', '', '340703', '244000', '0562', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340711', '340700', '156-340000-340700-340711-', '郊区', '郊区', '', '', '', '340711', '246000', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340721', '340700', '156-340000-340700-340721-', '铜陵县', '铜陵县', '', '', '', '340721', '244100', '0562', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340800', '340000', '156-340000-340800-', '安庆', '安庆市', '', '', '', '340800', '246000', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340801', '340800', '156-340000-340800-340801-', '市辖区', '市辖区', '', '', '', '340801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340802', '340800', '156-340000-340800-340802-', '迎江区', '迎江区', '', '', '', '340802', '246000', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340803', '340800', '156-340000-340800-340803-', '大观区', '大观区', '', '', '', '340803', '246000', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340811', '340800', '156-340000-340800-340811-', '宜秀区', '宜秀区', '', '', '', '340811', '246003', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340822', '340800', '156-340000-340800-340822-', '怀宁县', '怀宁县', '', '', '', '340822', '246100', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340823', '340800', '156-340000-340800-340823-', '枞阳县', '枞阳县', '', '', '', '340823', '246700', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340824', '340800', '156-340000-340800-340824-', '潜山县', '潜山县', '', '', '', '340824', '246300', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340825', '340800', '156-340000-340800-340825-', '太湖县', '太湖县', '', '', '', '340825', '246400', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340826', '340800', '156-340000-340800-340826-', '宿松县', '宿松县', '', '', '', '340826', '246500', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340827', '340800', '156-340000-340800-340827-', '望江县', '望江县', '', '', '', '340827', '246200', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340828', '340800', '156-340000-340800-340828-', '岳西县', '岳西县', '', '', '', '340828', '246600', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('340881', '340800', '156-340000-340800-340881-', '桐城市', '桐城市', '', '', '', '340881', '231400', '0556', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341000', '340000', '156-340000-341000-', '黄山', '黄山市', '', '', '', '341000', '245000', '0559', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341001', '341000', '156-340000-341000-341001-', '市辖区', '市辖区', '', '', '', '341001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341002', '341000', '156-340000-341000-341002-', '屯溪区', '屯溪区', '', '', '', '341002', '245000', '0559', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341003', '341000', '156-340000-341000-341003-', '黄山区', '黄山区', '', '', '', '341003', '245000', '0559', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341004', '341000', '156-340000-341000-341004-', '徽州区', '徽州区', '', '', '', '341004', '245061', '0559', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341021', '341000', '156-340000-341000-341021-', '歙县', '歙县', '', '', '', '341021', '245200', '0559', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341022', '341000', '156-340000-341000-341022-', '休宁县', '休宁县', '', '', '', '341022', '245400', '0559', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341023', '341000', '156-340000-341000-341023-', '黟县', '黟县', '', '', '', '341023', '245500', '0559', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341024', '341000', '156-340000-341000-341024-', '祁门县', '祁门县', '', '', '', '341024', '245600', '0559', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341100', '340000', '156-340000-341100-', '滁州', '滁州市', '', '', '', '341100', '239000', '0550', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341101', '341100', '156-340000-341100-341101-', '市辖区', '市辖区', '', '', '', '341101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341102', '341100', '156-340000-341100-341102-', '琅琊区', '琅琊区', '', '', '', '341102', '239000', '0550', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341103', '341100', '156-340000-341100-341103-', '南谯区', '南谯区', '', '', '', '341103', '239000', '0550', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341122', '341100', '156-340000-341100-341122-', '来安县', '来安县', '', '', '', '341122', '239200', '0550', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341124', '341100', '156-340000-341100-341124-', '全椒县', '全椒县', '', '', '', '341124', '239500', '0550', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341125', '341100', '156-340000-341100-341125-', '定远县', '定远县', '', '', '', '341125', '233200', '0550', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341126', '341100', '156-340000-341100-341126-', '凤阳县', '凤阳县', '', '', '', '341126', '233100', '0550', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341181', '341100', '156-340000-341100-341181-', '天长市', '天长市', '', '', '', '341181', '239300', '0550', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341182', '341100', '156-340000-341100-341182-', '明光市', '明光市', '', '', '', '341182', '239400', '0550', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341200', '340000', '156-340000-341200-', '阜阳', '阜阳市', '', '', '', '341200', '236000', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341201', '341200', '156-340000-341200-341201-', '市辖区', '市辖区', '', '', '', '341201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341202', '341200', '156-340000-341200-341202-', '颍州区', '颍州区', '', '', '', '341202', '236000', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341203', '341200', '156-340000-341200-341203-', '颍东区', '颍东区', '', '', '', '341203', '236000', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341204', '341200', '156-340000-341200-341204-', '颍泉区', '颍泉区', '', '', '', '341204', '236000', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341221', '341200', '156-340000-341200-341221-', '临泉县', '临泉县', '', '', '', '341221', '236400', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341222', '341200', '156-340000-341200-341222-', '太和县', '太和县', '', '', '', '341222', '236600', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341225', '341200', '156-340000-341200-341225-', '阜南县', '阜南县', '', '', '', '341225', '236300', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341226', '341200', '156-340000-341200-341226-', '颍上县', '颍上县', '', '', '', '341226', '236200', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341282', '341200', '156-340000-341200-341282-', '界首市', '界首市', '', '', '', '341282', '236500', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341300', '340000', '156-340000-341300-', '宿州', '宿州市', '', '', '', '341300', '234000', '0557', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341301', '341300', '156-340000-341300-341301-', '市辖区', '市辖区', '', '', '', '341301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341302', '341300', '156-340000-341300-341302-', '墉桥区', '墉桥区', '', '', '', '341302', '234000', '0557', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341321', '341300', '156-340000-341300-341321-', '砀山县', '砀山县', '', '', '', '341321', '235300', '0557', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341322', '341300', '156-340000-341300-341322-', '萧县', '萧县', '', '', '', '341322', '235200', '0557', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341323', '341300', '156-340000-341300-341323-', '灵璧县', '灵璧县', '', '', '', '341323', '234200', '0557', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341324', '341300', '156-340000-341300-341324-', '泗县', '泗县', '', '', '', '341324', '234300', '0557', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341500', '340000', '156-340000-341500-', '六安', '六安市', '', '', '', '341500', '237000', '0564', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341501', '341500', '156-340000-341500-341501-', '市辖区', '市辖区', '', '', '', '341501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341502', '341500', '156-340000-341500-341502-', '金安区', '金安区', '', '', '', '341502', '237000', '0564', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341503', '341500', '156-340000-341500-341503-', '裕安区', '裕安区', '', '', '', '341503', '237000', '0564', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341521', '341500', '156-340000-341500-341521-', '寿县', '寿县', '', '', '', '341521', '232200', '0564', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341522', '341500', '156-340000-341500-341522-', '霍邱县', '霍邱县', '', '', '', '341522', '237400', '0564', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341523', '341500', '156-340000-341500-341523-', '舒城县', '舒城县', '', '', '', '341523', '231300', '0564', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341524', '341500', '156-340000-341500-341524-', '金寨县', '金寨县', '', '', '', '341524', '237300', '0564', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341525', '341500', '156-340000-341500-341525-', '霍山县', '霍山县', '', '', '', '341525', '237200', '0564', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341600', '340000', '156-340000-341600-', '亳州', '亳州市', '', '', '', '341600', '236000', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341601', '341600', '156-340000-341600-341601-', '市辖区', '市辖区', '', '', '', '341601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341602', '341600', '156-340000-341600-341602-', '谯城区', '谯城区', '', '', '', '341602', '236800', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341621', '341600', '156-340000-341600-341621-', '涡阳县', '涡阳县', '', '', '', '341621', '233600', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341622', '341600', '156-340000-341600-341622-', '蒙城县', '蒙城县', '', '', '', '341622', '233500', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341623', '341600', '156-340000-341600-341623-', '利辛县', '利辛县', '', '', '', '341623', '236700', '0558', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341700', '340000', '156-340000-341700-', '池州', '池州市', '', '', '', '341700', '247100', '0566', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341701', '341700', '156-340000-341700-341701-', '市辖区', '市辖区', '', '', '', '341701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341702', '341700', '156-340000-341700-341702-', '贵池区', '贵池区', '', '', '', '341702', '247100', '0566', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341721', '341700', '156-340000-341700-341721-', '东至县', '东至县', '', '', '', '341721', '247200', '0566', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341722', '341700', '156-340000-341700-341722-', '石台县', '石台县', '', '', '', '341722', '245100', '0566', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341723', '341700', '156-340000-341700-341723-', '青阳县', '青阳县', '', '', '', '341723', '242800', '0566', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341800', '340000', '156-340000-341800-', '宣城', '宣城市', '', '', '', '341800', '242000', '0563', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341801', '341800', '156-340000-341800-341801-', '市辖区', '市辖区', '', '', '', '341801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341802', '341800', '156-340000-341800-341802-', '宣州区', '宣州区', '', '', '', '341802', '242000', '0563', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341821', '341800', '156-340000-341800-341821-', '郎溪县', '郎溪县', '', '', '', '341821', '242100', '0563', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341822', '341800', '156-340000-341800-341822-', '广德县', '广德县', '', '', '', '341822', '242200', '0563', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341823', '341800', '156-340000-341800-341823-', '泾县', '泾县', '', '', '', '341823', '242500', '0563', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341824', '341800', '156-340000-341800-341824-', '绩溪县', '绩溪县', '', '', '', '341824', '245300', '0563', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341825', '341800', '156-340000-341800-341825-', '旌德县', '旌德县', '', '', '', '341825', '242600', '0563', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('341881', '341800', '156-340000-341800-341881-', '宁国市', '宁国市', '', '', '', '341881', '242300', '0563', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350000', '156', '156-350000-', '福建', '福建省', 'FuJian', 'FuJian', 'FJ', '350000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350100', '350000', '156-350000-350100-', '福州', '福州市', '', '', '', '350100', '350000', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350101', '350100', '156-350000-350100-350101-', '市辖区', '市辖区', '', '', '', '350101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350102', '350100', '156-350000-350100-350102-', '鼓楼区', '鼓楼区', '', '', '', '350102', '350000', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350103', '350100', '156-350000-350100-350103-', '台江区', '台江区', '', '', '', '350103', '350000', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350104', '350100', '156-350000-350100-350104-', '仓山区', '仓山区', '', '', '', '350104', '350000', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350105', '350100', '156-350000-350100-350105-', '马尾区', '马尾区', '', '', '', '350105', '350000', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350111', '350100', '156-350000-350100-350111-', '晋安区', '晋安区', '', '', '', '350111', '350000', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350121', '350100', '156-350000-350100-350121-', '闽侯县', '闽侯县', '', '', '', '350121', '350100', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350122', '350100', '156-350000-350100-350122-', '连江县', '连江县', '', '', '', '350122', '350500', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350123', '350100', '156-350000-350100-350123-', '罗源县', '罗源县', '', '', '', '350123', '350600', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350124', '350100', '156-350000-350100-350124-', '闽清县', '闽清县', '', '', '', '350124', '350800', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350125', '350100', '156-350000-350100-350125-', '永泰县', '永泰县', '', '', '', '350125', '350700', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350128', '350100', '156-350000-350100-350128-', '平潭县', '平潭县', '', '', '', '350128', '350400', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350181', '350100', '156-350000-350100-350181-', '福清市', '福清市', '', '', '', '350181', '350300', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350182', '350100', '156-350000-350100-350182-', '长乐市', '长乐市', '', '', '', '350182', '350200', '0591', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350200', '350000', '156-350000-350200-', '厦门', '厦门市', '', '', '', '350200', '361000', '0592', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350201', '350200', '156-350000-350200-350201-', '市辖区', '市辖区', '', '', '', '350201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350203', '350200', '156-350000-350200-350203-', '思明区', '思明区', '', '', '', '350203', '361000', '0592', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350205', '350200', '156-350000-350200-350205-', '海沧区', '海沧区', '', '', '', '350205', '361000', '0592', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350206', '350200', '156-350000-350200-350206-', '湖里区', '湖里区', '', '', '', '350206', '361000', '0592', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350211', '350200', '156-350000-350200-350211-', '集美区', '集美区', '', '', '', '350211', '361000', '0592', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350212', '350200', '156-350000-350200-350212-', '同安区', '同安区', '', '', '', '350212', '361100', '0592', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350213', '350200', '156-350000-350200-350213-', '翔安区', '翔安区', '', '', '', '350213', '361100', '0592', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350300', '350000', '156-350000-350300-', '莆田', '莆田市', '', '', '', '350300', '351100', '0594', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350301', '350300', '156-350000-350300-350301-', '市辖区', '市辖区', '', '', '', '350301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350302', '350300', '156-350000-350300-350302-', '城厢区', '城厢区', '', '', '', '350302', '351100', '0594', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350303', '350300', '156-350000-350300-350303-', '涵江区', '涵江区', '', '', '', '350303', '351100', '0594', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350304', '350300', '156-350000-350300-350304-', '荔城区', '荔城区', '', '', '', '350304', '351100', '0594', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350305', '350300', '156-350000-350300-350305-', '秀屿区', '秀屿区', '', '', '', '350305', '351100', '0594', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350322', '350300', '156-350000-350300-350322-', '仙游县', '仙游县', '', '', '', '350322', '351200', '0594', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350400', '350000', '156-350000-350400-', '三明', '三明市', '', '', '', '350400', '365000', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350401', '350400', '156-350000-350400-350401-', '市辖区', '市辖区', '', '', '', '350401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350402', '350400', '156-350000-350400-350402-', '梅列区', '梅列区', '', '', '', '350402', '365000', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350403', '350400', '156-350000-350400-350403-', '三元区', '三元区', '', '', '', '350403', '365000', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350421', '350400', '156-350000-350400-350421-', '明溪县', '明溪县', '', '', '', '350421', '365200', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350423', '350400', '156-350000-350400-350423-', '清流县', '清流县', '', '', '', '350423', '365300', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350424', '350400', '156-350000-350400-350424-', '宁化县', '宁化县', '', '', '', '350424', '365400', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350425', '350400', '156-350000-350400-350425-', '大田县', '大田县', '', '', '', '350425', '366100', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350426', '350400', '156-350000-350400-350426-', '尤溪县', '尤溪县', '', '', '', '350426', '365100', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350427', '350400', '156-350000-350400-350427-', '沙县', '沙县', '', '', '', '350427', '365500', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350428', '350400', '156-350000-350400-350428-', '将乐县', '将乐县', '', '', '', '350428', '353300', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350429', '350400', '156-350000-350400-350429-', '泰宁县', '泰宁县', '', '', '', '350429', '354400', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350430', '350400', '156-350000-350400-350430-', '建宁县', '建宁县', '', '', '', '350430', '354500', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350481', '350400', '156-350000-350400-350481-', '永安市', '永安市', '', '', '', '350481', '366000', '0598', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350500', '350000', '156-350000-350500-', '泉州', '泉州市', '', '', '', '350500', '362000', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350501', '350500', '156-350000-350500-350501-', '市辖区', '市辖区', '', '', '', '350501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350502', '350500', '156-350000-350500-350502-', '鲤城区', '鲤城区', '', '', '', '350502', '362000', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350503', '350500', '156-350000-350500-350503-', '丰泽区', '丰泽区', '', '', '', '350503', '362000', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350504', '350500', '156-350000-350500-350504-', '洛江区', '洛江区', '', '', '', '350504', '362000', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350505', '350500', '156-350000-350500-350505-', '泉港区', '泉港区', '', '', '', '350505', '362100', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350521', '350500', '156-350000-350500-350521-', '惠安县', '惠安县', '', '', '', '350521', '362100', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350524', '350500', '156-350000-350500-350524-', '安溪县', '安溪县', '', '', '', '350524', '362400', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350525', '350500', '156-350000-350500-350525-', '永春县', '永春县', '', '', '', '350525', '362600', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350526', '350500', '156-350000-350500-350526-', '德化县', '德化县', '', '', '', '350526', '362500', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350527', '350500', '156-350000-350500-350527-', '金门县', '金门县', '', '', '', '350527', '362000', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350581', '350500', '156-350000-350500-350581-', '石狮市', '石狮市', '', '', '', '350581', '362700', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350582', '350500', '156-350000-350500-350582-', '晋江市', '晋江市', '', '', '', '350582', '362200', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350583', '350500', '156-350000-350500-350583-', '南安市', '南安市', '', '', '', '350583', '362300', '0595', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350600', '350000', '156-350000-350600-', '漳州', '漳州市', '', '', '', '350600', '363000', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350601', '350600', '156-350000-350600-350601-', '市辖区', '市辖区', '', '', '', '350601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350602', '350600', '156-350000-350600-350602-', '芗城区', '芗城区', '', '', '', '350602', '363000', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350603', '350600', '156-350000-350600-350603-', '龙文区', '龙文区', '', '', '', '350603', '363000', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350622', '350600', '156-350000-350600-350622-', '云霄县', '云霄县', '', '', '', '350622', '363300', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350623', '350600', '156-350000-350600-350623-', '漳浦县', '漳浦县', '', '', '', '350623', '363200', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350624', '350600', '156-350000-350600-350624-', '诏安县', '诏安县', '', '', '', '350624', '363500', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350625', '350600', '156-350000-350600-350625-', '长泰县', '长泰县', '', '', '', '350625', '363900', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350626', '350600', '156-350000-350600-350626-', '东山县', '东山县', '', '', '', '350626', '363400', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350627', '350600', '156-350000-350600-350627-', '南靖县', '南靖县', '', '', '', '350627', '363600', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350628', '350600', '156-350000-350600-350628-', '平和县', '平和县', '', '', '', '350628', '363700', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350629', '350600', '156-350000-350600-350629-', '华安县', '华安县', '', '', '', '350629', '363800', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350681', '350600', '156-350000-350600-350681-', '龙海市', '龙海市', '', '', '', '350681', '363100', '0596', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350700', '350000', '156-350000-350700-', '南平', '南平市', '', '', '', '350700', '353000', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350701', '350700', '156-350000-350700-350701-', '市辖区', '市辖区', '', '', '', '350701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350702', '350700', '156-350000-350700-350702-', '延平区', '延平区', '', '', '', '350702', '353000', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350721', '350700', '156-350000-350700-350721-', '顺昌县', '顺昌县', '', '', '', '350721', '353200', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350722', '350700', '156-350000-350700-350722-', '浦城县', '浦城县', '', '', '', '350722', '353400', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350723', '350700', '156-350000-350700-350723-', '光泽县', '光泽县', '', '', '', '350723', '354100', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350724', '350700', '156-350000-350700-350724-', '松溪县', '松溪县', '', '', '', '350724', '353500', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350725', '350700', '156-350000-350700-350725-', '政和县', '政和县', '', '', '', '350725', '353600', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350781', '350700', '156-350000-350700-350781-', '邵武市', '邵武市', '', '', '', '350781', '354000', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350782', '350700', '156-350000-350700-350782-', '武夷山市', '武夷山市', '', '', '', '350782', '354300', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350783', '350700', '156-350000-350700-350783-', '建瓯市', '建瓯市', '', '', '', '350783', '353100', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350784', '350700', '156-350000-350700-350784-', '建阳市', '建阳市', '', '', '', '350784', '354200', '0599', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350800', '350000', '156-350000-350800-', '龙岩', '龙岩市', '', '', '', '350800', '364000', '0597', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350801', '350800', '156-350000-350800-350801-', '市辖区', '市辖区', '', '', '', '350801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350802', '350800', '156-350000-350800-350802-', '新罗区', '新罗区', '', '', '', '350802', '364000', '0597', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350821', '350800', '156-350000-350800-350821-', '长汀县', '长汀县', '', '', '', '350821', '366300', '0597', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350822', '350800', '156-350000-350800-350822-', '永定县', '永定县', '', '', '', '350822', '364100', '0597', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350823', '350800', '156-350000-350800-350823-', '上杭县', '上杭县', '', '', '', '350823', '364200', '0597', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350824', '350800', '156-350000-350800-350824-', '武平县', '武平县', '', '', '', '350824', '364300', '0597', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350825', '350800', '156-350000-350800-350825-', '连城县', '连城县', '', '', '', '350825', '366200', '0597', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350881', '350800', '156-350000-350800-350881-', '漳平市', '漳平市', '', '', '', '350881', '364400', '0597', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350900', '350000', '156-350000-350900-', '宁德', '宁德市', '', '', '', '350900', '352000', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350901', '350900', '156-350000-350900-350901-', '市辖区', '市辖区', '', '', '', '350901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350902', '350900', '156-350000-350900-350902-', '蕉城区', '蕉城区', '', '', '', '350902', '352000', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350921', '350900', '156-350000-350900-350921-', '霞浦县', '霞浦县', '', '', '', '350921', '355100', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350922', '350900', '156-350000-350900-350922-', '古田县', '古田县', '', '', '', '350922', '352200', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350923', '350900', '156-350000-350900-350923-', '屏南县', '屏南县', '', '', '', '350923', '352300', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350924', '350900', '156-350000-350900-350924-', '寿宁县', '寿宁县', '', '', '', '350924', '355500', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350925', '350900', '156-350000-350900-350925-', '周宁县', '周宁县', '', '', '', '350925', '355400', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350926', '350900', '156-350000-350900-350926-', '柘荣县', '柘荣县', '', '', '', '350926', '355300', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350981', '350900', '156-350000-350900-350981-', '福安市', '福安市', '', '', '', '350981', '355000', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('350982', '350900', '156-350000-350900-350982-', '福鼎市', '福鼎市', '', '', '', '350982', '355200', '0593', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360000', '156', '156-360000-', '江西', '江西省', 'JiangXi', 'JiangXi', 'JX', '360000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360100', '360000', '156-360000-360100-', '南昌', '南昌市', '', '', '', '360100', '330000', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360101', '360100', '156-360000-360100-360101-', '市辖区', '市辖区', '', '', '', '360101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360102', '360100', '156-360000-360100-360102-', '东湖区', '东湖区', '', '', '', '360102', '330000', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360103', '360100', '156-360000-360100-360103-', '西湖区', '西湖区', '', '', '', '360103', '330000', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360104', '360100', '156-360000-360100-360104-', '青云谱区', '青云谱区', '', '', '', '360104', '330000', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360105', '360100', '156-360000-360100-360105-', '湾里区', '湾里区', '', '', '', '360105', '330000', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360111', '360100', '156-360000-360100-360111-', '青山湖区', '青山湖区', '', '', '', '360111', '330006', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360121', '360100', '156-360000-360100-360121-', '南昌县', '南昌县', '', '', '', '360121', '330200', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360122', '360100', '156-360000-360100-360122-', '新建县', '新建县', '', '', '', '360122', '330100', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360123', '360100', '156-360000-360100-360123-', '安义县', '安义县', '', '', '', '360123', '330500', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360124', '360100', '156-360000-360100-360124-', '进贤县', '进贤县', '', '', '', '360124', '331700', '0791', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360200', '360000', '156-360000-360200-', '景德镇', '景德镇市', '', '', '', '360200', '333000', '0798', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360201', '360200', '156-360000-360200-360201-', '市辖区', '市辖区', '', '', '', '360201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360202', '360200', '156-360000-360200-360202-', '昌江区', '昌江区', '', '', '', '360202', '333000', '0798', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360203', '360200', '156-360000-360200-360203-', '珠山区', '珠山区', '', '', '', '360203', '333000', '0798', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360222', '360200', '156-360000-360200-360222-', '浮梁县', '浮梁县', '', '', '', '360222', '333400', '0798', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360281', '360200', '156-360000-360200-360281-', '乐平市', '乐平市', '', '', '', '360281', '333300', '0798', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360300', '360000', '156-360000-360300-', '萍乡', '萍乡市', '', '', '', '360300', '337000', '0799', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360301', '360300', '156-360000-360300-360301-', '市辖区', '市辖区', '', '', '', '360301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360302', '360300', '156-360000-360300-360302-', '安源区', '安源区', '', '', '', '360302', '337000', '0799', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360313', '360300', '156-360000-360300-360313-', '湘东区', '湘东区', '', '', '', '360313', '337000', '0799', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360321', '360300', '156-360000-360300-360321-', '莲花县', '莲花县', '', '', '', '360321', '337100', '0799', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360322', '360300', '156-360000-360300-360322-', '上栗县', '上栗县', '', '', '', '360322', '337000', '0799', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360323', '360300', '156-360000-360300-360323-', '芦溪县', '芦溪县', '', '', '', '360323', '337000', '0799', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360400', '360000', '156-360000-360400-', '九江', '九江市', '', '', '', '360400', '332000', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360401', '360400', '156-360000-360400-360401-', '市辖区', '市辖区', '', '', '', '360401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360402', '360400', '156-360000-360400-360402-', '庐山区', '庐山区', '', '', '', '360402', '332900', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360403', '360400', '156-360000-360400-360403-', '浔阳区', '浔阳区', '', '', '', '360403', '332000', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360421', '360400', '156-360000-360400-360421-', '九江县', '九江县', '', '', '', '360421', '332100', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360423', '360400', '156-360000-360400-360423-', '武宁县', '武宁县', '', '', '', '360423', '332300', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360424', '360400', '156-360000-360400-360424-', '修水县', '修水县', '', '', '', '360424', '332400', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360425', '360400', '156-360000-360400-360425-', '永修县', '永修县', '', '', '', '360425', '330300', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360426', '360400', '156-360000-360400-360426-', '德安县', '德安县', '', '', '', '360426', '330400', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360427', '360400', '156-360000-360400-360427-', '星子县', '星子县', '', '', '', '360427', '332800', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360428', '360400', '156-360000-360400-360428-', '都昌县', '都昌县', '', '', '', '360428', '332600', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360429', '360400', '156-360000-360400-360429-', '湖口县', '湖口县', '', '', '', '360429', '332500', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360430', '360400', '156-360000-360400-360430-', '彭泽县', '彭泽县', '', '', '', '360430', '332700', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360481', '360400', '156-360000-360400-360481-', '瑞昌市', '瑞昌市', '', '', '', '360481', '332200', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360482', '360400', '156-360000-360400-360482-', '共青城市', '共青城市', '', '', '', '360482', '0', '0792', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360500', '360000', '156-360000-360500-', '新余', '新余市', '', '', '', '360500', '338000', '0790', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360501', '360500', '156-360000-360500-360501-', '市辖区', '市辖区', '', '', '', '360501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360502', '360500', '156-360000-360500-360502-', '渝水区', '渝水区', '', '', '', '360502', '338000', '0790', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360521', '360500', '156-360000-360500-360521-', '分宜县', '分宜县', '', '', '', '360521', '336600', '0790', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360600', '360000', '156-360000-360600-', '鹰潭', '鹰潭市', '', '', '', '360600', '335000', '0701', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360601', '360600', '156-360000-360600-360601-', '市辖区', '市辖区', '', '', '', '360601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360602', '360600', '156-360000-360600-360602-', '月湖区', '月湖区', '', '', '', '360602', '335000', '0701', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360622', '360600', '156-360000-360600-360622-', '余江县', '余江县', '', '', '', '360622', '335200', '0701', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360681', '360600', '156-360000-360600-360681-', '贵溪市', '贵溪市', '', '', '', '360681', '335400', '0701', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360700', '360000', '156-360000-360700-', '赣州', '赣州市', '', '', '', '360700', '341000', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360701', '360700', '156-360000-360700-360701-', '市辖区', '市辖区', '', '', '', '360701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360702', '360700', '156-360000-360700-360702-', '章贡区', '章贡区', '', '', '', '360702', '341000', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360721', '360700', '156-360000-360700-360721-', '赣县', '赣县', '', '', '', '360721', '341100', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360722', '360700', '156-360000-360700-360722-', '信丰县', '信丰县', '', '', '', '360722', '341600', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360723', '360700', '156-360000-360700-360723-', '大余县', '大余县', '', '', '', '360723', '341500', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360724', '360700', '156-360000-360700-360724-', '上犹县', '上犹县', '', '', '', '360724', '341200', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360725', '360700', '156-360000-360700-360725-', '崇义县', '崇义县', '', '', '', '360725', '341300', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360726', '360700', '156-360000-360700-360726-', '安远县', '安远县', '', '', '', '360726', '342100', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360727', '360700', '156-360000-360700-360727-', '龙南县', '龙南县', '', '', '', '360727', '341700', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360728', '360700', '156-360000-360700-360728-', '定南县', '定南县', '', '', '', '360728', '341900', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360729', '360700', '156-360000-360700-360729-', '全南县', '全南县', '', '', '', '360729', '341800', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360730', '360700', '156-360000-360700-360730-', '宁都县', '宁都县', '', '', '', '360730', '342800', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360731', '360700', '156-360000-360700-360731-', '于都县', '于都县', '', '', '', '360731', '342300', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360732', '360700', '156-360000-360700-360732-', '兴国县', '兴国县', '', '', '', '360732', '342400', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360733', '360700', '156-360000-360700-360733-', '会昌县', '会昌县', '', '', '', '360733', '342600', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360734', '360700', '156-360000-360700-360734-', '寻乌县', '寻乌县', '', '', '', '360734', '342200', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360735', '360700', '156-360000-360700-360735-', '石城县', '石城县', '', '', '', '360735', '342700', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360781', '360700', '156-360000-360700-360781-', '瑞金市', '瑞金市', '', '', '', '360781', '342500', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360782', '360700', '156-360000-360700-360782-', '南康市', '南康市', '', '', '', '360782', '341400', '0797', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360800', '360000', '156-360000-360800-', '吉安', '吉安市', '', '', '', '360800', '343000', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360801', '360800', '156-360000-360800-360801-', '市辖区', '市辖区', '', '', '', '360801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360802', '360800', '156-360000-360800-360802-', '吉州区', '吉州区', '', '', '', '360802', '343000', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360803', '360800', '156-360000-360800-360803-', '青原区', '青原区', '', '', '', '360803', '343000', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360821', '360800', '156-360000-360800-360821-', '吉安县', '吉安县', '', '', '', '360821', '343100', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360822', '360800', '156-360000-360800-360822-', '吉水县', '吉水县', '', '', '', '360822', '331600', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360823', '360800', '156-360000-360800-360823-', '峡江县', '峡江县', '', '', '', '360823', '331400', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360824', '360800', '156-360000-360800-360824-', '新干县', '新干县', '', '', '', '360824', '331300', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360825', '360800', '156-360000-360800-360825-', '永丰县', '永丰县', '', '', '', '360825', '331500', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360826', '360800', '156-360000-360800-360826-', '泰和县', '泰和县', '', '', '', '360826', '343700', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360827', '360800', '156-360000-360800-360827-', '遂川县', '遂川县', '', '', '', '360827', '343900', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360828', '360800', '156-360000-360800-360828-', '万安县', '万安县', '', '', '', '360828', '343800', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360829', '360800', '156-360000-360800-360829-', '安福县', '安福县', '', '', '', '360829', '343200', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360830', '360800', '156-360000-360800-360830-', '永新县', '永新县', '', '', '', '360830', '343400', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360881', '360800', '156-360000-360800-360881-', '井冈山市', '井冈山市', '', '', '', '360881', '343600', '0796', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360900', '360000', '156-360000-360900-', '宜春', '宜春市', '', '', '', '360900', '336000', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360901', '360900', '156-360000-360900-360901-', '市辖区', '市辖区', '', '', '', '360901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360902', '360900', '156-360000-360900-360902-', '袁州区', '袁州区', '', '', '', '360902', '336000', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360921', '360900', '156-360000-360900-360921-', '奉新县', '奉新县', '', '', '', '360921', '330700', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360922', '360900', '156-360000-360900-360922-', '万载县', '万载县', '', '', '', '360922', '336100', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360923', '360900', '156-360000-360900-360923-', '上高县', '上高县', '', '', '', '360923', '336400', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360924', '360900', '156-360000-360900-360924-', '宜丰县', '宜丰县', '', '', '', '360924', '336300', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360925', '360900', '156-360000-360900-360925-', '靖安县', '靖安县', '', '', '', '360925', '330600', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360926', '360900', '156-360000-360900-360926-', '铜鼓县', '铜鼓县', '', '', '', '360926', '336200', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360981', '360900', '156-360000-360900-360981-', '丰城市', '丰城市', '', '', '', '360981', '331100', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360982', '360900', '156-360000-360900-360982-', '樟树市', '樟树市', '', '', '', '360982', '331200', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('360983', '360900', '156-360000-360900-360983-', '高安市', '高安市', '', '', '', '360983', '330800', '0795', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361000', '360000', '156-360000-361000-', '抚州', '抚州市', '', '', '', '361000', '344000', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361001', '361000', '156-360000-361000-361001-', '市辖区', '市辖区', '', '', '', '361001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361002', '361000', '156-360000-361000-361002-', '临川区', '临川区', '', '', '', '361002', '344100', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361021', '361000', '156-360000-361000-361021-', '南城县', '南城县', '', '', '', '361021', '344700', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361022', '361000', '156-360000-361000-361022-', '黎川县', '黎川县', '', '', '', '361022', '344600', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361023', '361000', '156-360000-361000-361023-', '南丰县', '南丰县', '', '', '', '361023', '344500', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361024', '361000', '156-360000-361000-361024-', '崇仁县', '崇仁县', '', '', '', '361024', '344200', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361025', '361000', '156-360000-361000-361025-', '乐安县', '乐安县', '', '', '', '361025', '344300', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361026', '361000', '156-360000-361000-361026-', '宜黄县', '宜黄县', '', '', '', '361026', '344400', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361027', '361000', '156-360000-361000-361027-', '金溪县', '金溪县', '', '', '', '361027', '344800', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361028', '361000', '156-360000-361000-361028-', '资溪县', '资溪县', '', '', '', '361028', '335300', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361029', '361000', '156-360000-361000-361029-', '东乡县', '东乡县', '', '', '', '361029', '331800', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361030', '361000', '156-360000-361000-361030-', '广昌县', '广昌县', '', '', '', '361030', '344900', '0794', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361100', '360000', '156-360000-361100-', '上饶', '上饶市', '', '', '', '361100', '334000', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361101', '361100', '156-360000-361100-361101-', '市辖区', '市辖区', '', '', '', '361101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361102', '361100', '156-360000-361100-361102-', '信州区', '信州区', '', '', '', '361102', '334000', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361121', '361100', '156-360000-361100-361121-', '上饶县', '上饶县', '', '', '', '361121', '334100', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361122', '361100', '156-360000-361100-361122-', '广丰县', '广丰县', '', '', '', '361122', '334600', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361123', '361100', '156-360000-361100-361123-', '玉山县', '玉山县', '', '', '', '361123', '334700', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361124', '361100', '156-360000-361100-361124-', '铅山县', '铅山县', '', '', '', '361124', '334500', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361125', '361100', '156-360000-361100-361125-', '横峰县', '横峰县', '', '', '', '361125', '334300', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361126', '361100', '156-360000-361100-361126-', '弋阳县', '弋阳县', '', '', '', '361126', '334400', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361127', '361100', '156-360000-361100-361127-', '余干县', '余干县', '', '', '', '361127', '335100', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361128', '361100', '156-360000-361100-361128-', '鄱阳县', '鄱阳县', '', '', '', '361128', '333100', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361129', '361100', '156-360000-361100-361129-', '万年县', '万年县', '', '', '', '361129', '335500', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361130', '361100', '156-360000-361100-361130-', '婺源县', '婺源县', '', '', '', '361130', '333200', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('361181', '361100', '156-360000-361100-361181-', '德兴市', '德兴市', '', '', '', '361181', '334200', '0793', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370000', '156', '156-370000-', '山东', '山东省', 'ShanDong', 'ShanDong', 'SD', '370000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370100', '370000', '156-370000-370100-', '济南', '济南市', '', '', '', '370100', '250000', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370101', '370100', '156-370000-370100-370101-', '市辖区', '市辖区', '', '', '', '370101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370102', '370100', '156-370000-370100-370102-', '历下区', '历下区', '', '', '', '370102', '250000', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370103', '370100', '156-370000-370100-370103-', '市中区', '市中区', '', '', '', '370103', '250000', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370104', '370100', '156-370000-370100-370104-', '槐荫区', '槐荫区', '', '', '', '370104', '250000', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370105', '370100', '156-370000-370100-370105-', '天桥区', '天桥区', '', '', '', '370105', '250000', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370112', '370100', '156-370000-370100-370112-', '历城区', '历城区', '', '', '', '370112', '250100', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370113', '370100', '156-370000-370100-370113-', '长清区', '长清区', '', '', '', '370113', '250300', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370124', '370100', '156-370000-370100-370124-', '平阴县', '平阴县', '', '', '', '370124', '250400', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370125', '370100', '156-370000-370100-370125-', '济阳县', '济阳县', '', '', '', '370125', '251400', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370126', '370100', '156-370000-370100-370126-', '商河县', '商河县', '', '', '', '370126', '251600', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370181', '370100', '156-370000-370100-370181-', '章丘市', '章丘市', '', '', '', '370181', '250200', '0531', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370200', '370000', '156-370000-370200-', '青岛', '青岛市', '', '', '', '370200', '266000', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370201', '370200', '156-370000-370200-370201-', '市辖区', '市辖区', '', '', '', '370201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370202', '370200', '156-370000-370200-370202-', '市南区', '市南区', '', '', '', '370202', '266000', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370203', '370200', '156-370000-370200-370203-', '市北区', '市北区', '', '', '', '370203', '266000', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370205', '370200', '156-370000-370200-370205-', '四方区', '四方区', '', '', '', '370205', '266000', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370211', '370200', '156-370000-370200-370211-', '黄岛区', '黄岛区', '', '', '', '370211', '266000', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370212', '370200', '156-370000-370200-370212-', '崂山区', '崂山区', '', '', '', '370212', '266100', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370213', '370200', '156-370000-370200-370213-', '李沧区', '李沧区', '', '', '', '370213', '266000', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370214', '370200', '156-370000-370200-370214-', '城阳区', '城阳区', '', '', '', '370214', '266000', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370281', '370200', '156-370000-370200-370281-', '胶州市', '胶州市', '', '', '', '370281', '266300', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370282', '370200', '156-370000-370200-370282-', '即墨市', '即墨市', '', '', '', '370282', '266200', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370283', '370200', '156-370000-370200-370283-', '平度市', '平度市', '', '', '', '370283', '266700', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370284', '370200', '156-370000-370200-370284-', '胶南市', '胶南市', '', '', '', '370284', '266400', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370285', '370200', '156-370000-370200-370285-', '莱西市', '莱西市', '', '', '', '370285', '266600', '0532', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370300', '370000', '156-370000-370300-', '淄博', '淄博市', '', '', '', '370300', '255000', '0533', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370301', '370300', '156-370000-370300-370301-', '市辖区', '市辖区', '', '', '', '370301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370302', '370300', '156-370000-370300-370302-', '淄川区', '淄川区', '', '', '', '370302', '255100', '0533', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370303', '370300', '156-370000-370300-370303-', '张店区', '张店区', '', '', '', '370303', '255000', '0533', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370304', '370300', '156-370000-370300-370304-', '博山区', '博山区', '', '', '', '370304', '255200', '0533', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370305', '370300', '156-370000-370300-370305-', '临淄区', '临淄区', '', '', '', '370305', '255400', '0533', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370306', '370300', '156-370000-370300-370306-', '周村区', '周村区', '', '', '', '370306', '255300', '0533', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370321', '370300', '156-370000-370300-370321-', '桓台县', '桓台县', '', '', '', '370321', '256400', '0533', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370322', '370300', '156-370000-370300-370322-', '高青县', '高青县', '', '', '', '370322', '256300', '0533', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370323', '370300', '156-370000-370300-370323-', '沂源县', '沂源县', '', '', '', '370323', '256100', '0533', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370400', '370000', '156-370000-370400-', '枣庄', '枣庄市', '', '', '', '370400', '277000', '0632', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370401', '370400', '156-370000-370400-370401-', '市辖区', '市辖区', '', '', '', '370401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370402', '370400', '156-370000-370400-370402-', '市中区', '市中区', '', '', '', '370402', '277000', '0632', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370403', '370400', '156-370000-370400-370403-', '薛城区', '薛城区', '', '', '', '370403', '277000', '0632', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370404', '370400', '156-370000-370400-370404-', '峄城区', '峄城区', '', '', '', '370404', '277300', '0632', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370405', '370400', '156-370000-370400-370405-', '台儿庄区', '台儿庄区', '', '', '', '370405', '277400', '0632', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370406', '370400', '156-370000-370400-370406-', '山亭区', '山亭区', '', '', '', '370406', '277200', '0632', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370481', '370400', '156-370000-370400-370481-', '滕州市', '滕州市', '', '', '', '370481', '277500', '0632', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370500', '370000', '156-370000-370500-', '东营', '东营市', '', '', '', '370500', '257000', '0546', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370501', '370500', '156-370000-370500-370501-', '市辖区', '市辖区', '', '', '', '370501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370502', '370500', '156-370000-370500-370502-', '东营区', '东营区', '', '', '', '370502', '257100', '0546', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370503', '370500', '156-370000-370500-370503-', '河口区', '河口区', '', '', '', '370503', '257200', '0546', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370521', '370500', '156-370000-370500-370521-', '垦利县', '垦利县', '', '', '', '370521', '257500', '0546', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370522', '370500', '156-370000-370500-370522-', '利津县', '利津县', '', '', '', '370522', '257400', '0546', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370523', '370500', '156-370000-370500-370523-', '广饶县', '广饶县', '', '', '', '370523', '257300', '0546', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370600', '370000', '156-370000-370600-', '烟台', '烟台市', '', '', '', '370600', '264000', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370601', '370600', '156-370000-370600-370601-', '市辖区', '市辖区', '', '', '', '370601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370602', '370600', '156-370000-370600-370602-', '芝罘区', '芝罘区', '', '', '', '370602', '264000', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370611', '370600', '156-370000-370600-370611-', '福山区', '福山区', '', '', '', '370611', '265500', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370612', '370600', '156-370000-370600-370612-', '牟平区', '牟平区', '', '', '', '370612', '264100', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370613', '370600', '156-370000-370600-370613-', '莱山区', '莱山区', '', '', '', '370613', '264000', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370634', '370600', '156-370000-370600-370634-', '长岛县', '长岛县', '', '', '', '370634', '265800', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370681', '370600', '156-370000-370600-370681-', '龙口市', '龙口市', '', '', '', '370681', '265700', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370682', '370600', '156-370000-370600-370682-', '莱阳市', '莱阳市', '', '', '', '370682', '265200', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370683', '370600', '156-370000-370600-370683-', '莱州市', '莱州市', '', '', '', '370683', '261400', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370684', '370600', '156-370000-370600-370684-', '蓬莱市', '蓬莱市', '', '', '', '370684', '265600', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370685', '370600', '156-370000-370600-370685-', '招远市', '招远市', '', '', '', '370685', '265400', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370686', '370600', '156-370000-370600-370686-', '栖霞市', '栖霞市', '', '', '', '370686', '265300', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370687', '370600', '156-370000-370600-370687-', '海阳市', '海阳市', '', '', '', '370687', '265100', '0535', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370700', '370000', '156-370000-370700-', '潍坊', '潍坊市', '', '', '', '370700', '261000', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370701', '370700', '156-370000-370700-370701-', '市辖区', '市辖区', '', '', '', '370701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370702', '370700', '156-370000-370700-370702-', '潍城区', '潍城区', '', '', '', '370702', '261000', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370703', '370700', '156-370000-370700-370703-', '寒亭区', '寒亭区', '', '', '', '370703', '261100', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370704', '370700', '156-370000-370700-370704-', '坊子区', '坊子区', '', '', '', '370704', '261200', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370705', '370700', '156-370000-370700-370705-', '奎文区', '奎文区', '', '', '', '370705', '261000', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370724', '370700', '156-370000-370700-370724-', '临朐县', '临朐县', '', '', '', '370724', '262600', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370725', '370700', '156-370000-370700-370725-', '昌乐县', '昌乐县', '', '', '', '370725', '262400', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370781', '370700', '156-370000-370700-370781-', '青州市', '青州市', '', '', '', '370781', '262500', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370782', '370700', '156-370000-370700-370782-', '诸城市', '诸城市', '', '', '', '370782', '262200', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370783', '370700', '156-370000-370700-370783-', '寿光市', '寿光市', '', '', '', '370783', '262700', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370784', '370700', '156-370000-370700-370784-', '安丘市', '安丘市', '', '', '', '370784', '262100', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370785', '370700', '156-370000-370700-370785-', '高密市', '高密市', '', '', '', '370785', '261500', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370786', '370700', '156-370000-370700-370786-', '昌邑市', '昌邑市', '', '', '', '370786', '261300', '0536', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370800', '370000', '156-370000-370800-', '济宁', '济宁市', '', '', '', '370800', '272000', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370801', '370800', '156-370000-370800-370801-', '市辖区', '市辖区', '', '', '', '370801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370802', '370800', '156-370000-370800-370802-', '市中区', '市中区', '', '', '', '370802', '272000', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370811', '370800', '156-370000-370800-370811-', '任城区', '任城区', '', '', '', '370811', '272000', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370826', '370800', '156-370000-370800-370826-', '微山县', '微山县', '', '', '', '370826', '277600', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370827', '370800', '156-370000-370800-370827-', '鱼台县', '鱼台县', '', '', '', '370827', '272300', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370828', '370800', '156-370000-370800-370828-', '金乡县', '金乡县', '', '', '', '370828', '272200', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370829', '370800', '156-370000-370800-370829-', '嘉祥县', '嘉祥县', '', '', '', '370829', '272400', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370830', '370800', '156-370000-370800-370830-', '汶上县', '汶上县', '', '', '', '370830', '272500', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370831', '370800', '156-370000-370800-370831-', '泗水县', '泗水县', '', '', '', '370831', '273200', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370832', '370800', '156-370000-370800-370832-', '梁山县', '梁山县', '', '', '', '370832', '272600', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370881', '370800', '156-370000-370800-370881-', '曲阜市', '曲阜市', '', '', '', '370881', '273100', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370882', '370800', '156-370000-370800-370882-', '兖州市', '兖州市', '', '', '', '370882', '272000', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370883', '370800', '156-370000-370800-370883-', '邹城市', '邹城市', '', '', '', '370883', '273500', '0537', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370900', '370000', '156-370000-370900-', '泰安', '泰安市', '', '', '', '370900', '271000', '0538', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370901', '370900', '156-370000-370900-370901-', '市辖区', '市辖区', '', '', '', '370901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370902', '370900', '156-370000-370900-370902-', '泰山区', '泰山区', '', '', '', '370902', '271000', '0538', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370911', '370900', '156-370000-370900-370911-', '岱岳区', '岱岳区', '', '', '', '370911', '271000', '0538', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370921', '370900', '156-370000-370900-370921-', '宁阳县', '宁阳县', '', '', '', '370921', '271400', '0538', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370923', '370900', '156-370000-370900-370923-', '东平县', '东平县', '', '', '', '370923', '271500', '0538', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370982', '370900', '156-370000-370900-370982-', '新泰市', '新泰市', '', '', '', '370982', '271200', '0538', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('370983', '370900', '156-370000-370900-370983-', '肥城市', '肥城市', '', '', '', '370983', '271600', '0538', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371000', '370000', '156-370000-371000-', '威海', '威海市', '', '', '', '371000', '264200', '0631', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371001', '371000', '156-370000-371000-371001-', '市辖区', '市辖区', '', '', '', '371001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371002', '371000', '156-370000-371000-371002-', '环翠区', '环翠区', '', '', '', '371002', '264200', '0631', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371081', '371000', '156-370000-371000-371081-', '文登市', '文登市', '', '', '', '371081', '264400', '0631', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371082', '371000', '156-370000-371000-371082-', '荣成市', '荣成市', '', '', '', '371082', '264300', '0631', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371083', '371000', '156-370000-371000-371083-', '乳山市', '乳山市', '', '', '', '371083', '264500', '0631', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371100', '370000', '156-370000-371100-', '日照', '日照市', '', '', '', '371100', '276800', '0633', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371101', '371100', '156-370000-371100-371101-', '市辖区', '市辖区', '', '', '', '371101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371102', '371100', '156-370000-371100-371102-', '东港区', '东港区', '', '', '', '371102', '276800', '0633', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371103', '371100', '156-370000-371100-371103-', '岚山区', '岚山区', '', '', '', '371103', '276800', '0633', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371121', '371100', '156-370000-371100-371121-', '五莲县', '五莲县', '', '', '', '371121', '262300', '0633', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371122', '371100', '156-370000-371100-371122-', '莒县', '莒县', '', '', '', '371122', '276500', '0633', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371200', '370000', '156-370000-371200-', '莱芜', '莱芜市', '', '', '', '371200', '271100', '0634', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371201', '371200', '156-370000-371200-371201-', '市辖区', '市辖区', '', '', '', '371201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371202', '371200', '156-370000-371200-371202-', '莱城区', '莱城区', '', '', '', '371202', '271100', '0634', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371203', '371200', '156-370000-371200-371203-', '钢城区', '钢城区', '', '', '', '371203', '271100', '0634', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371300', '370000', '156-370000-371300-', '临沂', '临沂市', '', '', '', '371300', '276000', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371301', '371300', '156-370000-371300-371301-', '市辖区', '市辖区', '', '', '', '371301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371302', '371300', '156-370000-371300-371302-', '兰山区', '兰山区', '', '', '', '371302', '276000', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371311', '371300', '156-370000-371300-371311-', '罗庄区', '罗庄区', '', '', '', '371311', '276000', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371312', '371300', '156-370000-371300-371312-', '河东区', '河东区', '', '', '', '371312', '276000', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371321', '371300', '156-370000-371300-371321-', '沂南县', '沂南县', '', '', '', '371321', '276300', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371322', '371300', '156-370000-371300-371322-', '郯城县', '郯城县', '', '', '', '371322', '276100', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371323', '371300', '156-370000-371300-371323-', '沂水县', '沂水县', '', '', '', '371323', '276400', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371324', '371300', '156-370000-371300-371324-', '苍山县', '苍山县', '', '', '', '371324', '277700', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371325', '371300', '156-370000-371300-371325-', '费县', '费县', '', '', '', '371325', '273400', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371326', '371300', '156-370000-371300-371326-', '平邑县', '平邑县', '', '', '', '371326', '273300', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371327', '371300', '156-370000-371300-371327-', '莒南县', '莒南县', '', '', '', '371327', '276600', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371328', '371300', '156-370000-371300-371328-', '蒙阴县', '蒙阴县', '', '', '', '371328', '276200', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371329', '371300', '156-370000-371300-371329-', '临沭县', '临沭县', '', '', '', '371329', '276700', '0539', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371400', '370000', '156-370000-371400-', '德州', '德州市', '', '', '', '371400', '253000', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371401', '371400', '156-370000-371400-371401-', '市辖区', '市辖区', '', '', '', '371401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371402', '371400', '156-370000-371400-371402-', '德城区', '德城区', '', '', '', '371402', '253000', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371421', '371400', '156-370000-371400-371421-', '陵县', '陵县', '', '', '', '371421', '253500', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371422', '371400', '156-370000-371400-371422-', '宁津县', '宁津县', '', '', '', '371422', '253400', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371423', '371400', '156-370000-371400-371423-', '庆云县', '庆云县', '', '', '', '371423', '253700', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371424', '371400', '156-370000-371400-371424-', '临邑县', '临邑县', '', '', '', '371424', '251500', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371425', '371400', '156-370000-371400-371425-', '齐河县', '齐河县', '', '', '', '371425', '251100', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371426', '371400', '156-370000-371400-371426-', '平原县', '平原县', '', '', '', '371426', '253100', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371427', '371400', '156-370000-371400-371427-', '夏津县', '夏津县', '', '', '', '371427', '253200', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371428', '371400', '156-370000-371400-371428-', '武城县', '武城县', '', '', '', '371428', '253300', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371481', '371400', '156-370000-371400-371481-', '乐陵市', '乐陵市', '', '', '', '371481', '253600', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371482', '371400', '156-370000-371400-371482-', '禹城市', '禹城市', '', '', '', '371482', '251200', '0534', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371500', '370000', '156-370000-371500-', '聊城', '聊城市', '', '', '', '371500', '252000', '0635', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371501', '371500', '156-370000-371500-371501-', '市辖区', '市辖区', '', '', '', '371501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371502', '371500', '156-370000-371500-371502-', '东昌府区', '东昌府区', '', '', '', '371502', '252000', '0635', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371521', '371500', '156-370000-371500-371521-', '阳谷县', '阳谷县', '', '', '', '371521', '252300', '0635', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371522', '371500', '156-370000-371500-371522-', '莘县', '莘县', '', '', '', '371522', '252400', '0635', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371523', '371500', '156-370000-371500-371523-', '茌平县', '茌平县', '', '', '', '371523', '252100', '0635', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371524', '371500', '156-370000-371500-371524-', '东阿县', '东阿县', '', '', '', '371524', '252200', '0635', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371525', '371500', '156-370000-371500-371525-', '冠县', '冠县', '', '', '', '371525', '252500', '0635', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371526', '371500', '156-370000-371500-371526-', '高唐县', '高唐县', '', '', '', '371526', '252800', '0635', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371581', '371500', '156-370000-371500-371581-', '临清市', '临清市', '', '', '', '371581', '252600', '0635', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371600', '370000', '156-370000-371600-', '滨州', '滨州市', '', '', '', '371600', '256600', '0543', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371601', '371600', '156-370000-371600-371601-', '市辖区', '市辖区', '', '', '', '371601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371602', '371600', '156-370000-371600-371602-', '滨城区', '滨城区', '', '', '', '371602', '256600', '0543', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371621', '371600', '156-370000-371600-371621-', '惠民县', '惠民县', '', '', '', '371621', '251700', '0543', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371622', '371600', '156-370000-371600-371622-', '阳信县', '阳信县', '', '', '', '371622', '251800', '0543', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371623', '371600', '156-370000-371600-371623-', '无棣县', '无棣县', '', '', '', '371623', '251900', '0543', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371624', '371600', '156-370000-371600-371624-', '沾化县', '沾化县', '', '', '', '371624', '256800', '0543', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371625', '371600', '156-370000-371600-371625-', '博兴县', '博兴县', '', '', '', '371625', '256500', '0543', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371626', '371600', '156-370000-371600-371626-', '邹平县', '邹平县', '', '', '', '371626', '256200', '0543', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371700', '370000', '156-370000-371700-', '菏泽', '菏泽市', '', '', '', '371700', '274000', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371701', '371700', '156-370000-371700-371701-', '市辖区', '市辖区', '', '', '', '371701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371702', '371700', '156-370000-371700-371702-', '牡丹区', '牡丹区', '', '', '', '371702', '274000', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371721', '371700', '156-370000-371700-371721-', '曹县', '曹县', '', '', '', '371721', '274400', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371722', '371700', '156-370000-371700-371722-', '单县', '单县', '', '', '', '371722', '274300', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371723', '371700', '156-370000-371700-371723-', '成武县', '成武县', '', '', '', '371723', '274200', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371724', '371700', '156-370000-371700-371724-', '巨野县', '巨野县', '', '', '', '371724', '274900', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371725', '371700', '156-370000-371700-371725-', '郓城县', '郓城县', '', '', '', '371725', '274700', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371726', '371700', '156-370000-371700-371726-', '鄄城县', '鄄城县', '', '', '', '371726', '274600', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371727', '371700', '156-370000-371700-371727-', '定陶县', '定陶县', '', '', '', '371727', '274100', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('371728', '371700', '156-370000-371700-371728-', '东明县', '东明县', '', '', '', '371728', '274500', '0530', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410000', '156', '156-410000-', '河南', '河南省', 'HeNan', 'HeNan', 'HA', '410000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410100', '410000', '156-410000-410100-', '郑州', '郑州市', '', '', '', '410100', '450000', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410101', '410100', '156-410000-410100-410101-', '市辖区', '市辖区', '', '', '', '410101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410102', '410100', '156-410000-410100-410102-', '中原区', '中原区', '', '', '', '410102', '450000', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410103', '410100', '156-410000-410100-410103-', '二七区', '二七区', '', '', '', '410103', '450000', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410104', '410100', '156-410000-410100-410104-', '管城回族区', '管城回族区', '', '', '', '410104', '450000', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410105', '410100', '156-410000-410100-410105-', '金水区', '金水区', '', '', '', '410105', '450000', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410106', '410100', '156-410000-410100-410106-', '上街区', '上街区', '', '', '', '410106', '450041', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410108', '410100', '156-410000-410100-410108-', '惠济区', '惠济区', '', '', '', '410108', '450000', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410122', '410100', '156-410000-410100-410122-', '中牟县', '中牟县', '', '', '', '410122', '451450', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410181', '410100', '156-410000-410100-410181-', '巩义市', '巩义市', '', '', '', '410181', '451200', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410182', '410100', '156-410000-410100-410182-', '荥阳市', '荥阳市', '', '', '', '410182', '450100', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410183', '410100', '156-410000-410100-410183-', '新密市', '新密市', '', '', '', '410183', '452370', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410184', '410100', '156-410000-410100-410184-', '新郑市', '新郑市', '', '', '', '410184', '451100', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410185', '410100', '156-410000-410100-410185-', '登封市', '登封市', '', '', '', '410185', '452470', '0371', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410200', '410000', '156-410000-410200-', '开封', '开封市', '', '', '', '410200', '475000', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410201', '410200', '156-410000-410200-410201-', '市辖区', '市辖区', '', '', '', '410201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410202', '410200', '156-410000-410200-410202-', '龙亭区', '龙亭区', '', '', '', '410202', '475000', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410203', '410200', '156-410000-410200-410203-', '顺河回族区', '顺河回族区', '', '', '', '410203', '475000', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410204', '410200', '156-410000-410200-410204-', '鼓楼区', '鼓楼区', '', '', '', '410204', '475000', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410205', '410200', '156-410000-410200-410205-', '禹王台区', '禹王台区', '', '', '', '410205', '475000', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410211', '410200', '156-410000-410200-410211-', '金明区', '金明区', '', '', '', '410211', '475000', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410221', '410200', '156-410000-410200-410221-', '杞县', '杞县', '', '', '', '410221', '475200', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410222', '410200', '156-410000-410200-410222-', '通许县', '通许县', '', '', '', '410222', '475400', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410223', '410200', '156-410000-410200-410223-', '尉氏县', '尉氏县', '', '', '', '410223', '475500', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410224', '410200', '156-410000-410200-410224-', '开封县', '开封县', '', '', '', '410224', '475100', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410225', '410200', '156-410000-410200-410225-', '兰考县', '兰考县', '', '', '', '410225', '475300', '0378', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410300', '410000', '156-410000-410300-', '洛阳', '洛阳市', '', '', '', '410300', '471000', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410301', '410300', '156-410000-410300-410301-', '市辖区', '市辖区', '', '', '', '410301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410302', '410300', '156-410000-410300-410302-', '老城区', '老城区', '', '', '', '410302', '471000', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410303', '410300', '156-410000-410300-410303-', '西工区', '西工区', '', '', '', '410303', '471000', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410304', '410300', '156-410000-410300-410304-', '瀍河区', '瀍河回族区', '', '', '', '410304', '471000', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410305', '410300', '156-410000-410300-410305-', '涧西区', '涧西区', '', '', '', '410305', '471000', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410306', '410300', '156-410000-410300-410306-', '吉利区', '吉利区', '', '', '', '410306', '471000', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410311', '410300', '156-410000-410300-410311-', '洛龙区', '洛龙区', '', '', '', '410311', '471000', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410322', '410300', '156-410000-410300-410322-', '孟津县', '孟津县', '', '', '', '410322', '471100', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410323', '410300', '156-410000-410300-410323-', '新安县', '新安县', '', '', '', '410323', '471800', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410324', '410300', '156-410000-410300-410324-', '栾川县', '栾川县', '', '', '', '410324', '471500', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410325', '410300', '156-410000-410300-410325-', '嵩县', '嵩县', '', '', '', '410325', '471400', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410326', '410300', '156-410000-410300-410326-', '汝阳县', '汝阳县', '', '', '', '410326', '471200', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410327', '410300', '156-410000-410300-410327-', '宜阳县', '宜阳县', '', '', '', '410327', '471600', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410328', '410300', '156-410000-410300-410328-', '洛宁县', '洛宁县', '', '', '', '410328', '471700', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410329', '410300', '156-410000-410300-410329-', '伊川县', '伊川县', '', '', '', '410329', '471300', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410381', '410300', '156-410000-410300-410381-', '偃师市', '偃师市', '', '', '', '410381', '471900', '0379', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410400', '410000', '156-410000-410400-', '平顶山', '平顶山市', '', '', '', '410400', '467000', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410401', '410400', '156-410000-410400-410401-', '市辖区', '市辖区', '', '', '', '410401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410402', '410400', '156-410000-410400-410402-', '新华区', '新华区', '', '', '', '410402', '467000', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410403', '410400', '156-410000-410400-410403-', '卫东区', '卫东区', '', '', '', '410403', '467000', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410404', '410400', '156-410000-410400-410404-', '石龙区', '石龙区', '', '', '', '410404', '467000', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410411', '410400', '156-410000-410400-410411-', '湛河区', '湛河区', '', '', '', '410411', '467000', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410421', '410400', '156-410000-410400-410421-', '宝丰县', '宝丰县', '', '', '', '410421', '467400', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410422', '410400', '156-410000-410400-410422-', '叶县', '叶县', '', '', '', '410422', '467200', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410423', '410400', '156-410000-410400-410423-', '鲁山县', '鲁山县', '', '', '', '410423', '467300', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410425', '410400', '156-410000-410400-410425-', '郏县', '郏县', '', '', '', '410425', '467100', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410481', '410400', '156-410000-410400-410481-', '舞钢市', '舞钢市', '', '', '', '410481', '462500', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410482', '410400', '156-410000-410400-410482-', '汝州市', '汝州市', '', '', '', '410482', '467500', '0375', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410500', '410000', '156-410000-410500-', '安阳', '安阳市', '', '', '', '410500', '455000', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410501', '410500', '156-410000-410500-410501-', '市辖区', '市辖区', '', '', '', '410501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410502', '410500', '156-410000-410500-410502-', '文峰区', '文峰区', '', '', '', '410502', '455000', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410503', '410500', '156-410000-410500-410503-', '北关区', '北关区', '', '', '', '410503', '455000', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410505', '410500', '156-410000-410500-410505-', '殷都区', '殷都区', '', '', '', '410505', '455000', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410506', '410500', '156-410000-410500-410506-', '龙安区', '龙安区', '', '', '', '410506', '455000', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410522', '410500', '156-410000-410500-410522-', '安阳县', '安阳县', '', '', '', '410522', '455100', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410523', '410500', '156-410000-410500-410523-', '汤阴县', '汤阴县', '', '', '', '410523', '456150', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410526', '410500', '156-410000-410500-410526-', '滑县', '滑县', '', '', '', '410526', '456400', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410527', '410500', '156-410000-410500-410527-', '内黄县', '内黄县', '', '', '', '410527', '456300', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410581', '410500', '156-410000-410500-410581-', '林州市', '林州市', '', '', '', '410581', '456500', '0372', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410600', '410000', '156-410000-410600-', '鹤壁', '鹤壁市', '', '', '', '410600', '458000', '0392', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410601', '410600', '156-410000-410600-410601-', '市辖区', '市辖区', '', '', '', '410601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410602', '410600', '156-410000-410600-410602-', '鹤山区', '鹤山区', '', '', '', '410602', '458000', '0392', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410603', '410600', '156-410000-410600-410603-', '山城区', '山城区', '', '', '', '410603', '458000', '0392', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410611', '410600', '156-410000-410600-410611-', '淇滨区', '淇滨区', '', '', '', '410611', '458000', '0392', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410621', '410600', '156-410000-410600-410621-', '浚县', '浚县', '', '', '', '410621', '456250', '0392', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410622', '410600', '156-410000-410600-410622-', '淇县', '淇县', '', '', '', '410622', '456750', '0392', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410700', '410000', '156-410000-410700-', '新乡', '新乡市', '', '', '', '410700', '453000', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410701', '410700', '156-410000-410700-410701-', '市辖区', '市辖区', '', '', '', '410701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410702', '410700', '156-410000-410700-410702-', '红旗区', '红旗区', '', '', '', '410702', '453000', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410703', '410700', '156-410000-410700-410703-', '卫滨区', '卫滨区', '', '', '', '410703', '453000', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410704', '410700', '156-410000-410700-410704-', '凤泉区', '凤泉区', '', '', '', '410704', '0', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410711', '410700', '156-410000-410700-410711-', '牧野区', '牧野区', '', '', '', '410711', '453002', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410721', '410700', '156-410000-410700-410721-', '新乡县', '新乡县', '', '', '', '410721', '453700', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410724', '410700', '156-410000-410700-410724-', '获嘉县', '获嘉县', '', '', '', '410724', '453800', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410725', '410700', '156-410000-410700-410725-', '原阳县', '原阳县', '', '', '', '410725', '453500', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410726', '410700', '156-410000-410700-410726-', '延津县', '延津县', '', '', '', '410726', '453200', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410727', '410700', '156-410000-410700-410727-', '封丘县', '封丘县', '', '', '', '410727', '453300', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410728', '410700', '156-410000-410700-410728-', '长垣县', '长垣县', '', '', '', '410728', '453400', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410781', '410700', '156-410000-410700-410781-', '卫辉市', '卫辉市', '', '', '', '410781', '453100', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410782', '410700', '156-410000-410700-410782-', '辉县市', '辉县市', '', '', '', '410782', '453600', '0373', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410800', '410000', '156-410000-410800-', '焦作', '焦作市', '', '', '', '410800', '454150', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410801', '410800', '156-410000-410800-410801-', '市辖区', '市辖区', '', '', '', '410801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410802', '410800', '156-410000-410800-410802-', '解放区', '解放区', '', '', '', '410802', '454150', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410803', '410800', '156-410000-410800-410803-', '中站区', '中站区', '', '', '', '410803', '454150', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410804', '410800', '156-410000-410800-410804-', '马村区', '马村区', '', '', '', '410804', '454150', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410811', '410800', '156-410000-410800-410811-', '山阳区', '山阳区', '', '', '', '410811', '454150', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410821', '410800', '156-410000-410800-410821-', '修武县', '修武县', '', '', '', '410821', '454350', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410822', '410800', '156-410000-410800-410822-', '博爱县', '博爱县', '', '', '', '410822', '454450', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410823', '410800', '156-410000-410800-410823-', '武陟县', '武陟县', '', '', '', '410823', '454950', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410825', '410800', '156-410000-410800-410825-', '温县', '温县', '', '', '', '410825', '454850', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410882', '410800', '156-410000-410800-410882-', '沁阳市', '沁阳市', '', '', '', '410882', '454550', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410883', '410800', '156-410000-410800-410883-', '孟州市', '孟州市', '', '', '', '410883', '454750', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410900', '410000', '156-410000-410900-', '濮阳', '濮阳市', '', '', '', '410900', '457000', '0393', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410901', '410900', '156-410000-410900-410901-', '市辖区', '市辖区', '', '', '', '410901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410902', '410900', '156-410000-410900-410902-', '华龙区', '华龙区', '', '', '', '410902', '0', '0393', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410922', '410900', '156-410000-410900-410922-', '清丰县', '清丰县', '', '', '', '410922', '457300', '0393', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410923', '410900', '156-410000-410900-410923-', '南乐县', '南乐县', '', '', '', '410923', '457400', '0393', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410926', '410900', '156-410000-410900-410926-', '范县', '范县', '', '', '', '410926', '457500', '0393', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410927', '410900', '156-410000-410900-410927-', '台前县', '台前县', '', '', '', '410927', '457600', '0393', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('410928', '410900', '156-410000-410900-410928-', '濮阳县', '濮阳县', '', '', '', '410928', '457100', '0393', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411000', '410000', '156-410000-411000-', '许昌', '许昌市', '', '', '', '411000', '461000', '0374', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411001', '411000', '156-410000-411000-411001-', '市辖区', '市辖区', '', '', '', '411001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411002', '411000', '156-410000-411000-411002-', '魏都区', '魏都区', '', '', '', '411002', '461000', '0374', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411023', '411000', '156-410000-411000-411023-', '许昌县', '许昌县', '', '', '', '411023', '461100', '0374', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411024', '411000', '156-410000-411000-411024-', '鄢陵县', '鄢陵县', '', '', '', '411024', '461200', '0374', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411025', '411000', '156-410000-411000-411025-', '襄城县', '襄城县', '', '', '', '411025', '452670', '0374', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411081', '411000', '156-410000-411000-411081-', '禹州市', '禹州市', '', '', '', '411081', '452570', '0374', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411082', '411000', '156-410000-411000-411082-', '长葛市', '长葛市', '', '', '', '411082', '461500', '0374', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411100', '410000', '156-410000-411100-', '漯河', '漯河市', '', '', '', '411100', '462000', '0395', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411101', '411100', '156-410000-411100-411101-', '市辖区', '市辖区', '', '', '', '411101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411102', '411100', '156-410000-411100-411102-', '源汇区', '源汇区', '', '', '', '411102', '462000', '0395', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411103', '411100', '156-410000-411100-411103-', '郾城区', '郾城区', '', '', '', '411103', '462300', '0395', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411104', '411100', '156-410000-411100-411104-', '召陵区', '召陵区', '', '', '', '411104', '462300', '0395', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411121', '411100', '156-410000-411100-411121-', '舞阳县', '舞阳县', '', '', '', '411121', '462400', '0395', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411122', '411100', '156-410000-411100-411122-', '临颍县', '临颍县', '', '', '', '411122', '462600', '0395', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411200', '410000', '156-410000-411200-', '三门峡', '三门峡市', '', '', '', '411200', '472000', '0398', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411201', '411200', '156-410000-411200-411201-', '市辖区', '市辖区', '', '', '', '411201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411202', '411200', '156-410000-411200-411202-', '湖滨区', '湖滨区', '', '', '', '411202', '472000', '0398', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411221', '411200', '156-410000-411200-411221-', '渑池县', '渑池县', '', '', '', '411221', '472400', '0398', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411222', '411200', '156-410000-411200-411222-', '陕县', '陕县', '', '', '', '411222', '472100', '0398', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411224', '411200', '156-410000-411200-411224-', '卢氏县', '卢氏县', '', '', '', '411224', '472200', '0398', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411281', '411200', '156-410000-411200-411281-', '义马市', '义马市', '', '', '', '411281', '472300', '0398', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411282', '411200', '156-410000-411200-411282-', '灵宝市', '灵宝市', '', '', '', '411282', '472500', '0398', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411300', '410000', '156-410000-411300-', '南阳', '南阳市', '', '', '', '411300', '473000', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411301', '411300', '156-410000-411300-411301-', '市辖区', '市辖区', '', '', '', '411301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411302', '411300', '156-410000-411300-411302-', '宛城区', '宛城区', '', '', '', '411302', '473000', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411303', '411300', '156-410000-411300-411303-', '卧龙区', '卧龙区', '', '', '', '411303', '473000', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411321', '411300', '156-410000-411300-411321-', '南召县', '南召县', '', '', '', '411321', '474650', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411322', '411300', '156-410000-411300-411322-', '方城县', '方城县', '', '', '', '411322', '473200', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411323', '411300', '156-410000-411300-411323-', '西峡县', '西峡县', '', '', '', '411323', '474550', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411324', '411300', '156-410000-411300-411324-', '镇平县', '镇平县', '', '', '', '411324', '474250', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411325', '411300', '156-410000-411300-411325-', '内乡县', '内乡县', '', '', '', '411325', '474350', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411326', '411300', '156-410000-411300-411326-', '淅川县', '淅川县', '', '', '', '411326', '474450', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411327', '411300', '156-410000-411300-411327-', '社旗县', '社旗县', '', '', '', '411327', '473300', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411328', '411300', '156-410000-411300-411328-', '唐河县', '唐河县', '', '', '', '411328', '473400', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411329', '411300', '156-410000-411300-411329-', '新野县', '新野县', '', '', '', '411329', '473500', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411330', '411300', '156-410000-411300-411330-', '桐柏县', '桐柏县', '', '', '', '411330', '474750', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411381', '411300', '156-410000-411300-411381-', '邓州市', '邓州市', '', '', '', '411381', '474150', '0377', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411400', '410000', '156-410000-411400-', '商丘', '商丘市', '', '', '', '411400', '476000', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411401', '411400', '156-410000-411400-411401-', '市辖区', '市辖区', '', '', '', '411401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411402', '411400', '156-410000-411400-411402-', '梁园区', '梁园区', '', '', '', '411402', '476000', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411403', '411400', '156-410000-411400-411403-', '睢阳区', '睢阳区', '', '', '', '411403', '476000', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411421', '411400', '156-410000-411400-411421-', '民权县', '民权县', '', '', '', '411421', '476800', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411422', '411400', '156-410000-411400-411422-', '睢县', '睢县', '', '', '', '411422', '476900', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411423', '411400', '156-410000-411400-411423-', '宁陵县', '宁陵县', '', '', '', '411423', '476700', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411424', '411400', '156-410000-411400-411424-', '柘城县', '柘城县', '', '', '', '411424', '476200', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411425', '411400', '156-410000-411400-411425-', '虞城县', '虞城县', '', '', '', '411425', '476300', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411426', '411400', '156-410000-411400-411426-', '夏邑县', '夏邑县', '', '', '', '411426', '476400', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411481', '411400', '156-410000-411400-411481-', '永城市', '永城市', '', '', '', '411481', '476600', '0370', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411500', '410000', '156-410000-411500-', '信阳', '信阳市', '', '', '', '411500', '464000', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411501', '411500', '156-410000-411500-411501-', '市辖区', '市辖区', '', '', '', '411501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411502', '411500', '156-410000-411500-411502-', '浉河区', '浉河区', '', '', '', '411502', '464000', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411503', '411500', '156-410000-411500-411503-', '平桥区', '平桥区', '', '', '', '411503', '464000', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411521', '411500', '156-410000-411500-411521-', '罗山县', '罗山县', '', '', '', '411521', '464200', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411522', '411500', '156-410000-411500-411522-', '光山县', '光山县', '', '', '', '411522', '465450', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411523', '411500', '156-410000-411500-411523-', '新县', '新县', '', '', '', '411523', '465500', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411524', '411500', '156-410000-411500-411524-', '商城县', '商城县', '', '', '', '411524', '465350', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411525', '411500', '156-410000-411500-411525-', '固始县', '固始县', '', '', '', '411525', '465200', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411526', '411500', '156-410000-411500-411526-', '潢川县', '潢川县', '', '', '', '411526', '465150', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411527', '411500', '156-410000-411500-411527-', '淮滨县', '淮滨县', '', '', '', '411527', '464400', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411528', '411500', '156-410000-411500-411528-', '息县', '息县', '', '', '', '411528', '464300', '0376', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411600', '410000', '156-410000-411600-', '周口', '周口市', '', '', '', '411600', '466000', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411601', '411600', '156-410000-411600-411601-', '市辖区', '市辖区', '', '', '', '411601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411602', '411600', '156-410000-411600-411602-', '川汇区', '川汇区', '', '', '', '411602', '466000', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411621', '411600', '156-410000-411600-411621-', '扶沟县', '扶沟县', '', '', '', '411621', '461300', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411622', '411600', '156-410000-411600-411622-', '西华县', '西华县', '', '', '', '411622', '466600', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411623', '411600', '156-410000-411600-411623-', '商水县', '商水县', '', '', '', '411623', '466100', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411624', '411600', '156-410000-411600-411624-', '沈丘县', '沈丘县', '', '', '', '411624', '466300', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411625', '411600', '156-410000-411600-411625-', '郸城县', '郸城县', '', '', '', '411625', '477150', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411626', '411600', '156-410000-411600-411626-', '淮阳县', '淮阳县', '', '', '', '411626', '466700', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411627', '411600', '156-410000-411600-411627-', '太康县', '太康县', '', '', '', '411627', '475400', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411628', '411600', '156-410000-411600-411628-', '鹿邑县', '鹿邑县', '', '', '', '411628', '477200', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411681', '411600', '156-410000-411600-411681-', '项城市', '项城市', '', '', '', '411681', '466200', '0394', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411700', '410000', '156-410000-411700-', '驻马店', '驻马店市', '', '', '', '411700', '463000', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411701', '411700', '156-410000-411700-411701-', '市辖区', '市辖区', '', '', '', '411701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411702', '411700', '156-410000-411700-411702-', '驿城区', '驿城区', '', '', '', '411702', '463000', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411721', '411700', '156-410000-411700-411721-', '西平县', '西平县', '', '', '', '411721', '463900', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411722', '411700', '156-410000-411700-411722-', '上蔡县', '上蔡县', '', '', '', '411722', '463800', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411723', '411700', '156-410000-411700-411723-', '平舆县', '平舆县', '', '', '', '411723', '463400', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411724', '411700', '156-410000-411700-411724-', '正阳县', '正阳县', '', '', '', '411724', '463600', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411725', '411700', '156-410000-411700-411725-', '确山县', '确山县', '', '', '', '411725', '463200', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411726', '411700', '156-410000-411700-411726-', '泌阳县', '泌阳县', '', '', '', '411726', '463700', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411727', '411700', '156-410000-411700-411727-', '汝南县', '汝南县', '', '', '', '411727', '463300', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411728', '411700', '156-410000-411700-411728-', '遂平县', '遂平县', '', '', '', '411728', '463100', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('411729', '411700', '156-410000-411700-411729-', '新蔡县', '新蔡县', '', '', '', '411729', '463500', '0396', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('419000', '410000', '156-410000-419000-', '省直辖县', '省直辖县级行政区划', '', '', '', '419000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('419001', '419000', '156-410000-419000-419001-', '济源', '济源市', '', '', '', '419001', '454650', '0391', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420000', '156', '156-420000-', '湖北', '湖北省', 'HuBei', 'HuBei', 'HB', '420000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420100', '420000', '156-420000-420100-', '武汉', '武汉市', '', '', '', '420100', '430000', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420101', '420100', '156-420000-420100-420101-', '市辖区', '市辖区', '', '', '', '420101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420102', '420100', '156-420000-420100-420102-', '江岸区', '江岸区', '', '', '', '420102', '430014', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420103', '420100', '156-420000-420100-420103-', '江汉区', '江汉区', '', '', '', '420103', '430000', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420104', '420100', '156-420000-420100-420104-', '硚口区', '硚口区', '', '', '', '420104', '430000', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420105', '420100', '156-420000-420100-420105-', '汉阳区', '汉阳区', '', '', '', '420105', '430050', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420106', '420100', '156-420000-420100-420106-', '武昌区', '武昌区', '', '', '', '420106', '430000', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420107', '420100', '156-420000-420100-420107-', '青山区', '青山区', '', '', '', '420107', '430080', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420111', '420100', '156-420000-420100-420111-', '洪山区', '洪山区', '', '', '', '420111', '430070', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420112', '420100', '156-420000-420100-420112-', '东西湖区', '东西湖区', '', '', '', '420112', '430040', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420113', '420100', '156-420000-420100-420113-', '汉南区', '汉南区', '', '', '', '420113', '430090', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420114', '420100', '156-420000-420100-420114-', '蔡甸区', '蔡甸区', '', '', '', '420114', '430100', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420115', '420100', '156-420000-420100-420115-', '江夏区', '江夏区', '', '', '', '420115', '430200', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420116', '420100', '156-420000-420100-420116-', '黄陂区', '黄陂区', '', '', '', '420116', '432200', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420117', '420100', '156-420000-420100-420117-', '新洲区', '新洲区', '', '', '', '420117', '431400', '027', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420200', '420000', '156-420000-420200-', '黄石', '黄石市', '', '', '', '420200', '435000', '0714', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420201', '420200', '156-420000-420200-420201-', '市辖区', '市辖区', '', '', '', '420201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420202', '420200', '156-420000-420200-420202-', '黄石港区', '黄石港区', '', '', '', '420202', '435000', '0714', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420203', '420200', '156-420000-420200-420203-', '西塞山区', '西塞山区', '', '', '', '420203', '0', '0714', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420204', '420200', '156-420000-420200-420204-', '下陆区', '下陆区', '', '', '', '420204', '435000', '0714', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420205', '420200', '156-420000-420200-420205-', '铁山区', '铁山区', '', '', '', '420205', '435000', '0714', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420222', '420200', '156-420000-420200-420222-', '阳新县', '阳新县', '', '', '', '420222', '435200', '0714', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420281', '420200', '156-420000-420200-420281-', '大冶市', '大冶市', '', '', '', '420281', '435100', '0714', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420300', '420000', '156-420000-420300-', '十堰', '十堰市', '', '', '', '420300', '442000', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420301', '420300', '156-420000-420300-420301-', '市辖区', '市辖区', '', '', '', '420301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420302', '420300', '156-420000-420300-420302-', '茅箭区', '茅箭区', '', '', '', '420302', '442000', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420303', '420300', '156-420000-420300-420303-', '张湾区', '张湾区', '', '', '', '420303', '442000', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420321', '420300', '156-420000-420300-420321-', '郧县', '郧县', '', '', '', '420321', '442500', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420322', '420300', '156-420000-420300-420322-', '郧西县', '郧西县', '', '', '', '420322', '442600', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420323', '420300', '156-420000-420300-420323-', '竹山县', '竹山县', '', '', '', '420323', '442200', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420324', '420300', '156-420000-420300-420324-', '竹溪县', '竹溪县', '', '', '', '420324', '442300', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420325', '420300', '156-420000-420300-420325-', '房县', '房县', '', '', '', '420325', '442100', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420381', '420300', '156-420000-420300-420381-', '丹江口市', '丹江口市', '', '', '', '420381', '442700', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420500', '420000', '156-420000-420500-', '宜昌', '宜昌市', '', '', '', '420500', '443000', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420501', '420500', '156-420000-420500-420501-', '市辖区', '市辖区', '', '', '', '420501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420502', '420500', '156-420000-420500-420502-', '西陵区', '西陵区', '', '', '', '420502', '443000', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420503', '420500', '156-420000-420500-420503-', '伍家岗区', '伍家岗区', '', '', '', '420503', '443000', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420504', '420500', '156-420000-420500-420504-', '点军区', '点军区', '', '', '', '420504', '443000', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420505', '420500', '156-420000-420500-420505-', '猇亭区', '猇亭区', '', '', '', '420505', '443000', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420506', '420500', '156-420000-420500-420506-', '夷陵区', '夷陵区', '', '', '', '420506', '443100', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420525', '420500', '156-420000-420500-420525-', '远安县', '远安县', '', '', '', '420525', '444200', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420526', '420500', '156-420000-420500-420526-', '兴山县', '兴山县', '', '', '', '420526', '443700', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420527', '420500', '156-420000-420500-420527-', '秭归县', '秭归县', '', '', '', '420527', '443600', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420528', '420500', '156-420000-420500-420528-', '长阳土家族自治县', '长阳土家族自治县', '', '', '', '420528', '443500', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420529', '420500', '156-420000-420500-420529-', '五峰土家族自治县', '五峰土家族自治县', '', '', '', '420529', '443400', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420581', '420500', '156-420000-420500-420581-', '宜都市', '宜都市', '', '', '', '420581', '443000', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420582', '420500', '156-420000-420500-420582-', '当阳市', '当阳市', '', '', '', '420582', '444100', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420583', '420500', '156-420000-420500-420583-', '枝江市', '枝江市', '', '', '', '420583', '443200', '0717', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420600', '420000', '156-420000-420600-', '襄阳', '襄阳市', '', '', '', '420600', '441000', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420601', '420600', '156-420000-420600-420601-', '市辖区', '市辖区', '', '', '', '420601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420602', '420600', '156-420000-420600-420602-', '襄城区', '襄城区', '', '', '', '420602', '441000', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420606', '420600', '156-420000-420600-420606-', '樊城区', '樊城区', '', '', '', '420606', '441000', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420607', '420600', '156-420000-420600-420607-', '襄州区', '襄州区', '', '', '', '420607', '441100', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420624', '420600', '156-420000-420600-420624-', '南漳县', '南漳县', '', '', '', '420624', '441500', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420625', '420600', '156-420000-420600-420625-', '谷城县', '谷城县', '', '', '', '420625', '441700', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420626', '420600', '156-420000-420600-420626-', '保康县', '保康县', '', '', '', '420626', '441600', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420682', '420600', '156-420000-420600-420682-', '老河口市', '老河口市', '', '', '', '420682', '441800', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420683', '420600', '156-420000-420600-420683-', '枣阳市', '枣阳市', '', '', '', '420683', '441200', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420684', '420600', '156-420000-420600-420684-', '宜城市', '宜城市', '', '', '', '420684', '441400', '0710', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420700', '420000', '156-420000-420700-', '鄂州', '鄂州市', '', '', '', '420700', '436000', '0711', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420701', '420700', '156-420000-420700-420701-', '市辖区', '市辖区', '', '', '', '420701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420702', '420700', '156-420000-420700-420702-', '梁子湖区', '梁子湖区', '', '', '', '420702', '436000', '0711', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420703', '420700', '156-420000-420700-420703-', '华容区', '华容区', '', '', '', '420703', '436000', '0711', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420704', '420700', '156-420000-420700-420704-', '鄂城区', '鄂城区', '', '', '', '420704', '436000', '0711', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420800', '420000', '156-420000-420800-', '荆门', '荆门市', '', '', '', '420800', '448000', '0724', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420801', '420800', '156-420000-420800-420801-', '市辖区', '市辖区', '', '', '', '420801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420802', '420800', '156-420000-420800-420802-', '东宝区', '东宝区', '', '', '', '420802', '448000', '0724', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420804', '420800', '156-420000-420800-420804-', '掇刀区', '掇刀区', '', '', '', '420804', '448000', '0724', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420821', '420800', '156-420000-420800-420821-', '京山县', '京山县', '', '', '', '420821', '431800', '0724', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420822', '420800', '156-420000-420800-420822-', '沙洋县', '沙洋县', '', '', '', '420822', '448200', '0724', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420881', '420800', '156-420000-420800-420881-', '钟祥市', '钟祥市', '', '', '', '420881', '431900', '0724', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420900', '420000', '156-420000-420900-', '孝感', '孝感市', '', '', '', '420900', '432000', '0712', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420901', '420900', '156-420000-420900-420901-', '市辖区', '市辖区', '', '', '', '420901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420902', '420900', '156-420000-420900-420902-', '孝南区', '孝南区', '', '', '', '420902', '432100', '0712', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420921', '420900', '156-420000-420900-420921-', '孝昌县', '孝昌县', '', '', '', '420921', '432900', '0712', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420922', '420900', '156-420000-420900-420922-', '大悟县', '大悟县', '', '', '', '420922', '432800', '0712', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420923', '420900', '156-420000-420900-420923-', '云梦县', '云梦县', '', '', '', '420923', '432500', '0712', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420981', '420900', '156-420000-420900-420981-', '应城市', '应城市', '', '', '', '420981', '432400', '0712', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420982', '420900', '156-420000-420900-420982-', '安陆市', '安陆市', '', '', '', '420982', '432600', '0712', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('420984', '420900', '156-420000-420900-420984-', '汉川市', '汉川市', '', '', '', '420984', '432300', '0712', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421000', '420000', '156-420000-421000-', '荆州', '荆州市', '', '', '', '421000', '434000', '0716', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421001', '421000', '156-420000-421000-421001-', '市辖区', '市辖区', '', '', '', '421001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421002', '421000', '156-420000-421000-421002-', '沙市区', '沙市区', '', '', '', '421002', '434000', '0716', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421003', '421000', '156-420000-421000-421003-', '荆州区', '荆州区', '', '', '', '421003', '434020', '0716', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421022', '421000', '156-420000-421000-421022-', '公安县', '公安县', '', '', '', '421022', '434300', '0716', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421023', '421000', '156-420000-421000-421023-', '监利县', '监利县', '', '', '', '421023', '433300', '0716', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421024', '421000', '156-420000-421000-421024-', '江陵县', '江陵县', '', '', '', '421024', '434100', '0716', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421081', '421000', '156-420000-421000-421081-', '石首市', '石首市', '', '', '', '421081', '434400', '0716', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421083', '421000', '156-420000-421000-421083-', '洪湖市', '洪湖市', '', '', '', '421083', '433200', '0716', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421087', '421000', '156-420000-421000-421087-', '松滋市', '松滋市', '', '', '', '421087', '434200', '0716', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421100', '420000', '156-420000-421100-', '黄冈', '黄冈市', '', '', '', '421100', '438000', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421101', '421100', '156-420000-421100-421101-', '市辖区', '市辖区', '', '', '', '421101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421102', '421100', '156-420000-421100-421102-', '黄州区', '黄州区', '', '', '', '421102', '438000', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421121', '421100', '156-420000-421100-421121-', '团风县', '团风县', '', '', '', '421121', '438000', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421122', '421100', '156-420000-421100-421122-', '红安县', '红安县', '', '', '', '421122', '438400', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421123', '421100', '156-420000-421100-421123-', '罗田县', '罗田县', '', '', '', '421123', '438600', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421124', '421100', '156-420000-421100-421124-', '英山县', '英山县', '', '', '', '421124', '438700', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421125', '421100', '156-420000-421100-421125-', '浠水县', '浠水县', '', '', '', '421125', '438200', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421126', '421100', '156-420000-421100-421126-', '蕲春县', '蕲春县', '', '', '', '421126', '435300', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421127', '421100', '156-420000-421100-421127-', '黄梅县', '黄梅县', '', '', '', '421127', '435500', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421181', '421100', '156-420000-421100-421181-', '麻城市', '麻城市', '', '', '', '421181', '438300', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421182', '421100', '156-420000-421100-421182-', '武穴市', '武穴市', '', '', '', '421182', '435400', '0713', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421200', '420000', '156-420000-421200-', '咸宁', '咸宁市', '', '', '', '421200', '437000', '0715', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421201', '421200', '156-420000-421200-421201-', '市辖区', '市辖区', '', '', '', '421201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421202', '421200', '156-420000-421200-421202-', '咸安区', '咸安区', '', '', '', '421202', '437000', '0715', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421221', '421200', '156-420000-421200-421221-', '嘉鱼县', '嘉鱼县', '', '', '', '421221', '437200', '0715', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421222', '421200', '156-420000-421200-421222-', '通城县', '通城县', '', '', '', '421222', '437400', '0715', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421223', '421200', '156-420000-421200-421223-', '崇阳县', '崇阳县', '', '', '', '421223', '437500', '0715', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421224', '421200', '156-420000-421200-421224-', '通山县', '通山县', '', '', '', '421224', '437600', '0715', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421281', '421200', '156-420000-421200-421281-', '赤壁市', '赤壁市', '', '', '', '421281', '437300', '0715', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421300', '420000', '156-420000-421300-', '随州', '随州市', '', '', '', '421300', '441300', '0722', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421301', '421300', '156-420000-421300-421301-', '市辖区', '市辖区', '', '', '', '421301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421303', '421300', '156-420000-421300-421303-', '曾都区', '曾都区', '', '', '', '421303', '441300', '0722', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421321', '421300', '156-420000-421300-421321-', '随县', '随县', '', '', '', '421321', '441315', '0722', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('421381', '421300', '156-420000-421300-421381-', '广水市', '广水市', '', '', '', '421381', '432700', '0722', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422800', '420000', '156-420000-422800-', '恩施', '恩施土家族苗族自治州', '', '', '', '422800', '445000', '0718', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422801', '422800', '156-420000-422800-422801-', '恩施市', '恩施市', '', '', '', '422801', '445000', '0718', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422802', '422800', '156-420000-422800-422802-', '利川市', '利川市', '', '', '', '422802', '445400', '0718', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422822', '422800', '156-420000-422800-422822-', '建始县', '建始县', '', '', '', '422822', '445300', '0718', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422823', '422800', '156-420000-422800-422823-', '巴东县', '巴东县', '', '', '', '422823', '444300', '0718', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422825', '422800', '156-420000-422800-422825-', '宣恩县', '宣恩县', '', '', '', '422825', '445500', '0718', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422826', '422800', '156-420000-422800-422826-', '咸丰县', '咸丰县', '', '', '', '422826', '445600', '0718', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422827', '422800', '156-420000-422800-422827-', '来凤县', '来凤县', '', '', '', '422827', '445700', '0718', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('422828', '422800', '156-420000-422800-422828-', '鹤峰县', '鹤峰县', '', '', '', '422828', '445800', '0718', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('429000', '420000', '156-420000-429000-', '省直辖县', '省直辖县级行政区划', '', '', '', '429000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('429004', '429000', '156-420000-429000-429004-', '仙桃市', '仙桃市', '', '', '', '429004', '433000', '0728', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('429005', '429000', '156-420000-429000-429005-', '潜江市', '潜江市', '', '', '', '429005', '433100', '0728', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('429006', '429000', '156-420000-429000-429006-', '天门市', '天门市', '', '', '', '429006', '431700', '0728', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('429021', '429000', '156-420000-429000-429021-', '神农架林区', '神农架林区', '', '', '', '429021', '442400', '0719', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430000', '156', '156-430000-', '湖南', '湖南省', 'HuNan', 'HuNan', 'HN', '430000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430100', '430000', '156-430000-430100-', '长沙', '长沙市', '', '', '', '430100', '410000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430101', '430100', '156-430000-430100-430101-', '市辖区', '市辖区', '', '', '', '430101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430102', '430100', '156-430000-430100-430102-', '芙蓉区', '芙蓉区', '', '', '', '430102', '410000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430103', '430100', '156-430000-430100-430103-', '天心区', '天心区', '', '', '', '430103', '410000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430104', '430100', '156-430000-430100-430104-', '岳麓区', '岳麓区', '', '', '', '430104', '410000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430105', '430100', '156-430000-430100-430105-', '开福区', '开福区', '', '', '', '430105', '410000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430111', '430100', '156-430000-430100-430111-', '雨花区', '雨花区', '', '', '', '430111', '410000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430112', '430100', '156-430000-430100-430112-', '望城区', '望城区', '', '', '', '430112', '410200', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430121', '430100', '156-430000-430100-430121-', '长沙县', '长沙县', '', '', '', '430121', '410100', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430124', '430100', '156-430000-430100-430124-', '宁乡县', '宁乡县', '', '', '', '430124', '410600', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430181', '430100', '156-430000-430100-430181-', '浏阳市', '浏阳市', '', '', '', '430181', '410300', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430200', '430000', '156-430000-430200-', '株洲', '株洲市', '', '', '', '430200', '412000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430201', '430200', '156-430000-430200-430201-', '市辖区', '市辖区', '', '', '', '430201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430202', '430200', '156-430000-430200-430202-', '荷塘区', '荷塘区', '', '', '', '430202', '412000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430203', '430200', '156-430000-430200-430203-', '芦淞区', '芦淞区', '', '', '', '430203', '412000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430204', '430200', '156-430000-430200-430204-', '石峰区', '石峰区', '', '', '', '430204', '412000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430211', '430200', '156-430000-430200-430211-', '天元区', '天元区', '', '', '', '430211', '412000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430221', '430200', '156-430000-430200-430221-', '株洲县', '株洲县', '', '', '', '430221', '412000', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430223', '430200', '156-430000-430200-430223-', '攸县', '攸县', '', '', '', '430223', '412300', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430224', '430200', '156-430000-430200-430224-', '茶陵县', '茶陵县', '', '', '', '430224', '412400', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430225', '430200', '156-430000-430200-430225-', '炎陵县', '炎陵县', '', '', '', '430225', '412500', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430281', '430200', '156-430000-430200-430281-', '醴陵市', '醴陵市', '', '', '', '430281', '412200', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430300', '430000', '156-430000-430300-', '湘潭', '湘潭市', '', '', '', '430300', '411100', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430301', '430300', '156-430000-430300-430301-', '市辖区', '市辖区', '', '', '', '430301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430302', '430300', '156-430000-430300-430302-', '雨湖区', '雨湖区', '', '', '', '430302', '411100', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430304', '430300', '156-430000-430300-430304-', '岳塘区', '岳塘区', '', '', '', '430304', '411100', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430321', '430300', '156-430000-430300-430321-', '湘潭县', '湘潭县', '', '', '', '430321', '411200', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430381', '430300', '156-430000-430300-430381-', '湘乡市', '湘乡市', '', '', '', '430381', '411400', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430382', '430300', '156-430000-430300-430382-', '韶山市', '韶山市', '', '', '', '430382', '411300', '0731', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430400', '430000', '156-430000-430400-', '衡阳', '衡阳市', '', '', '', '430400', '421000', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430401', '430400', '156-430000-430400-430401-', '市辖区', '市辖区', '', '', '', '430401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430405', '430400', '156-430000-430400-430405-', '珠晖区', '珠晖区', '', '', '', '430405', '421000', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430406', '430400', '156-430000-430400-430406-', '雁峰区', '雁峰区', '', '', '', '430406', '421000', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430407', '430400', '156-430000-430400-430407-', '石鼓区', '石鼓区', '', '', '', '430407', '421000', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430408', '430400', '156-430000-430400-430408-', '蒸湘区', '蒸湘区', '', '', '', '430408', '421000', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430412', '430400', '156-430000-430400-430412-', '南岳区', '南岳区', '', '', '', '430412', '421000', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430421', '430400', '156-430000-430400-430421-', '衡阳县', '衡阳县', '', '', '', '430421', '421200', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430422', '430400', '156-430000-430400-430422-', '衡南县', '衡南县', '', '', '', '430422', '421100', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430423', '430400', '156-430000-430400-430423-', '衡山县', '衡山县', '', '', '', '430423', '421300', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430424', '430400', '156-430000-430400-430424-', '衡东县', '衡东县', '', '', '', '430424', '421400', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430426', '430400', '156-430000-430400-430426-', '祁东县', '祁东县', '', '', '', '430426', '421600', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430481', '430400', '156-430000-430400-430481-', '耒阳市', '耒阳市', '', '', '', '430481', '421800', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430482', '430400', '156-430000-430400-430482-', '常宁市', '常宁市', '', '', '', '430482', '421500', '0734', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430500', '430000', '156-430000-430500-', '邵阳', '邵阳市', '', '', '', '430500', '422000', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430501', '430500', '156-430000-430500-430501-', '市辖区', '市辖区', '', '', '', '430501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430502', '430500', '156-430000-430500-430502-', '双清区', '双清区', '', '', '', '430502', '422000', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430503', '430500', '156-430000-430500-430503-', '大祥区', '大祥区', '', '', '', '430503', '422000', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430511', '430500', '156-430000-430500-430511-', '北塔区', '北塔区', '', '', '', '430511', '422000', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430521', '430500', '156-430000-430500-430521-', '邵东县', '邵东县', '', '', '', '430521', '422800', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430522', '430500', '156-430000-430500-430522-', '新邵县', '新邵县', '', '', '', '430522', '422900', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430523', '430500', '156-430000-430500-430523-', '邵阳县', '邵阳县', '', '', '', '430523', '422100', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430524', '430500', '156-430000-430500-430524-', '隆回县', '隆回县', '', '', '', '430524', '422200', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430525', '430500', '156-430000-430500-430525-', '洞口县', '洞口县', '', '', '', '430525', '422300', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430527', '430500', '156-430000-430500-430527-', '绥宁县', '绥宁县', '', '', '', '430527', '422600', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430528', '430500', '156-430000-430500-430528-', '新宁县', '新宁县', '', '', '', '430528', '422700', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430529', '430500', '156-430000-430500-430529-', '城步苗族自治县', '城步苗族自治县', '', '', '', '430529', '422500', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430581', '430500', '156-430000-430500-430581-', '武冈市', '武冈市', '', '', '', '430581', '422400', '0739', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430600', '430000', '156-430000-430600-', '岳阳', '岳阳市', '', '', '', '430600', '414000', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430601', '430600', '156-430000-430600-430601-', '市辖区', '市辖区', '', '', '', '430601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430602', '430600', '156-430000-430600-430602-', '岳阳楼区', '岳阳楼区', '', '', '', '430602', '414000', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430603', '430600', '156-430000-430600-430603-', '云溪区', '云溪区', '', '', '', '430603', '414000', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430611', '430600', '156-430000-430600-430611-', '君山区', '君山区', '', '', '', '430611', '414000', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430621', '430600', '156-430000-430600-430621-', '岳阳县', '岳阳县', '', '', '', '430621', '414100', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430623', '430600', '156-430000-430600-430623-', '华容县', '华容县', '', '', '', '430623', '414200', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430624', '430600', '156-430000-430600-430624-', '湘阴县', '湘阴县', '', '', '', '430624', '410500', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430626', '430600', '156-430000-430600-430626-', '平江县', '平江县', '', '', '', '430626', '410400', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430681', '430600', '156-430000-430600-430681-', '汨罗市', '汨罗市', '', '', '', '430681', '414400', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430682', '430600', '156-430000-430600-430682-', '临湘市', '临湘市', '', '', '', '430682', '414300', '0730', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430700', '430000', '156-430000-430700-', '常德', '常德市', '', '', '', '430700', '415000', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430701', '430700', '156-430000-430700-430701-', '市辖区', '市辖区', '', '', '', '430701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430702', '430700', '156-430000-430700-430702-', '武陵区', '武陵区', '', '', '', '430702', '415000', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430703', '430700', '156-430000-430700-430703-', '鼎城区', '鼎城区', '', '', '', '430703', '415100', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430721', '430700', '156-430000-430700-430721-', '安乡县', '安乡县', '', '', '', '430721', '415600', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430722', '430700', '156-430000-430700-430722-', '汉寿县', '汉寿县', '', '', '', '430722', '415900', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430723', '430700', '156-430000-430700-430723-', '澧县', '澧县', '', '', '', '430723', '415500', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430724', '430700', '156-430000-430700-430724-', '临澧县', '临澧县', '', '', '', '430724', '415200', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430725', '430700', '156-430000-430700-430725-', '桃源县', '桃源县', '', '', '', '430725', '415700', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430726', '430700', '156-430000-430700-430726-', '石门县', '石门县', '', '', '', '430726', '415300', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430781', '430700', '156-430000-430700-430781-', '津市市', '津市市', '', '', '', '430781', '415400', '0736', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430800', '430000', '156-430000-430800-', '张家界', '张家界市', '', '', '', '430800', '427000', '0744', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430801', '430800', '156-430000-430800-430801-', '市辖区', '市辖区', '', '', '', '430801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430802', '430800', '156-430000-430800-430802-', '永定区', '永定区', '', '', '', '430802', '427000', '0744', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430811', '430800', '156-430000-430800-430811-', '武陵源区', '武陵源区', '', '', '', '430811', '427400', '0744', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430821', '430800', '156-430000-430800-430821-', '慈利县', '慈利县', '', '', '', '430821', '427200', '0744', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430822', '430800', '156-430000-430800-430822-', '桑植县', '桑植县', '', '', '', '430822', '427100', '0744', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430900', '430000', '156-430000-430900-', '益阳', '益阳市', '', '', '', '430900', '413000', '0737', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430901', '430900', '156-430000-430900-430901-', '市辖区', '市辖区', '', '', '', '430901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430902', '430900', '156-430000-430900-430902-', '资阳区', '资阳区', '', '', '', '430902', '413000', '0737', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430903', '430900', '156-430000-430900-430903-', '赫山区', '赫山区', '', '', '', '430903', '413000', '0737', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430921', '430900', '156-430000-430900-430921-', '南县', '南县', '', '', '', '430921', '413200', '0737', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430922', '430900', '156-430000-430900-430922-', '桃江县', '桃江县', '', '', '', '430922', '413400', '0737', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430923', '430900', '156-430000-430900-430923-', '安化县', '安化县', '', '', '', '430923', '413500', '0737', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('430981', '430900', '156-430000-430900-430981-', '沅江市', '沅江市', '', '', '', '430981', '413100', '0737', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431000', '430000', '156-430000-431000-', '郴州', '郴州市', '', '', '', '431000', '423000', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431001', '431000', '156-430000-431000-431001-', '市辖区', '市辖区', '', '', '', '431001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431002', '431000', '156-430000-431000-431002-', '北湖区', '北湖区', '', '', '', '431002', '423000', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431003', '431000', '156-430000-431000-431003-', '苏仙区', '苏仙区', '', '', '', '431003', '423000', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431021', '431000', '156-430000-431000-431021-', '桂阳县', '桂阳县', '', '', '', '431021', '424400', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431022', '431000', '156-430000-431000-431022-', '宜章县', '宜章县', '', '', '', '431022', '424200', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431023', '431000', '156-430000-431000-431023-', '永兴县', '永兴县', '', '', '', '431023', '423300', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431024', '431000', '156-430000-431000-431024-', '嘉禾县', '嘉禾县', '', '', '', '431024', '424500', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431025', '431000', '156-430000-431000-431025-', '临武县', '临武县', '', '', '', '431025', '424300', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431026', '431000', '156-430000-431000-431026-', '汝城县', '汝城县', '', '', '', '431026', '424100', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431027', '431000', '156-430000-431000-431027-', '桂东县', '桂东县', '', '', '', '431027', '423500', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431028', '431000', '156-430000-431000-431028-', '安仁县', '安仁县', '', '', '', '431028', '423600', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431081', '431000', '156-430000-431000-431081-', '资兴市', '资兴市', '', '', '', '431081', '423400', '0735', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431100', '430000', '156-430000-431100-', '永州', '永州市', '', '', '', '431100', '425000', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431101', '431100', '156-430000-431100-431101-', '市辖区', '市辖区', '', '', '', '431101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431102', '431100', '156-430000-431100-431102-', '零陵区', '零陵区', '', '', '', '431102', '425000', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431103', '431100', '156-430000-431100-431103-', '冷水滩区', '冷水滩区', '', '', '', '431103', '425000', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431121', '431100', '156-430000-431100-431121-', '祁阳县', '祁阳县', '', '', '', '431121', '426100', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431122', '431100', '156-430000-431100-431122-', '东安县', '东安县', '', '', '', '431122', '425900', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431123', '431100', '156-430000-431100-431123-', '双牌县', '双牌县', '', '', '', '431123', '425200', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431124', '431100', '156-430000-431100-431124-', '道县', '道县', '', '', '', '431124', '425300', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431125', '431100', '156-430000-431100-431125-', '江永县', '江永县', '', '', '', '431125', '425400', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431126', '431100', '156-430000-431100-431126-', '宁远县', '宁远县', '', '', '', '431126', '425600', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431127', '431100', '156-430000-431100-431127-', '蓝山县', '蓝山县', '', '', '', '431127', '425800', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431128', '431100', '156-430000-431100-431128-', '新田县', '新田县', '', '', '', '431128', '425700', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431129', '431100', '156-430000-431100-431129-', '江华瑶族自治县', '江华瑶族自治县', '', '', '', '431129', '425500', '0746', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431200', '430000', '156-430000-431200-', '怀化', '怀化市', '', '', '', '431200', '418000', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431201', '431200', '156-430000-431200-431201-', '市辖区', '市辖区', '', '', '', '431201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431202', '431200', '156-430000-431200-431202-', '鹤城区', '鹤城区', '', '', '', '431202', '418000', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431221', '431200', '156-430000-431200-431221-', '中方县', '中方县', '', '', '', '431221', '418000', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431222', '431200', '156-430000-431200-431222-', '沅陵县', '沅陵县', '', '', '', '431222', '419600', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431223', '431200', '156-430000-431200-431223-', '辰溪县', '辰溪县', '', '', '', '431223', '419500', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431224', '431200', '156-430000-431200-431224-', '溆浦县', '溆浦县', '', '', '', '431224', '419300', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431225', '431200', '156-430000-431200-431225-', '会同县', '会同县', '', '', '', '431225', '418300', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431226', '431200', '156-430000-431200-431226-', '麻阳苗族自治县', '麻阳苗族自治县', '', '', '', '431226', '419400', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431227', '431200', '156-430000-431200-431227-', '新晃侗族自治县', '新晃侗族自治县', '', '', '', '431227', '419200', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431228', '431200', '156-430000-431200-431228-', '芷江侗族自治县', '芷江侗族自治县', '', '', '', '431228', '419100', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431229', '431200', '156-430000-431200-431229-', '靖州苗族侗族自治县', '靖州苗族侗族自治县', '', '', '', '431229', '418400', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431230', '431200', '156-430000-431200-431230-', '通道侗族自治县', '通道侗族自治县', '', '', '', '431230', '418500', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431281', '431200', '156-430000-431200-431281-', '洪江市', '洪江市', '', '', '', '431281', '418200', '0745', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431300', '430000', '156-430000-431300-', '娄底', '娄底市', '', '', '', '431300', '417000', '0738', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431301', '431300', '156-430000-431300-431301-', '市辖区', '市辖区', '', '', '', '431301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431302', '431300', '156-430000-431300-431302-', '娄星区', '娄星区', '', '', '', '431302', '417000', '0738', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431321', '431300', '156-430000-431300-431321-', '双峰县', '双峰县', '', '', '', '431321', '417700', '0738', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431322', '431300', '156-430000-431300-431322-', '新化县', '新化县', '', '', '', '431322', '417600', '0738', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431381', '431300', '156-430000-431300-431381-', '冷水江市', '冷水江市', '', '', '', '431381', '417500', '0738', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('431382', '431300', '156-430000-431300-431382-', '涟源市', '涟源市', '', '', '', '431382', '417100', '0738', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('433100', '430000', '156-430000-433100-', '湘西', '湘西土家族苗族自治州', '', '', '', '433100', '416000', '0743', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('433101', '433100', '156-430000-433100-433101-', '吉首市', '吉首市', '', '', '', '433101', '416000', '0743', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('433122', '433100', '156-430000-433100-433122-', '泸溪县', '泸溪县', '', '', '', '433122', '416100', '0743', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('433123', '433100', '156-430000-433100-433123-', '凤凰县', '凤凰县', '', '', '', '433123', '416200', '0743', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('433124', '433100', '156-430000-433100-433124-', '花垣县', '花垣县', '', '', '', '433124', '416400', '0743', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('433125', '433100', '156-430000-433100-433125-', '保靖县', '保靖县', '', '', '', '433125', '416500', '0743', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('433126', '433100', '156-430000-433100-433126-', '古丈县', '古丈县', '', '', '', '433126', '416300', '0743', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('433127', '433100', '156-430000-433100-433127-', '永顺县', '永顺县', '', '', '', '433127', '416700', '0743', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('433130', '433100', '156-430000-433100-433130-', '龙山县', '龙山县', '', '', '', '433130', '416800', '0743', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440000', '156', '156-440000-', '广东', '广东省', 'GuangDong', 'GuangDong', 'GD', '440000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440100', '440000', '156-440000-440100-', '广州', '广州市', '', '', '', '440100', '510000', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440101', '440100', '156-440000-440100-440101-', '市辖区', '市辖区', '', '', '', '440101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440103', '440100', '156-440000-440100-440103-', '荔湾区', '荔湾区', '', '', '', '440103', '510000', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440104', '440100', '156-440000-440100-440104-', '越秀区', '越秀区', '', '', '', '440104', '510000', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440105', '440100', '156-440000-440100-440105-', '海珠区', '海珠区', '', '', '', '440105', '510000', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440106', '440100', '156-440000-440100-440106-', '天河区', '天河区', '', '', '', '440106', '510000', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440111', '440100', '156-440000-440100-440111-', '白云区', '白云区', '', '', '', '440111', '510000', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440112', '440100', '156-440000-440100-440112-', '黄埔区', '黄埔区', '', '', '', '440112', '510700', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440113', '440100', '156-440000-440100-440113-', '番禺区', '番禺区', '', '', '', '440113', '511400', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440114', '440100', '156-440000-440100-440114-', '花都区', '花都区', '', '', '', '440114', '510800', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440115', '440100', '156-440000-440100-440115-', '南沙区', '南沙区', '', '', '', '440115', '511400', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440116', '440100', '156-440000-440100-440116-', '萝岗区', '萝岗区', '', '', '', '440116', '510000', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440183', '440100', '156-440000-440100-440183-', '增城市', '增城市', '', '', '', '440183', '511300', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440184', '440100', '156-440000-440100-440184-', '从化市', '从化市', '', '', '', '440184', '510900', '020', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440200', '440000', '156-440000-440200-', '韶关', '韶关市', '', '', '', '440200', '512000', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440201', '440200', '156-440000-440200-440201-', '市辖区', '市辖区', '', '', '', '440201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440203', '440200', '156-440000-440200-440203-', '武江区', '武江区', '', '', '', '440203', '512000', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440204', '440200', '156-440000-440200-440204-', '浈江区', '浈江区', '', '', '', '440204', '512000', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440205', '440200', '156-440000-440200-440205-', '曲江区', '曲江区', '', '', '', '440205', '512100', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440222', '440200', '156-440000-440200-440222-', '始兴县', '始兴县', '', '', '', '440222', '512500', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440224', '440200', '156-440000-440200-440224-', '仁化县', '仁化县', '', '', '', '440224', '512300', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440229', '440200', '156-440000-440200-440229-', '翁源县', '翁源县', '', '', '', '440229', '512600', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440232', '440200', '156-440000-440200-440232-', '乳源瑶族自治县', '乳源瑶族自治县', '', '', '', '440232', '512600', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440233', '440200', '156-440000-440200-440233-', '新丰县', '新丰县', '', '', '', '440233', '511100', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440281', '440200', '156-440000-440200-440281-', '乐昌市', '乐昌市', '', '', '', '440281', '512200', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440282', '440200', '156-440000-440200-440282-', '南雄市', '南雄市', '', '', '', '440282', '512400', '0751', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440300', '440000', '156-440000-440300-', '深圳', '深圳市', '', '', '', '440300', '518000', '0755', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440301', '440300', '156-440000-440300-440301-', '市辖区', '市辖区', '', '', '', '440301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440303', '440300', '156-440000-440300-440303-', '罗湖区', '罗湖区', '', '', '', '440303', '518000', '0755', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440304', '440300', '156-440000-440300-440304-', '福田区', '福田区', '', '', '', '440304', '518000', '0755', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440305', '440300', '156-440000-440300-440305-', '南山区', '南山区', '', '', '', '440305', '518000', '0755', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440306', '440300', '156-440000-440300-440306-', '宝安区', '宝安区', '', '', '', '440306', '518100', '0755', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440307', '440300', '156-440000-440300-440307-', '龙岗区', '龙岗区', '', '', '', '440307', '518100', '0755', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440308', '440300', '156-440000-440300-440308-', '盐田区', '盐田区', '', '', '', '440308', '518000', '0755', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440400', '440000', '156-440000-440400-', '珠海', '珠海市', '', '', '', '440400', '519000', '0756', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440401', '440400', '156-440000-440400-440401-', '市辖区', '市辖区', '', '', '', '440401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440402', '440400', '156-440000-440400-440402-', '香洲区', '香洲区', '', '', '', '440402', '519000', '0756', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440403', '440400', '156-440000-440400-440403-', '斗门区', '斗门区', '', '', '', '440403', '519100', '0756', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440404', '440400', '156-440000-440400-440404-', '金湾区', '金湾区', '', '', '', '440404', '519090', '0756', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440500', '440000', '156-440000-440500-', '汕头', '汕头市', '', '', '', '440500', '515000', '0754', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440501', '440500', '156-440000-440500-440501-', '市辖区', '市辖区', '', '', '', '440501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440507', '440500', '156-440000-440500-440507-', '龙湖区', '龙湖区', '', '', '', '440507', '515000', '0754', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440511', '440500', '156-440000-440500-440511-', '金平区', '金平区', '', '', '', '440511', '515000', '0754', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440512', '440500', '156-440000-440500-440512-', '濠江区', '濠江区', '', '', '', '440512', '515000', '0754', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440513', '440500', '156-440000-440500-440513-', '潮阳区', '潮阳区', '', '', '', '440513', '515100', '0754', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440514', '440500', '156-440000-440500-440514-', '潮南区', '潮南区', '', '', '', '440514', '515100', '0754', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440515', '440500', '156-440000-440500-440515-', '澄海区', '澄海区', '', '', '', '440515', '515800', '0754', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440523', '440500', '156-440000-440500-440523-', '南澳县', '南澳县', '', '', '', '440523', '515900', '0754', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440600', '440000', '156-440000-440600-', '佛山', '佛山市', '', '', '', '440600', '528000', '0757', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440601', '440600', '156-440000-440600-440601-', '市辖区', '市辖区', '', '', '', '440601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440604', '440600', '156-440000-440600-440604-', '禅城区', '禅城区', '', '', '', '440604', '528000', '0757', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440605', '440600', '156-440000-440600-440605-', '南海区', '南海区', '', '', '', '440605', '528200', '0757', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440606', '440600', '156-440000-440600-440606-', '顺德区', '顺德区', '', '', '', '440606', '528000', '0757', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440607', '440600', '156-440000-440600-440607-', '三水区', '三水区', '', '', '', '440607', '528100', '0757', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440608', '440600', '156-440000-440600-440608-', '高明区', '高明区', '', '', '', '440608', '528500', '0757', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440700', '440000', '156-440000-440700-', '江门', '江门市', '', '', '', '440700', '529000', '0750', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440701', '440700', '156-440000-440700-440701-', '市辖区', '市辖区', '', '', '', '440701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440703', '440700', '156-440000-440700-440703-', '蓬江区', '蓬江区', '', '', '', '440703', '529000', '0750', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440704', '440700', '156-440000-440700-440704-', '江海区', '江海区', '', '', '', '440704', '529000', '0750', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440705', '440700', '156-440000-440700-440705-', '新会区', '新会区', '', '', '', '440705', '529100', '0750', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440781', '440700', '156-440000-440700-440781-', '台山市', '台山市', '', '', '', '440781', '529200', '0750', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440783', '440700', '156-440000-440700-440783-', '开平市', '开平市', '', '', '', '440783', '529300', '0750', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440784', '440700', '156-440000-440700-440784-', '鹤山市', '鹤山市', '', '', '', '440784', '529700', '0750', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440785', '440700', '156-440000-440700-440785-', '恩平市', '恩平市', '', '', '', '440785', '529400', '0750', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440800', '440000', '156-440000-440800-', '湛江', '湛江市', '', '', '', '440800', '524000', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440801', '440800', '156-440000-440800-440801-', '市辖区', '市辖区', '', '', '', '440801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440802', '440800', '156-440000-440800-440802-', '赤坎区', '赤坎区', '', '', '', '440802', '524000', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440803', '440800', '156-440000-440800-440803-', '霞山区', '霞山区', '', '', '', '440803', '524000', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440804', '440800', '156-440000-440800-440804-', '坡头区', '坡头区', '', '', '', '440804', '524000', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440811', '440800', '156-440000-440800-440811-', '麻章区', '麻章区', '', '', '', '440811', '524000', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440823', '440800', '156-440000-440800-440823-', '遂溪县', '遂溪县', '', '', '', '440823', '524300', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440825', '440800', '156-440000-440800-440825-', '徐闻县', '徐闻县', '', '', '', '440825', '524100', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440881', '440800', '156-440000-440800-440881-', '廉江市', '廉江市', '', '', '', '440881', '524400', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440882', '440800', '156-440000-440800-440882-', '雷州市', '雷州市', '', '', '', '440882', '524200', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440883', '440800', '156-440000-440800-440883-', '吴川市', '吴川市', '', '', '', '440883', '524500', '0759', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440900', '440000', '156-440000-440900-', '茂名', '茂名市', '', '', '', '440900', '525000', '0668', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440901', '440900', '156-440000-440900-440901-', '市辖区', '市辖区', '', '', '', '440901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440902', '440900', '156-440000-440900-440902-', '茂南区', '茂南区', '', '', '', '440902', '525000', '0668', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440903', '440900', '156-440000-440900-440903-', '茂港区', '茂港区', '', '', '', '440903', '525000', '0668', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440923', '440900', '156-440000-440900-440923-', '电白县', '电白县', '', '', '', '440923', '525400', '0668', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440981', '440900', '156-440000-440900-440981-', '高州市', '高州市', '', '', '', '440981', '525200', '0668', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440982', '440900', '156-440000-440900-440982-', '化州市', '化州市', '', '', '', '440982', '525100', '0668', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('440983', '440900', '156-440000-440900-440983-', '信宜市', '信宜市', '', '', '', '440983', '525300', '0668', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441200', '440000', '156-440000-441200-', '肇庆', '肇庆市', '', '', '', '441200', '526000', '0758', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441201', '441200', '156-440000-441200-441201-', '市辖区', '市辖区', '', '', '', '441201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441202', '441200', '156-440000-441200-441202-', '端州区', '端州区', '', '', '', '441202', '526000', '0758', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441203', '441200', '156-440000-441200-441203-', '鼎湖区', '鼎湖区', '', '', '', '441203', '526000', '0758', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441223', '441200', '156-440000-441200-441223-', '广宁县', '广宁县', '', '', '', '441223', '526300', '0758', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441224', '441200', '156-440000-441200-441224-', '怀集县', '怀集县', '', '', '', '441224', '526400', '0758', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441225', '441200', '156-440000-441200-441225-', '封开县', '封开县', '', '', '', '441225', '526500', '0758', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441226', '441200', '156-440000-441200-441226-', '德庆县', '德庆县', '', '', '', '441226', '526600', '0758', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441283', '441200', '156-440000-441200-441283-', '高要市', '高要市', '', '', '', '441283', '526100', '0758', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441284', '441200', '156-440000-441200-441284-', '四会市', '四会市', '', '', '', '441284', '526200', '0758', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441300', '440000', '156-440000-441300-', '惠州', '惠州市', '', '', '', '441300', '516000', '0752', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441301', '441300', '156-440000-441300-441301-', '市辖区', '市辖区', '', '', '', '441301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441302', '441300', '156-440000-441300-441302-', '惠城区', '惠城区', '', '', '', '441302', '516000', '0752', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441303', '441300', '156-440000-441300-441303-', '惠阳区', '惠阳区', '', '', '', '441303', '516200', '0752', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441322', '441300', '156-440000-441300-441322-', '博罗县', '博罗县', '', '', '', '441322', '516100', '0752', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441323', '441300', '156-440000-441300-441323-', '惠东县', '惠东县', '', '', '', '441323', '516300', '0752', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441324', '441300', '156-440000-441300-441324-', '龙门县', '龙门县', '', '', '', '441324', '516800', '0752', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441400', '440000', '156-440000-441400-', '梅州', '梅州市', '', '', '', '441400', '514000', '0753', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441401', '441400', '156-440000-441400-441401-', '市辖区', '市辖区', '', '', '', '441401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441402', '441400', '156-440000-441400-441402-', '梅江区', '梅江区', '', '', '', '441402', '514000', '0753', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441421', '441400', '156-440000-441400-441421-', '梅县', '梅县', '', '', '', '441421', '514700', '0753', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441422', '441400', '156-440000-441400-441422-', '大埔县', '大埔县', '', '', '', '441422', '514200', '0753', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441423', '441400', '156-440000-441400-441423-', '丰顺县', '丰顺县', '', '', '', '441423', '514300', '0753', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441424', '441400', '156-440000-441400-441424-', '五华县', '五华县', '', '', '', '441424', '514400', '0753', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441426', '441400', '156-440000-441400-441426-', '平远县', '平远县', '', '', '', '441426', '514600', '0753', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441427', '441400', '156-440000-441400-441427-', '蕉岭县', '蕉岭县', '', '', '', '441427', '514100', '0753', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441481', '441400', '156-440000-441400-441481-', '兴宁市', '兴宁市', '', '', '', '441481', '514500', '0753', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441500', '440000', '156-440000-441500-', '汕尾', '汕尾市', '', '', '', '441500', '516600', '0660', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441501', '441500', '156-440000-441500-441501-', '市辖区', '市辖区', '', '', '', '441501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441502', '441500', '156-440000-441500-441502-', '城区', '城区', '', '', '', '441502', '516600', '0660', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441521', '441500', '156-440000-441500-441521-', '海丰县', '海丰县', '', '', '', '441521', '516400', '0660', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441523', '441500', '156-440000-441500-441523-', '陆河县', '陆河县', '', '', '', '441523', '516700', '0660', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441581', '441500', '156-440000-441500-441581-', '陆丰市', '陆丰市', '', '', '', '441581', '516500', '0660', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441600', '440000', '156-440000-441600-', '河源', '河源市', '', '', '', '441600', '517000', '0762', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441601', '441600', '156-440000-441600-441601-', '市辖区', '市辖区', '', '', '', '441601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441602', '441600', '156-440000-441600-441602-', '源城区', '源城区', '', '', '', '441602', '517000', '0762', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441621', '441600', '156-440000-441600-441621-', '紫金县', '紫金县', '', '', '', '441621', '517400', '0762', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441622', '441600', '156-440000-441600-441622-', '龙川县', '龙川县', '', '', '', '441622', '517300', '0762', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441623', '441600', '156-440000-441600-441623-', '连平县', '连平县', '', '', '', '441623', '517100', '0762', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441624', '441600', '156-440000-441600-441624-', '和平县', '和平县', '', '', '', '441624', '517200', '0762', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441625', '441600', '156-440000-441600-441625-', '东源县', '东源县', '', '', '', '441625', '517500', '0762', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441700', '440000', '156-440000-441700-', '阳江', '阳江市', '', '', '', '441700', '529500', '0662', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441701', '441700', '156-440000-441700-441701-', '市辖区', '市辖区', '', '', '', '441701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441702', '441700', '156-440000-441700-441702-', '江城区', '江城区', '', '', '', '441702', '529500', '0662', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441721', '441700', '156-440000-441700-441721-', '阳西县', '阳西县', '', '', '', '441721', '529800', '0662', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441723', '441700', '156-440000-441700-441723-', '阳东县', '阳东县', '', '', '', '441723', '529900', '0662', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441781', '441700', '156-440000-441700-441781-', '阳春市', '阳春市', '', '', '', '441781', '529600', '0662', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441800', '440000', '156-440000-441800-', '清远', '清远市', '', '', '', '441800', '511500', '0763', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441801', '441800', '156-440000-441800-441801-', '市辖区', '市辖区', '', '', '', '441801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441802', '441800', '156-440000-441800-441802-', '清城区', '清城区', '', '', '', '441802', '511500', '0763', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441821', '441800', '156-440000-441800-441821-', '佛冈县', '佛冈县', '', '', '', '441821', '511600', '0763', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441823', '441800', '156-440000-441800-441823-', '阳山县', '阳山县', '', '', '', '441823', '513100', '0763', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441825', '441800', '156-440000-441800-441825-', '连山壮族瑶族自治县', '连山壮族瑶族自治县', '', '', '', '441825', '513200', '0763', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441826', '441800', '156-440000-441800-441826-', '连南瑶族自治县', '连南瑶族自治县', '', '', '', '441826', '513300', '0763', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441827', '441800', '156-440000-441800-441827-', '清新县', '清新县', '', '', '', '441827', '511800', '0763', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441881', '441800', '156-440000-441800-441881-', '英德市', '英德市', '', '', '', '441881', '513000', '0763', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441882', '441800', '156-440000-441800-441882-', '连州市', '连州市', '', '', '', '441882', '513400', '0763', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('441900', '440000', '156-440000-441900-', '东莞', '东莞市', '', '', '', '441900', '523000', '0769', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('442000', '440000', '156-440000-442000-', '中山', '中山市', '', '', '', '442000', '528400', '0760', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445100', '440000', '156-440000-445100-', '潮州', '潮州市', '', '', '', '445100', '521000', '0768', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445101', '445100', '156-440000-445100-445101-', '市辖区', '市辖区', '', '', '', '445101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445102', '445100', '156-440000-445100-445102-', '湘桥区', '湘桥区', '', '', '', '445102', '521000', '0768', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445121', '445100', '156-440000-445100-445121-', '潮安县', '潮安县', '', '', '', '445121', '515600', '0768', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445122', '445100', '156-440000-445100-445122-', '饶平县', '饶平县', '', '', '', '445122', '515700', '0768', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445200', '440000', '156-440000-445200-', '揭阳', '揭阳市', '', '', '', '445200', '522000', '0663', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445201', '445200', '156-440000-445200-445201-', '市辖区', '市辖区', '', '', '', '445201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445202', '445200', '156-440000-445200-445202-', '榕城区', '榕城区', '', '', '', '445202', '522000', '0663', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445221', '445200', '156-440000-445200-445221-', '揭东县', '揭东县', '', '', '', '445221', '515500', '0663', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445222', '445200', '156-440000-445200-445222-', '揭西县', '揭西县', '', '', '', '445222', '515400', '0663', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445224', '445200', '156-440000-445200-445224-', '惠来县', '惠来县', '', '', '', '445224', '515200', '0663', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445281', '445200', '156-440000-445200-445281-', '普宁市', '普宁市', '', '', '', '445281', '515300', '0663', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445300', '440000', '156-440000-445300-', '云浮', '云浮市', '', '', '', '445300', '527300', '0766', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445301', '445300', '156-440000-445300-445301-', '市辖区', '市辖区', '', '', '', '445301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445302', '445300', '156-440000-445300-445302-', '云城区', '云城区', '', '', '', '445302', '527300', '0766', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445321', '445300', '156-440000-445300-445321-', '新兴县', '新兴县', '', '', '', '445321', '527400', '0766', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445322', '445300', '156-440000-445300-445322-', '郁南县', '郁南县', '', '', '', '445322', '527100', '0766', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445323', '445300', '156-440000-445300-445323-', '云安县', '云安县', '', '', '', '445323', '527500', '0766', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('445381', '445300', '156-440000-445300-445381-', '罗定市', '罗定市', '', '', '', '445381', '527200', '0766', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450000', '156', '156-450000-', '广西', '广西壮族自治区', 'GuangXi', 'GuangXi', 'GX', '450000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450100', '450000', '156-450000-450100-', '南宁', '南宁市', '', '', '', '450100', '530000', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450101', '450100', '156-450000-450100-450101-', '市辖区', '市辖区', '', '', '', '450101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450102', '450100', '156-450000-450100-450102-', '兴宁区', '兴宁区', '', '', '', '450102', '530000', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450103', '450100', '156-450000-450100-450103-', '青秀区', '青秀区', '', '', '', '450103', '530000', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450105', '450100', '156-450000-450100-450105-', '江南区', '江南区', '', '', '', '450105', '530000', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450107', '450100', '156-450000-450100-450107-', '西乡塘区', '西乡塘区', '', '', '', '450107', '530000', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450108', '450100', '156-450000-450100-450108-', '良庆区', '良庆区', '', '', '', '450108', '530200', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450109', '450100', '156-450000-450100-450109-', '邕宁区', '邕宁区', '', '', '', '450109', '530200', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450122', '450100', '156-450000-450100-450122-', '武鸣县', '武鸣县', '', '', '', '450122', '530100', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450123', '450100', '156-450000-450100-450123-', '隆安县', '隆安县', '', '', '', '450123', '532700', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450124', '450100', '156-450000-450100-450124-', '马山县', '马山县', '', '', '', '450124', '530600', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450125', '450100', '156-450000-450100-450125-', '上林县', '上林县', '', '', '', '450125', '530500', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450126', '450100', '156-450000-450100-450126-', '宾阳县', '宾阳县', '', '', '', '450126', '530400', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450127', '450100', '156-450000-450100-450127-', '横县', '横县', '', '', '', '450127', '530300', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450200', '450000', '156-450000-450200-', '柳州', '柳州市', '', '', '', '450200', '545000', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450201', '450200', '156-450000-450200-450201-', '市辖区', '市辖区', '', '', '', '450201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450202', '450200', '156-450000-450200-450202-', '城中区', '城中区', '', '', '', '450202', '545000', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450203', '450200', '156-450000-450200-450203-', '鱼峰区', '鱼峰区', '', '', '', '450203', '545000', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450204', '450200', '156-450000-450200-450204-', '柳南区', '柳南区', '', '', '', '450204', '545000', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450205', '450200', '156-450000-450200-450205-', '柳北区', '柳北区', '', '', '', '450205', '545000', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450221', '450200', '156-450000-450200-450221-', '柳江县', '柳江县', '', '', '', '450221', '545100', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450222', '450200', '156-450000-450200-450222-', '柳城县', '柳城县', '', '', '', '450222', '545200', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450223', '450200', '156-450000-450200-450223-', '鹿寨县', '鹿寨县', '', '', '', '450223', '545600', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450224', '450200', '156-450000-450200-450224-', '融安县', '融安县', '', '', '', '450224', '545400', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450225', '450200', '156-450000-450200-450225-', '融水苗族自治县', '融水苗族自治县', '', '', '', '450225', '545300', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450226', '450200', '156-450000-450200-450226-', '三江侗族自治县', '三江侗族自治县', '', '', '', '450226', '545500', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450300', '450000', '156-450000-450300-', '桂林', '桂林市', '', '', '', '450300', '541000', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450301', '450300', '156-450000-450300-450301-', '市辖区', '市辖区', '', '', '', '450301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450302', '450300', '156-450000-450300-450302-', '秀峰区', '秀峰区', '', '', '', '450302', '541000', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450303', '450300', '156-450000-450300-450303-', '叠彩区', '叠彩区', '', '', '', '450303', '541000', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450304', '450300', '156-450000-450300-450304-', '象山区', '象山区', '', '', '', '450304', '541000', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450305', '450300', '156-450000-450300-450305-', '七星区', '七星区', '', '', '', '450305', '541000', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450311', '450300', '156-450000-450300-450311-', '雁山区', '雁山区', '', '', '', '450311', '541000', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450321', '450300', '156-450000-450300-450321-', '阳朔县', '阳朔县', '', '', '', '450321', '541900', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450322', '450300', '156-450000-450300-450322-', '临桂县', '临桂县', '', '', '', '450322', '541100', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450323', '450300', '156-450000-450300-450323-', '灵川县', '灵川县', '', '', '', '450323', '541200', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450324', '450300', '156-450000-450300-450324-', '全州县', '全州县', '', '', '', '450324', '541500', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450325', '450300', '156-450000-450300-450325-', '兴安县', '兴安县', '', '', '', '450325', '541300', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450326', '450300', '156-450000-450300-450326-', '永福县', '永福县', '', '', '', '450326', '541800', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450327', '450300', '156-450000-450300-450327-', '灌阳县', '灌阳县', '', '', '', '450327', '541600', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450328', '450300', '156-450000-450300-450328-', '龙胜各族自治县', '龙胜各族自治县', '', '', '', '450328', '541700', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450329', '450300', '156-450000-450300-450329-', '资源县', '资源县', '', '', '', '450329', '541400', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450330', '450300', '156-450000-450300-450330-', '平乐县', '平乐县', '', '', '', '450330', '542400', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450331', '450300', '156-450000-450300-450331-', '荔浦县', '荔浦县', '', '', '', '450331', '546600', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450332', '450300', '156-450000-450300-450332-', '恭城瑶族自治县', '恭城瑶族自治县', '', '', '', '450332', '542500', '0773', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450400', '450000', '156-450000-450400-', '梧州', '梧州市', '', '', '', '450400', '543000', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450401', '450400', '156-450000-450400-450401-', '市辖区', '市辖区', '', '', '', '450401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450403', '450400', '156-450000-450400-450403-', '万秀区', '万秀区', '', '', '', '450403', '543000', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450404', '450400', '156-450000-450400-450404-', '蝶山区', '蝶山区', '', '', '', '450404', '543000', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450405', '450400', '156-450000-450400-450405-', '长洲区', '长洲区', '', '', '', '450405', '543000', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450421', '450400', '156-450000-450400-450421-', '苍梧县', '苍梧县', '', '', '', '450421', '543100', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450422', '450400', '156-450000-450400-450422-', '藤县', '藤县', '', '', '', '450422', '543300', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450423', '450400', '156-450000-450400-450423-', '蒙山县', '蒙山县', '', '', '', '450423', '546700', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450481', '450400', '156-450000-450400-450481-', '岑溪市', '岑溪市', '', '', '', '450481', '543200', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450500', '450000', '156-450000-450500-', '北海', '北海市', '', '', '', '450500', '536000', '0779', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450501', '450500', '156-450000-450500-450501-', '市辖区', '市辖区', '', '', '', '450501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450502', '450500', '156-450000-450500-450502-', '海城区', '海城区', '', '', '', '450502', '536000', '0779', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450503', '450500', '156-450000-450500-450503-', '银海区', '银海区', '', '', '', '450503', '536000', '0779', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450512', '450500', '156-450000-450500-450512-', '铁山港区', '铁山港区', '', '', '', '450512', '536000', '0779', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450521', '450500', '156-450000-450500-450521-', '合浦县', '合浦县', '', '', '', '450521', '536100', '0779', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450600', '450000', '156-450000-450600-', '防城港', '防城港市', '', '', '', '450600', '538000', '0770', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450601', '450600', '156-450000-450600-450601-', '市辖区', '市辖区', '', '', '', '450601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450602', '450600', '156-450000-450600-450602-', '港口区', '港口区', '', '', '', '450602', '538000', '0770', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450603', '450600', '156-450000-450600-450603-', '防城区', '防城区', '', '', '', '450603', '538000', '0770', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450621', '450600', '156-450000-450600-450621-', '上思县', '上思县', '', '', '', '450621', '535500', '0770', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450681', '450600', '156-450000-450600-450681-', '东兴市', '东兴市', '', '', '', '450681', '538100', '0770', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450700', '450000', '156-450000-450700-', '钦州', '钦州市', '', '', '', '450700', '535000', '0777', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450701', '450700', '156-450000-450700-450701-', '市辖区', '市辖区', '', '', '', '450701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450702', '450700', '156-450000-450700-450702-', '钦南区', '钦南区', '', '', '', '450702', '535000', '0777', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450703', '450700', '156-450000-450700-450703-', '钦北区', '钦北区', '', '', '', '450703', '535000', '0777', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450721', '450700', '156-450000-450700-450721-', '灵山县', '灵山县', '', '', '', '450721', '535400', '0777', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450722', '450700', '156-450000-450700-450722-', '浦北县', '浦北县', '', '', '', '450722', '535300', '0777', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450800', '450000', '156-450000-450800-', '贵港', '贵港市', '', '', '', '450800', '537000', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450801', '450800', '156-450000-450800-450801-', '市辖区', '市辖区', '', '', '', '450801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450802', '450800', '156-450000-450800-450802-', '港北区', '港北区', '', '', '', '450802', '537100', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450803', '450800', '156-450000-450800-450803-', '港南区', '港南区', '', '', '', '450803', '537100', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450804', '450800', '156-450000-450800-450804-', '覃塘区', '覃塘区', '', '', '', '450804', '537100', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450821', '450800', '156-450000-450800-450821-', '平南县', '平南县', '', '', '', '450821', '537300', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450881', '450800', '156-450000-450800-450881-', '桂平市', '桂平市', '', '', '', '450881', '537200', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450900', '450000', '156-450000-450900-', '玉林', '玉林市', '', '', '', '450900', '537000', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450901', '450900', '156-450000-450900-450901-', '市辖区', '市辖区', '', '', '', '450901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450902', '450900', '156-450000-450900-450902-', '玉州区', '玉州区', '', '', '', '450902', '537000', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450921', '450900', '156-450000-450900-450921-', '容县', '容县', '', '', '', '450921', '537500', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450922', '450900', '156-450000-450900-450922-', '陆川县', '陆川县', '', '', '', '450922', '537700', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450923', '450900', '156-450000-450900-450923-', '博白县', '博白县', '', '', '', '450923', '537600', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450924', '450900', '156-450000-450900-450924-', '兴业县', '兴业县', '', '', '', '450924', '537800', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('450981', '450900', '156-450000-450900-450981-', '北流市', '北流市', '', '', '', '450981', '537400', '0775', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451000', '450000', '156-450000-451000-', '百色', '百色市', '', '', '', '451000', '533000', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451001', '451000', '156-450000-451000-451001-', '市辖区', '市辖区', '', '', '', '451001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451002', '451000', '156-450000-451000-451002-', '右江区', '右江区', '', '', '', '451002', '533000', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451021', '451000', '156-450000-451000-451021-', '田阳县', '田阳县', '', '', '', '451021', '533600', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451022', '451000', '156-450000-451000-451022-', '田东县', '田东县', '', '', '', '451022', '531500', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451023', '451000', '156-450000-451000-451023-', '平果县', '平果县', '', '', '', '451023', '531400', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451024', '451000', '156-450000-451000-451024-', '德保县', '德保县', '', '', '', '451024', '533700', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451025', '451000', '156-450000-451000-451025-', '靖西县', '靖西县', '', '', '', '451025', '533800', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451026', '451000', '156-450000-451000-451026-', '那坡县', '那坡县', '', '', '', '451026', '533900', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451027', '451000', '156-450000-451000-451027-', '凌云县', '凌云县', '', '', '', '451027', '533100', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451028', '451000', '156-450000-451000-451028-', '乐业县', '乐业县', '', '', '', '451028', '533200', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451029', '451000', '156-450000-451000-451029-', '田林县', '田林县', '', '', '', '451029', '533300', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451030', '451000', '156-450000-451000-451030-', '西林县', '西林县', '', '', '', '451030', '533500', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451031', '451000', '156-450000-451000-451031-', '隆林各族自治县', '隆林各族自治县', '', '', '', '451031', '533400', '0776', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451100', '450000', '156-450000-451100-', '贺州', '贺州市', '', '', '', '451100', '542800', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451101', '451100', '156-450000-451100-451101-', '市辖区', '市辖区', '', '', '', '451101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451102', '451100', '156-450000-451100-451102-', '八步区', '八步区', '', '', '', '451102', '542800', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451121', '451100', '156-450000-451100-451121-', '昭平县', '昭平县', '', '', '', '451121', '546800', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451122', '451100', '156-450000-451100-451122-', '钟山县', '钟山县', '', '', '', '451122', '542600', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451123', '451100', '156-450000-451100-451123-', '富川瑶族自治县', '富川瑶族自治县', '', '', '', '451123', '542700', '0774', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451200', '450000', '156-450000-451200-', '河池', '河池市', '', '', '', '451200', '547000', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451201', '451200', '156-450000-451200-451201-', '市辖区', '市辖区', '', '', '', '451201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451202', '451200', '156-450000-451200-451202-', '金城江区', '金城江区', '', '', '', '451202', '547000', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451221', '451200', '156-450000-451200-451221-', '南丹县', '南丹县', '', '', '', '451221', '547200', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451222', '451200', '156-450000-451200-451222-', '天峨县', '天峨县', '', '', '', '451222', '547300', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451223', '451200', '156-450000-451200-451223-', '凤山县', '凤山县', '', '', '', '451223', '547600', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451224', '451200', '156-450000-451200-451224-', '东兰县', '东兰县', '', '', '', '451224', '547400', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451225', '451200', '156-450000-451200-451225-', '罗城仫佬族自治县', '罗城仫佬族自治县', '', '', '', '451225', '546400', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451226', '451200', '156-450000-451200-451226-', '环江毛南族自治县', '环江毛南族自治县', '', '', '', '451226', '547100', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451227', '451200', '156-450000-451200-451227-', '巴马瑶族自治县', '巴马瑶族自治县', '', '', '', '451227', '547500', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451228', '451200', '156-450000-451200-451228-', '都安瑶族自治县', '都安瑶族自治县', '', '', '', '451228', '530700', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451229', '451200', '156-450000-451200-451229-', '大化瑶族自治县', '大化瑶族自治县', '', '', '', '451229', '530800', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451281', '451200', '156-450000-451200-451281-', '宜州市', '宜州市', '', '', '', '451281', '546300', '0778', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451300', '450000', '156-450000-451300-', '来宾', '来宾市', '', '', '', '451300', '546100', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451301', '451300', '156-450000-451300-451301-', '市辖区', '市辖区', '', '', '', '451301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451302', '451300', '156-450000-451300-451302-', '兴宾区', '兴宾区', '', '', '', '451302', '546100', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451321', '451300', '156-450000-451300-451321-', '忻城县', '忻城县', '', '', '', '451321', '546200', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451322', '451300', '156-450000-451300-451322-', '象州县', '象州县', '', '', '', '451322', '545800', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451323', '451300', '156-450000-451300-451323-', '武宣县', '武宣县', '', '', '', '451323', '545900', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451324', '451300', '156-450000-451300-451324-', '金秀瑶族自治县', '金秀瑶族自治县', '', '', '', '451324', '545700', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451381', '451300', '156-450000-451300-451381-', '合山市', '合山市', '', '', '', '451381', '546500', '0772', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451400', '450000', '156-450000-451400-', '崇左', '崇左市', '', '', '', '451400', '532200', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451401', '451400', '156-450000-451400-451401-', '市辖区', '市辖区', '', '', '', '451401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451402', '451400', '156-450000-451400-451402-', '江洲区', '江洲区', '', '', '', '451402', '532200', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451421', '451400', '156-450000-451400-451421-', '扶绥县', '扶绥县', '', '', '', '451421', '532100', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451422', '451400', '156-450000-451400-451422-', '宁明县', '宁明县', '', '', '', '451422', '532500', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451423', '451400', '156-450000-451400-451423-', '龙州县', '龙州县', '', '', '', '451423', '532400', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451424', '451400', '156-450000-451400-451424-', '大新县', '大新县', '', '', '', '451424', '532300', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451425', '451400', '156-450000-451400-451425-', '天等县', '天等县', '', '', '', '451425', '532800', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('451481', '451400', '156-450000-451400-451481-', '凭祥市', '凭祥市', '', '', '', '451481', '532600', '0771', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460000', '156', '156-460000-', '海南', '海南省', 'HaiNan', 'HaiNan', 'HI', '460000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460100', '460000', '156-460000-460100-', '海口', '海口市', '', '', '', '460100', '570100', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460101', '460100', '156-460000-460100-460101-', '市辖区', '市辖区', '', '', '', '460101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460105', '460100', '156-460000-460100-460105-', '秀英区', '秀英区', '', '', '', '460105', '570100', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460106', '460100', '156-460000-460100-460106-', '龙华区', '龙华区', '', '', '', '460106', '570100', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460107', '460100', '156-460000-460100-460107-', '琼山区', '琼山区', '', '', '', '460107', '571100', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460108', '460100', '156-460000-460100-460108-', '美兰区', '美兰区', '', '', '', '460108', '570100', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460200', '460000', '156-460000-460200-', '三亚', '三亚市', '', '', '', '460200', '572000', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460201', '460200', '156-460000-460200-460201-', '市辖区', '市辖区', '', '', '', '460201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460300', '460000', '156-460000-460300-', '三沙', '三沙市', '', '', '', '460300', '573199', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460321', '460300', '156-460000-460300-460321-', '西沙群岛', '西沙群岛', '', '', '', '460321', '572000', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460322', '460300', '156-460000-460300-460322-', '南沙群岛', '南沙群岛', '', '', '', '460322', '572000', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('460323', '460300', '156-460000-460300-460323-', '中沙群岛', '中沙群岛的岛礁及其海域', '', '', '', '460323', '572000', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469000', '460000', '156-460000-469000-', '省直辖县', '省直辖县级行政区划', '', '', '', '469000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469001', '469000', '156-460000-469000-469001-', '五指山市', '五指山市', '', '', '', '469001', '572200', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469002', '469000', '156-460000-469000-469002-', '琼海市', '琼海市', '', '', '', '469002', '571400', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469003', '469000', '156-460000-469000-469003-', '儋州市', '儋州市', '', '', '', '469003', '571700', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469005', '469000', '156-460000-469000-469005-', '文昌市', '文昌市', '', '', '', '469005', '571300', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469006', '469000', '156-460000-469000-469006-', '万宁市', '万宁市', '', '', '', '469006', '571500', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469007', '469000', '156-460000-469000-469007-', '东方市', '东方市', '', '', '', '469007', '572600', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469021', '469000', '156-460000-469000-469021-', '定安县', '定安县', '', '', '', '469021', '571200', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469022', '469000', '156-460000-469000-469022-', '屯昌县', '屯昌县', '', '', '', '469022', '571600', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469023', '469000', '156-460000-469000-469023-', '澄迈县', '澄迈县', '', '', '', '469023', '571900', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469024', '469000', '156-460000-469000-469024-', '临高县', '临高县', '', '', '', '469024', '571800', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469025', '469000', '156-460000-469000-469025-', '白沙县', '白沙黎族自治县', '', '', '', '469025', '572800', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469026', '469000', '156-460000-469000-469026-', '昌江县', '昌江黎族自治县', '', '', '', '469026', '572700', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469027', '469000', '156-460000-469000-469027-', '乐东县', '乐东黎族自治县', '', '', '', '469027', '572500', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469028', '469000', '156-460000-469000-469028-', '陵水县', '陵水黎族自治县', '', '', '', '469028', '572400', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469029', '469000', '156-460000-469000-469029-', '保亭县', '保亭黎族苗族自治县', '', '', '', '469029', '572300', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('469030', '469000', '156-460000-469000-469030-', '琼中县', '琼中黎族苗族自治县', '', '', '', '469030', '572900', '0898', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500000', '156', '156-500000-', '重庆', '重庆市', 'ChongQing', 'ChongQing', 'CQ', '500000', '400000', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500100', '500000', '156-500000-500100-', '市辖区', '市辖区', '', '', '', '500100', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500101', '500100', '156-500000-500100-500101-', '万州区', '万州区', '', '', '', '500101', '404100', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500102', '500100', '156-500000-500100-500102-', '涪陵区', '涪陵区', '', '', '', '500102', '408000', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500103', '500100', '156-500000-500100-500103-', '渝中区', '渝中区', '', '', '', '500103', '400000', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500104', '500100', '156-500000-500100-500104-', '大渡口区', '大渡口区', '', '', '', '500104', '400000', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500105', '500100', '156-500000-500100-500105-', '江北区', '江北区', '', '', '', '500105', '400000', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500106', '500100', '156-500000-500100-500106-', '沙坪坝区', '沙坪坝区', '', '', '', '500106', '400000', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500107', '500100', '156-500000-500100-500107-', '九龙坡区', '九龙坡区', '', '', '', '500107', '400000', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500108', '500100', '156-500000-500100-500108-', '南岸区', '南岸区', '', '', '', '500108', '400000', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500109', '500100', '156-500000-500100-500109-', '北碚区', '北碚区', '', '', '', '500109', '400700', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500110', '500100', '156-500000-500100-500110-', '綦江区', '綦江区', '', '', '', '500110', '401420', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500111', '500100', '156-500000-500100-500111-', '大足区', '大足区', '', '', '', '500111', '402360', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500112', '500100', '156-500000-500100-500112-', '渝北区', '渝北区', '', '', '', '500112', '401120', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500113', '500100', '156-500000-500100-500113-', '巴南区', '巴南区', '', '', '', '500113', '401320', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500114', '500100', '156-500000-500100-500114-', '黔江区', '黔江区', '', '', '', '500114', '409000', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500115', '500100', '156-500000-500100-500115-', '长寿区', '长寿区', '', '', '', '500115', '401220', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500116', '500100', '156-500000-500100-500116-', '江津区', '江津区', '', '', '', '500116', '402260', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500117', '500100', '156-500000-500100-500117-', '合川区', '合川区', '', '', '', '500117', '401520', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500118', '500100', '156-500000-500100-500118-', '永川区', '永川区', '', '', '', '500118', '402160', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500119', '500100', '156-500000-500100-500119-', '南川区', '南川区', '', '', '', '500119', '408400', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500200', '500000', '156-500000-500200-', '县', '县', '', '', '', '500200', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500223', '500200', '156-500000-500200-500223-', '潼南县', '潼南县', '', '', '', '500223', '402660', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500224', '500200', '156-500000-500200-500224-', '铜梁县', '铜梁县', '', '', '', '500224', '402560', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500226', '500200', '156-500000-500200-500226-', '荣昌县', '荣昌县', '', '', '', '500226', '402460', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500227', '500200', '156-500000-500200-500227-', '璧山县', '璧山县', '', '', '', '500227', '402760', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500228', '500200', '156-500000-500200-500228-', '梁平县', '梁平县', '', '', '', '500228', '405200', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500229', '500200', '156-500000-500200-500229-', '城口县', '城口县', '', '', '', '500229', '405900', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500230', '500200', '156-500000-500200-500230-', '丰都县', '丰都县', '', '', '', '500230', '408200', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500231', '500200', '156-500000-500200-500231-', '垫江县', '垫江县', '', '', '', '500231', '408300', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500232', '500200', '156-500000-500200-500232-', '武隆县', '武隆县', '', '', '', '500232', '408500', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500233', '500200', '156-500000-500200-500233-', '忠县', '忠县', '', '', '', '500233', '404300', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500234', '500200', '156-500000-500200-500234-', '开县', '开县', '', '', '', '500234', '405400', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500235', '500200', '156-500000-500200-500235-', '云阳县', '云阳县', '', '', '', '500235', '404500', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500236', '500200', '156-500000-500200-500236-', '奉节县', '奉节县', '', '', '', '500236', '404600', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500237', '500200', '156-500000-500200-500237-', '巫山县', '巫山县', '', '', '', '500237', '404700', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500238', '500200', '156-500000-500200-500238-', '巫溪县', '巫溪县', '', '', '', '500238', '405800', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500240', '500200', '156-500000-500200-500240-', '石柱土家族自治县', '石柱土家族自治县', '', '', '', '500240', '409100', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500241', '500200', '156-500000-500200-500241-', '秀山土家族苗族自治县', '秀山土家族苗族自治县', '', '', '', '500241', '409900', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500242', '500200', '156-500000-500200-500242-', '酉阳土家族苗族自治县', '酉阳土家族苗族自治县', '', '', '', '500242', '409800', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('500243', '500200', '156-500000-500200-500243-', '彭水苗族土家族自治县', '彭水苗族土家族自治县', '', '', '', '500243', '409600', '023', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510000', '156', '156-510000-', '四川', '四川省', 'SiChuan', 'SiChuan', 'SC', '510000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510100', '510000', '156-510000-510100-', '成都', '成都市', '', '', '', '510100', '610000', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510101', '510100', '156-510000-510100-510101-', '市辖区', '市辖区', '', '', '', '510101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510104', '510100', '156-510000-510100-510104-', '锦江区', '锦江区', '', '', '', '510104', '610000', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510105', '510100', '156-510000-510100-510105-', '青羊区', '青羊区', '', '', '', '510105', '610000', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510106', '510100', '156-510000-510100-510106-', '金牛区', '金牛区', '', '', '', '510106', '610000', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510107', '510100', '156-510000-510100-510107-', '武侯区', '武侯区', '', '', '', '510107', '610000', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510108', '510100', '156-510000-510100-510108-', '成华区', '成华区', '', '', '', '510108', '610000', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510112', '510100', '156-510000-510100-510112-', '龙泉驿区', '龙泉驿区', '', '', '', '510112', '610100', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510113', '510100', '156-510000-510100-510113-', '青白江区', '青白江区', '', '', '', '510113', '610300', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510114', '510100', '156-510000-510100-510114-', '新都区', '新都区', '', '', '', '510114', '610500', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510115', '510100', '156-510000-510100-510115-', '温江区', '温江区', '', '', '', '510115', '611100', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510121', '510100', '156-510000-510100-510121-', '金堂县', '金堂县', '', '', '', '510121', '610400', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510122', '510100', '156-510000-510100-510122-', '双流县', '双流县', '', '', '', '510122', '610200', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510124', '510100', '156-510000-510100-510124-', '郫县', '郫县', '', '', '', '510124', '611700', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510129', '510100', '156-510000-510100-510129-', '大邑县', '大邑县', '', '', '', '510129', '611300', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510131', '510100', '156-510000-510100-510131-', '蒲江县', '蒲江县', '', '', '', '510131', '611600', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510132', '510100', '156-510000-510100-510132-', '新津县', '新津县', '', '', '', '510132', '611400', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510181', '510100', '156-510000-510100-510181-', '都江堰市', '都江堰市', '', '', '', '510181', '611800', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510182', '510100', '156-510000-510100-510182-', '彭州市', '彭州市', '', '', '', '510182', '611900', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510183', '510100', '156-510000-510100-510183-', '邛崃市', '邛崃市', '', '', '', '510183', '611500', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510184', '510100', '156-510000-510100-510184-', '崇州市', '崇州市', '', '', '', '510184', '611200', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510300', '510000', '156-510000-510300-', '自贡', '自贡市', '', '', '', '510300', '643000', '0813', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510301', '510300', '156-510000-510300-510301-', '市辖区', '市辖区', '', '', '', '510301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510302', '510300', '156-510000-510300-510302-', '自流井区', '自流井区', '', '', '', '510302', '643000', '0813', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510303', '510300', '156-510000-510300-510303-', '贡井区', '贡井区', '', '', '', '510303', '643020', '0813', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510304', '510300', '156-510000-510300-510304-', '大安区', '大安区', '', '', '', '510304', '643010', '0813', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510311', '510300', '156-510000-510300-510311-', '沿滩区', '沿滩区', '', '', '', '510311', '643030', '0813', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510321', '510300', '156-510000-510300-510321-', '荣县', '荣县', '', '', '', '510321', '643100', '0813', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510322', '510300', '156-510000-510300-510322-', '富顺县', '富顺县', '', '', '', '510322', '643200', '0813', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510400', '510000', '156-510000-510400-', '攀枝花', '攀枝花市', '', '', '', '510400', '617000', '0812', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510401', '510400', '156-510000-510400-510401-', '市辖区', '市辖区', '', '', '', '510401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510402', '510400', '156-510000-510400-510402-', '东区', '东区', '', '', '', '510402', '617000', '0812', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510403', '510400', '156-510000-510400-510403-', '西区', '西区', '', '', '', '510403', '617000', '0812', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510411', '510400', '156-510000-510400-510411-', '仁和区', '仁和区', '', '', '', '510411', '617000', '0812', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510421', '510400', '156-510000-510400-510421-', '米易县', '米易县', '', '', '', '510421', '617200', '0812', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510422', '510400', '156-510000-510400-510422-', '盐边县', '盐边县', '', '', '', '510422', '617100', '0812', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510500', '510000', '156-510000-510500-', '泸州', '泸州市', '', '', '', '510500', '646000', '0830', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510501', '510500', '156-510000-510500-510501-', '市辖区', '市辖区', '', '', '', '510501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510502', '510500', '156-510000-510500-510502-', '江阳区', '江阳区', '', '', '', '510502', '646000', '0830', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510503', '510500', '156-510000-510500-510503-', '纳溪区', '纳溪区', '', '', '', '510503', '646300', '0830', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510504', '510500', '156-510000-510500-510504-', '龙马潭区', '龙马潭区', '', '', '', '510504', '646000', '0830', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510521', '510500', '156-510000-510500-510521-', '泸县', '泸县', '', '', '', '510521', '646100', '0830', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510522', '510500', '156-510000-510500-510522-', '合江县', '合江县', '', '', '', '510522', '646200', '0830', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510524', '510500', '156-510000-510500-510524-', '叙永县', '叙永县', '', '', '', '510524', '646400', '0830', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510525', '510500', '156-510000-510500-510525-', '古蔺县', '古蔺县', '', '', '', '510525', '646500', '0830', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510600', '510000', '156-510000-510600-', '德阳', '德阳市', '', '', '', '510600', '618000', '0838', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510601', '510600', '156-510000-510600-510601-', '市辖区', '市辖区', '', '', '', '510601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510603', '510600', '156-510000-510600-510603-', '旌阳区', '旌阳区', '', '', '', '510603', '618000', '0838', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510623', '510600', '156-510000-510600-510623-', '中江县', '中江县', '', '', '', '510623', '618100', '0838', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510626', '510600', '156-510000-510600-510626-', '罗江县', '罗江县', '', '', '', '510626', '618500', '0838', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510681', '510600', '156-510000-510600-510681-', '广汉市', '广汉市', '', '', '', '510681', '618300', '0838', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510682', '510600', '156-510000-510600-510682-', '什邡市', '什邡市', '', '', '', '510682', '618400', '0838', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510683', '510600', '156-510000-510600-510683-', '绵竹市', '绵竹市', '', '', '', '510683', '618200', '0838', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510700', '510000', '156-510000-510700-', '绵阳', '绵阳市', '', '', '', '510700', '621000', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510701', '510700', '156-510000-510700-510701-', '市辖区', '市辖区', '', '', '', '510701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510703', '510700', '156-510000-510700-510703-', '涪城区', '涪城区', '', '', '', '510703', '621000', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510704', '510700', '156-510000-510700-510704-', '游仙区', '游仙区', '', '', '', '510704', '621000', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510722', '510700', '156-510000-510700-510722-', '三台县', '三台县', '', '', '', '510722', '621100', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510723', '510700', '156-510000-510700-510723-', '盐亭县', '盐亭县', '', '', '', '510723', '621600', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510724', '510700', '156-510000-510700-510724-', '安县', '安县', '', '', '', '510724', '622650', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510725', '510700', '156-510000-510700-510725-', '梓潼县', '梓潼县', '', '', '', '510725', '622150', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510726', '510700', '156-510000-510700-510726-', '北川羌族自治县', '北川羌族自治县', '', '', '', '510726', '622750', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510727', '510700', '156-510000-510700-510727-', '平武县', '平武县', '', '', '', '510727', '622550', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510781', '510700', '156-510000-510700-510781-', '江油市', '江油市', '', '', '', '510781', '621700', '0816', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510800', '510000', '156-510000-510800-', '广元', '广元市', '', '', '', '510800', '628000', '0839', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510801', '510800', '156-510000-510800-510801-', '市辖区', '市辖区', '', '', '', '510801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510802', '510800', '156-510000-510800-510802-', '利州区', '利州区', '', '', '', '510802', '628000', '0839', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510811', '510800', '156-510000-510800-510811-', '元坝区', '元坝区', '', '', '', '510811', '628000', '0839', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510812', '510800', '156-510000-510800-510812-', '朝天区', '朝天区', '', '', '', '510812', '628000', '0839', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510821', '510800', '156-510000-510800-510821-', '旺苍县', '旺苍县', '', '', '', '510821', '628200', '0839', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510822', '510800', '156-510000-510800-510822-', '青川县', '青川县', '', '', '', '510822', '628100', '0839', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510823', '510800', '156-510000-510800-510823-', '剑阁县', '剑阁县', '', '', '', '510823', '628300', '0839', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510824', '510800', '156-510000-510800-510824-', '苍溪县', '苍溪县', '', '', '', '510824', '628400', '0839', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510900', '510000', '156-510000-510900-', '遂宁', '遂宁市', '', '', '', '510900', '629000', '0825', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510901', '510900', '156-510000-510900-510901-', '市辖区', '市辖区', '', '', '', '510901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510903', '510900', '156-510000-510900-510903-', '船山区', '船山区', '', '', '', '510903', '629000', '0825', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510904', '510900', '156-510000-510900-510904-', '安居区', '安居区', '', '', '', '510904', '629000', '0825', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510921', '510900', '156-510000-510900-510921-', '蓬溪县', '蓬溪县', '', '', '', '510921', '629100', '0825', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510922', '510900', '156-510000-510900-510922-', '射洪县', '射洪县', '', '', '', '510922', '629200', '0825', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('510923', '510900', '156-510000-510900-510923-', '大英县', '大英县', '', '', '', '510923', '629300', '0825', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511000', '510000', '156-510000-511000-', '内江', '内江市', '', '', '', '511000', '641000', '0832', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511001', '511000', '156-510000-511000-511001-', '市辖区', '市辖区', '', '', '', '511001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511002', '511000', '156-510000-511000-511002-', '市中区', '市中区', '', '', '', '511002', '641000', '0832', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511011', '511000', '156-510000-511000-511011-', '东兴区', '东兴区', '', '', '', '511011', '641100', '0832', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511024', '511000', '156-510000-511000-511024-', '威远县', '威远县', '', '', '', '511024', '642450', '0832', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511025', '511000', '156-510000-511000-511025-', '资中县', '资中县', '', '', '', '511025', '641200', '0832', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511028', '511000', '156-510000-511000-511028-', '隆昌县', '隆昌县', '', '', '', '511028', '642150', '0832', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511100', '510000', '156-510000-511100-', '乐山', '乐山市', '', '', '', '511100', '614000', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511101', '511100', '156-510000-511100-511101-', '市辖区', '市辖区', '', '', '', '511101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511102', '511100', '156-510000-511100-511102-', '市中区', '市中区', '', '', '', '511102', '614000', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511111', '511100', '156-510000-511100-511111-', '沙湾区', '沙湾区', '', '', '', '511111', '614900', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511112', '511100', '156-510000-511100-511112-', '五通桥区', '五通桥区', '', '', '', '511112', '614800', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511113', '511100', '156-510000-511100-511113-', '金口河区', '金口河区', '', '', '', '511113', '614700', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511123', '511100', '156-510000-511100-511123-', '犍为县', '犍为县', '', '', '', '511123', '614400', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511124', '511100', '156-510000-511100-511124-', '井研县', '井研县', '', '', '', '511124', '613100', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511126', '511100', '156-510000-511100-511126-', '夹江县', '夹江县', '', '', '', '511126', '614100', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511129', '511100', '156-510000-511100-511129-', '沐川县', '沐川县', '', '', '', '511129', '614500', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511132', '511100', '156-510000-511100-511132-', '峨边彝族自治县', '峨边彝族自治县', '', '', '', '511132', '614300', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511133', '511100', '156-510000-511100-511133-', '马边彝族自治县', '马边彝族自治县', '', '', '', '511133', '614600', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511181', '511100', '156-510000-511100-511181-', '峨眉山市', '峨眉山市', '', '', '', '511181', '614200', '0833', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511300', '510000', '156-510000-511300-', '南充', '南充市', '', '', '', '511300', '637000', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511301', '511300', '156-510000-511300-511301-', '市辖区', '市辖区', '', '', '', '511301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511302', '511300', '156-510000-511300-511302-', '顺庆区', '顺庆区', '', '', '', '511302', '637000', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511303', '511300', '156-510000-511300-511303-', '高坪区', '高坪区', '', '', '', '511303', '637100', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511304', '511300', '156-510000-511300-511304-', '嘉陵区', '嘉陵区', '', '', '', '511304', '637500', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511321', '511300', '156-510000-511300-511321-', '南部县', '南部县', '', '', '', '511321', '637300', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511322', '511300', '156-510000-511300-511322-', '营山县', '营山县', '', '', '', '511322', '637700', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511323', '511300', '156-510000-511300-511323-', '蓬安县', '蓬安县', '', '', '', '511323', '637800', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511324', '511300', '156-510000-511300-511324-', '仪陇县', '仪陇县', '', '', '', '511324', '637600', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511325', '511300', '156-510000-511300-511325-', '西充县', '西充县', '', '', '', '511325', '637200', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511381', '511300', '156-510000-511300-511381-', '阆中市', '阆中市', '', '', '', '511381', '637400', '0817', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511400', '510000', '156-510000-511400-', '眉山', '眉山市', '', '', '', '511400', '620000', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511401', '511400', '156-510000-511400-511401-', '市辖区', '市辖区', '', '', '', '511401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511402', '511400', '156-510000-511400-511402-', '东坡区', '东坡区', '', '', '', '511402', '620000', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511421', '511400', '156-510000-511400-511421-', '仁寿县', '仁寿县', '', '', '', '511421', '620500', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511422', '511400', '156-510000-511400-511422-', '彭山县', '彭山县', '', '', '', '511422', '620800', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511423', '511400', '156-510000-511400-511423-', '洪雅县', '洪雅县', '', '', '', '511423', '620300', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511424', '511400', '156-510000-511400-511424-', '丹棱县', '丹棱县', '', '', '', '511424', '620200', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511425', '511400', '156-510000-511400-511425-', '青神县', '青神县', '', '', '', '511425', '620400', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511500', '510000', '156-510000-511500-', '宜宾', '宜宾市', '', '', '', '511500', '644000', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511501', '511500', '156-510000-511500-511501-', '市辖区', '市辖区', '', '', '', '511501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511502', '511500', '156-510000-511500-511502-', '翠屏区', '翠屏区', '', '', '', '511502', '644000', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511503', '511500', '156-510000-511500-511503-', '南溪区', '南溪区', '', '', '', '511503', '644100', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511521', '511500', '156-510000-511500-511521-', '宜宾县', '宜宾县', '', '', '', '511521', '644600', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511523', '511500', '156-510000-511500-511523-', '江安县', '江安县', '', '', '', '511523', '644200', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511524', '511500', '156-510000-511500-511524-', '长宁县', '长宁县', '', '', '', '511524', '644300', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511525', '511500', '156-510000-511500-511525-', '高县', '高县', '', '', '', '511525', '645150', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511526', '511500', '156-510000-511500-511526-', '珙县', '珙县', '', '', '', '511526', '644500', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511527', '511500', '156-510000-511500-511527-', '筠连县', '筠连县', '', '', '', '511527', '645250', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511528', '511500', '156-510000-511500-511528-', '兴文县', '兴文县', '', '', '', '511528', '644400', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511529', '511500', '156-510000-511500-511529-', '屏山县', '屏山县', '', '', '', '511529', '645350', '0831', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511600', '510000', '156-510000-511600-', '广安', '广安市', '', '', '', '511600', '638500', '0826', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511601', '511600', '156-510000-511600-511601-', '市辖区', '市辖区', '', '', '', '511601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511602', '511600', '156-510000-511600-511602-', '广安区', '广安区', '', '', '', '511602', '638550', '0826', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511621', '511600', '156-510000-511600-511621-', '岳池县', '岳池县', '', '', '', '511621', '638300', '0826', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511622', '511600', '156-510000-511600-511622-', '武胜县', '武胜县', '', '', '', '511622', '638400', '0826', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511623', '511600', '156-510000-511600-511623-', '邻水县', '邻水县', '', '', '', '511623', '638500', '0826', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511681', '511600', '156-510000-511600-511681-', '华蓥市', '华蓥市', '', '', '', '511681', '638600', '0826', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511700', '510000', '156-510000-511700-', '达州', '达州市', '', '', '', '511700', '635000', '0818', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511701', '511700', '156-510000-511700-511701-', '市辖区', '市辖区', '', '', '', '511701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511702', '511700', '156-510000-511700-511702-', '通川区', '通川区', '', '', '', '511702', '635000', '0818', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511721', '511700', '156-510000-511700-511721-', '达县', '达县', '', '', '', '511721', '635000', '0818', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511722', '511700', '156-510000-511700-511722-', '宣汉县', '宣汉县', '', '', '', '511722', '636150', '0818', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511723', '511700', '156-510000-511700-511723-', '开江县', '开江县', '', '', '', '511723', '636250', '0818', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511724', '511700', '156-510000-511700-511724-', '大竹县', '大竹县', '', '', '', '511724', '635100', '0818', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511725', '511700', '156-510000-511700-511725-', '渠县', '渠县', '', '', '', '511725', '635200', '0818', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511781', '511700', '156-510000-511700-511781-', '万源市', '万源市', '', '', '', '511781', '636350', '0818', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511800', '510000', '156-510000-511800-', '雅安', '雅安市', '', '', '', '511800', '625000', '0835', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511801', '511800', '156-510000-511800-511801-', '市辖区', '市辖区', '', '', '', '511801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511802', '511800', '156-510000-511800-511802-', '雨城区', '雨城区', '', '', '', '511802', '625000', '0835', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511803', '511800', '156-510000-511800-511803-', '名山区', '名山区', '', '', '', '511803', '625100', '0835', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511822', '511800', '156-510000-511800-511822-', '荥经县', '荥经县', '', '', '', '511822', '625200', '0835', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511823', '511800', '156-510000-511800-511823-', '汉源县', '汉源县', '', '', '', '511823', '625300', '0835', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511824', '511800', '156-510000-511800-511824-', '石棉县', '石棉县', '', '', '', '511824', '625400', '0835', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511825', '511800', '156-510000-511800-511825-', '天全县', '天全县', '', '', '', '511825', '625500', '0835', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511826', '511800', '156-510000-511800-511826-', '芦山县', '芦山县', '', '', '', '511826', '625600', '0835', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511827', '511800', '156-510000-511800-511827-', '宝兴县', '宝兴县', '', '', '', '511827', '625700', '0835', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511900', '510000', '156-510000-511900-', '巴中', '巴中市', '', '', '', '511900', '636600', '0827', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511901', '511900', '156-510000-511900-511901-', '市辖区', '市辖区', '', '', '', '511901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511902', '511900', '156-510000-511900-511902-', '巴州区', '巴州区', '', '', '', '511902', '636600', '0827', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511921', '511900', '156-510000-511900-511921-', '通江县', '通江县', '', '', '', '511921', '636700', '0827', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511922', '511900', '156-510000-511900-511922-', '南江县', '南江县', '', '', '', '511922', '635600', '0827', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('511923', '511900', '156-510000-511900-511923-', '平昌县', '平昌县', '', '', '', '511923', '636400', '0827', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('512000', '510000', '156-510000-512000-', '资阳', '资阳市', '', '', '', '512000', '641300', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('512001', '512000', '156-510000-512000-512001-', '市辖区', '市辖区', '', '', '', '512001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('512002', '512000', '156-510000-512000-512002-', '雁江区', '雁江区', '', '', '', '512002', '641300', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('512021', '512000', '156-510000-512000-512021-', '安岳县', '安岳县', '', '', '', '512021', '642350', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('512022', '512000', '156-510000-512000-512022-', '乐至县', '乐至县', '', '', '', '512022', '641500', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('512081', '512000', '156-510000-512000-512081-', '简阳市', '简阳市', '', '', '', '512081', '641400', '028', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513200', '510000', '156-510000-513200-', '阿坝州', '阿坝藏族羌族自治州', '', '', '', '513200', '624000', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513221', '513200', '156-510000-513200-513221-', '汶川县', '汶川县', '', '', '', '513221', '623000', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513222', '513200', '156-510000-513200-513222-', '理县', '理县', '', '', '', '513222', '623100', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513223', '513200', '156-510000-513200-513223-', '茂县', '茂县', '', '', '', '513223', '623200', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513224', '513200', '156-510000-513200-513224-', '松潘县', '松潘县', '', '', '', '513224', '623300', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513225', '513200', '156-510000-513200-513225-', '九寨沟县', '九寨沟县', '', '', '', '513225', '623400', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513226', '513200', '156-510000-513200-513226-', '金川县', '金川县', '', '', '', '513226', '624100', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513227', '513200', '156-510000-513200-513227-', '小金县', '小金县', '', '', '', '513227', '624200', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513228', '513200', '156-510000-513200-513228-', '黑水县', '黑水县', '', '', '', '513228', '623500', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513229', '513200', '156-510000-513200-513229-', '马尔康县', '马尔康县', '', '', '', '513229', '624000', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513230', '513200', '156-510000-513200-513230-', '壤塘县', '壤塘县', '', '', '', '513230', '624300', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513231', '513200', '156-510000-513200-513231-', '阿坝县', '阿坝县', '', '', '', '513231', '624600', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513232', '513200', '156-510000-513200-513232-', '若尔盖县', '若尔盖县', '', '', '', '513232', '624500', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513233', '513200', '156-510000-513200-513233-', '红原县', '红原县', '', '', '', '513233', '624400', '0837', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513300', '510000', '156-510000-513300-', '甘孜州', '甘孜藏族自治州', '', '', '', '513300', '626000', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513321', '513300', '156-510000-513300-513321-', '康定县', '康定县', '', '', '', '513321', '626000', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513322', '513300', '156-510000-513300-513322-', '泸定县', '泸定县', '', '', '', '513322', '626100', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513323', '513300', '156-510000-513300-513323-', '丹巴县', '丹巴县', '', '', '', '513323', '626300', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513324', '513300', '156-510000-513300-513324-', '九龙县', '九龙县', '', '', '', '513324', '616200', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513325', '513300', '156-510000-513300-513325-', '雅江县', '雅江县', '', '', '', '513325', '627450', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513326', '513300', '156-510000-513300-513326-', '道孚县', '道孚县', '', '', '', '513326', '626400', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513327', '513300', '156-510000-513300-513327-', '炉霍县', '炉霍县', '', '', '', '513327', '626500', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513328', '513300', '156-510000-513300-513328-', '甘孜县', '甘孜县', '', '', '', '513328', '626700', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513329', '513300', '156-510000-513300-513329-', '新龙县', '新龙县', '', '', '', '513329', '626800', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513330', '513300', '156-510000-513300-513330-', '德格县', '德格县', '', '', '', '513330', '627250', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513331', '513300', '156-510000-513300-513331-', '白玉县', '白玉县', '', '', '', '513331', '627150', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513332', '513300', '156-510000-513300-513332-', '石渠县', '石渠县', '', '', '', '513332', '627350', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513333', '513300', '156-510000-513300-513333-', '色达县', '色达县', '', '', '', '513333', '626600', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513334', '513300', '156-510000-513300-513334-', '理塘县', '理塘县', '', '', '', '513334', '624300', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513335', '513300', '156-510000-513300-513335-', '巴塘县', '巴塘县', '', '', '', '513335', '627650', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513336', '513300', '156-510000-513300-513336-', '乡城县', '乡城县', '', '', '', '513336', '627850', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513337', '513300', '156-510000-513300-513337-', '稻城县', '稻城县', '', '', '', '513337', '627750', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513338', '513300', '156-510000-513300-513338-', '得荣县', '得荣县', '', '', '', '513338', '627950', '0836', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513400', '510000', '156-510000-513400-', '凉山州', '凉山彝族自治州', '', '', '', '513400', '615000', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513401', '513400', '156-510000-513400-513401-', '西昌市', '西昌市', '', '', '', '513401', '615000', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513422', '513400', '156-510000-513400-513422-', '木里藏族自治县', '木里藏族自治县', '', '', '', '513422', '615800', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513423', '513400', '156-510000-513400-513423-', '盐源县', '盐源县', '', '', '', '513423', '615700', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513424', '513400', '156-510000-513400-513424-', '德昌县', '德昌县', '', '', '', '513424', '615500', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513425', '513400', '156-510000-513400-513425-', '会理县', '会理县', '', '', '', '513425', '615100', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513426', '513400', '156-510000-513400-513426-', '会东县', '会东县', '', '', '', '513426', '615200', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513427', '513400', '156-510000-513400-513427-', '宁南县', '宁南县', '', '', '', '513427', '615400', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513428', '513400', '156-510000-513400-513428-', '普格县', '普格县', '', '', '', '513428', '615300', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513429', '513400', '156-510000-513400-513429-', '布拖县', '布拖县', '', '', '', '513429', '615350', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513430', '513400', '156-510000-513400-513430-', '金阳县', '金阳县', '', '', '', '513430', '616250', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513431', '513400', '156-510000-513400-513431-', '昭觉县', '昭觉县', '', '', '', '513431', '616150', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513432', '513400', '156-510000-513400-513432-', '喜德县', '喜德县', '', '', '', '513432', '616750', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513433', '513400', '156-510000-513400-513433-', '冕宁县', '冕宁县', '', '', '', '513433', '615600', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513434', '513400', '156-510000-513400-513434-', '越西县', '越西县', '', '', '', '513434', '616650', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513435', '513400', '156-510000-513400-513435-', '甘洛县', '甘洛县', '', '', '', '513435', '616850', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513436', '513400', '156-510000-513400-513436-', '美姑县', '美姑县', '', '', '', '513436', '616450', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('513437', '513400', '156-510000-513400-513437-', '雷波县', '雷波县', '', '', '', '513437', '616550', '0834', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520000', '156', '156-520000-', '贵州', '贵州省', 'GuiZhou', 'GuiZhou', 'FZ', '520000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520100', '520000', '156-520000-520100-', '贵阳', '贵阳市', '', '', '', '520100', '550000', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520101', '520100', '156-520000-520100-520101-', '市辖区', '市辖区', '', '', '', '520101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520102', '520100', '156-520000-520100-520102-', '南明区', '南明区', '', '', '', '520102', '550000', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520103', '520100', '156-520000-520100-520103-', '云岩区', '云岩区', '', '', '', '520103', '550000', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520111', '520100', '156-520000-520100-520111-', '花溪区', '花溪区', '', '', '', '520111', '550000', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520112', '520100', '156-520000-520100-520112-', '乌当区', '乌当区', '', '', '', '520112', '550000', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520113', '520100', '156-520000-520100-520113-', '白云区', '白云区', '', '', '', '520113', '550000', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520114', '520100', '156-520000-520100-520114-', '小河区', '小河区', '', '', '', '520114', '550000', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520121', '520100', '156-520000-520100-520121-', '开阳县', '开阳县', '', '', '', '520121', '550300', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520122', '520100', '156-520000-520100-520122-', '息烽县', '息烽县', '', '', '', '520122', '551100', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520123', '520100', '156-520000-520100-520123-', '修文县', '修文县', '', '', '', '520123', '550200', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520181', '520100', '156-520000-520100-520181-', '清镇市', '清镇市', '', '', '', '520181', '551400', '0851', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520200', '520000', '156-520000-520200-', '六盘水', '六盘水市', '', '', '', '520200', '553000', '0858', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520201', '520200', '156-520000-520200-520201-', '钟山区', '钟山区', '', '', '', '520201', '553000', '0858', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520203', '520200', '156-520000-520200-520203-', '六枝特区', '六枝特区', '', '', '', '520203', '553400', '0858', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520221', '520200', '156-520000-520200-520221-', '水城县', '水城县', '', '', '', '520221', '553600', '0858', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520222', '520200', '156-520000-520200-520222-', '盘县', '盘县', '', '', '', '520222', '553500', '0858', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520300', '520000', '156-520000-520300-', '遵义', '遵义市', '', '', '', '520300', '563000', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520301', '520300', '156-520000-520300-520301-', '市辖区', '市辖区', '', '', '', '520301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520302', '520300', '156-520000-520300-520302-', '红花岗区', '红花岗区', '', '', '', '520302', '563000', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520303', '520300', '156-520000-520300-520303-', '汇川区', '汇川区', '', '', '', '520303', '563000', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520321', '520300', '156-520000-520300-520321-', '遵义县', '遵义县', '', '', '', '520321', '563100', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520322', '520300', '156-520000-520300-520322-', '桐梓县', '桐梓县', '', '', '', '520322', '563200', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520323', '520300', '156-520000-520300-520323-', '绥阳县', '绥阳县', '', '', '', '520323', '563300', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520324', '520300', '156-520000-520300-520324-', '正安县', '正安县', '', '', '', '520324', '563400', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520325', '520300', '156-520000-520300-520325-', '道真仡佬族苗族自治县', '道真仡佬族苗族自治县', '', '', '', '520325', '563500', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520326', '520300', '156-520000-520300-520326-', '务川仡佬族苗族自治县', '务川仡佬族苗族自治县', '', '', '', '520326', '564300', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520327', '520300', '156-520000-520300-520327-', '凤冈县', '凤冈县', '', '', '', '520327', '564200', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520328', '520300', '156-520000-520300-520328-', '湄潭县', '湄潭县', '', '', '', '520328', '564100', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520329', '520300', '156-520000-520300-520329-', '余庆县', '余庆县', '', '', '', '520329', '564400', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520330', '520300', '156-520000-520300-520330-', '习水县', '习水县', '', '', '', '520330', '564600', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520381', '520300', '156-520000-520300-520381-', '赤水市', '赤水市', '', '', '', '520381', '564700', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520382', '520300', '156-520000-520300-520382-', '仁怀市', '仁怀市', '', '', '', '520382', '564500', '0852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520400', '520000', '156-520000-520400-', '安顺', '安顺市', '', '', '', '520400', '561000', '0853', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520401', '520400', '156-520000-520400-520401-', '市辖区', '市辖区', '', '', '', '520401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520402', '520400', '156-520000-520400-520402-', '西秀区', '西秀区', '', '', '', '520402', '561000', '0853', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520421', '520400', '156-520000-520400-520421-', '平坝县', '平坝县', '', '', '', '520421', '561100', '0853', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520422', '520400', '156-520000-520400-520422-', '普定县', '普定县', '', '', '', '520422', '562100', '0853', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520423', '520400', '156-520000-520400-520423-', '镇宁布依族苗族自治县', '镇宁布依族苗族自治县', '', '', '', '520423', '561200', '0853', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520424', '520400', '156-520000-520400-520424-', '关岭布依族苗族自治县', '关岭布依族苗族自治县', '', '', '', '520424', '561300', '0853', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520425', '520400', '156-520000-520400-520425-', '紫云苗族布依族自治县', '紫云苗族布依族自治县', '', '', '', '520425', '550800', '0853', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520500', '520000', '156-520000-520500-', '毕节', '毕节市', '', '', '', '520500', '551700', '0857', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520502', '520500', '156-520000-520500-520502-', '七星关区', '七星关区', '', '', '', '520502', '0', '0857', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520521', '520500', '156-520000-520500-520521-', '大方县', '大方县', '', '', '', '520521', '551600', '0857', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520522', '520500', '156-520000-520500-520522-', '黔西县', '黔西县', '', '', '', '520522', '551500', '0857', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520523', '520500', '156-520000-520500-520523-', '金沙县', '金沙县', '', '', '', '520523', '551800', '0857', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520524', '520500', '156-520000-520500-520524-', '织金县', '织金县', '', '', '', '520524', '552100', '0857', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520525', '520500', '156-520000-520500-520525-', '纳雍县', '纳雍县', '', '', '', '520525', '553300', '0857', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520526', '520500', '156-520000-520500-520526-', '威宁县', '威宁彝族回族苗族自治县', '', '', '', '520526', '553100', '0857', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520527', '520500', '156-520000-520500-520527-', '赫章县', '赫章县', '', '', '', '520527', '553200', '0857', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520600', '520000', '156-520000-520600-', '铜仁', '铜仁市', '', '', '', '520600', '554300', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520602', '520600', '156-520000-520600-520602-', '碧江区', '碧江区', '', '', '', '520602', '554300', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520603', '520600', '156-520000-520600-520603-', '万山区', '万山区', '', '', '', '520603', '554200', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520621', '520600', '156-520000-520600-520621-', '江口县', '江口县', '', '', '', '520621', '554400', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520622', '520600', '156-520000-520600-520622-', '玉屏县', '玉屏侗族自治县', '', '', '', '520622', '554000', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520623', '520600', '156-520000-520600-520623-', '石阡县', '石阡县', '', '', '', '520623', '555100', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520624', '520600', '156-520000-520600-520624-', '思南县', '思南县', '', '', '', '520624', '565100', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520625', '520600', '156-520000-520600-520625-', '印江县', '印江土家族苗族自治县', '', '', '', '520625', '555200', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520626', '520600', '156-520000-520600-520626-', '德江县', '德江县', '', '', '', '520626', '565200', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520627', '520600', '156-520000-520600-520627-', '沿河县', '沿河土家族自治县', '', '', '', '520627', '565300', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('520628', '520600', '156-520000-520600-520628-', '松桃县', '松桃苗族自治县', '', '', '', '520628', '554100', '0856', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522300', '520000', '156-520000-522300-', '黔西南', '黔西南布依族苗族自治州', '', '', '', '522300', '562400', '0859', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522301', '522300', '156-520000-522300-522301-', '兴义市', '兴义市', '', '', '', '522301', '562400', '0859', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522322', '522300', '156-520000-522300-522322-', '兴仁县', '兴仁县', '', '', '', '522322', '562300', '0859', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522323', '522300', '156-520000-522300-522323-', '普安县', '普安县', '', '', '', '522323', '561500', '0859', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522324', '522300', '156-520000-522300-522324-', '晴隆县', '晴隆县', '', '', '', '522324', '561400', '0859', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522325', '522300', '156-520000-522300-522325-', '贞丰县', '贞丰县', '', '', '', '522325', '562200', '0859', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522326', '522300', '156-520000-522300-522326-', '望谟县', '望谟县', '', '', '', '522326', '552300', '0859', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522327', '522300', '156-520000-522300-522327-', '册亨县', '册亨县', '', '', '', '522327', '552200', '0859', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522328', '522300', '156-520000-522300-522328-', '安龙县', '安龙县', '', '', '', '522328', '552400', '0859', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522600', '520000', '156-520000-522600-', '黔东南', '黔东南苗族侗族自治州', '', '', '', '522600', '556000', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522601', '522600', '156-520000-522600-522601-', '凯里市', '凯里市', '', '', '', '522601', '556000', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522622', '522600', '156-520000-522600-522622-', '黄平县', '黄平县', '', '', '', '522622', '556100', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522623', '522600', '156-520000-522600-522623-', '施秉县', '施秉县', '', '', '', '522623', '556200', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522624', '522600', '156-520000-522600-522624-', '三穗县', '三穗县', '', '', '', '522624', '556500', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522625', '522600', '156-520000-522600-522625-', '镇远县', '镇远县', '', '', '', '522625', '557700', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522626', '522600', '156-520000-522600-522626-', '岑巩县', '岑巩县', '', '', '', '522626', '557800', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522627', '522600', '156-520000-522600-522627-', '天柱县', '天柱县', '', '', '', '522627', '556600', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522628', '522600', '156-520000-522600-522628-', '锦屏县', '锦屏县', '', '', '', '522628', '556700', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522629', '522600', '156-520000-522600-522629-', '剑河县', '剑河县', '', '', '', '522629', '556400', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522630', '522600', '156-520000-522600-522630-', '台江县', '台江县', '', '', '', '522630', '556300', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522631', '522600', '156-520000-522600-522631-', '黎平县', '黎平县', '', '', '', '522631', '557300', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522632', '522600', '156-520000-522600-522632-', '榕江县', '榕江县', '', '', '', '522632', '557200', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522633', '522600', '156-520000-522600-522633-', '从江县', '从江县', '', '', '', '522633', '557400', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522634', '522600', '156-520000-522600-522634-', '雷山县', '雷山县', '', '', '', '522634', '557100', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522635', '522600', '156-520000-522600-522635-', '麻江县', '麻江县', '', '', '', '522635', '557600', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522636', '522600', '156-520000-522600-522636-', '丹寨县', '丹寨县', '', '', '', '522636', '557500', '0855', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522700', '520000', '156-520000-522700-', '黔南', '黔南布依族苗族自治州', '', '', '', '522700', '558000', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522701', '522700', '156-520000-522700-522701-', '都匀市', '都匀市', '', '', '', '522701', '558000', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522702', '522700', '156-520000-522700-522702-', '福泉市', '福泉市', '', '', '', '522702', '550500', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522722', '522700', '156-520000-522700-522722-', '荔波县', '荔波县', '', '', '', '522722', '558400', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522723', '522700', '156-520000-522700-522723-', '贵定县', '贵定县', '', '', '', '522723', '551300', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522725', '522700', '156-520000-522700-522725-', '瓮安县', '瓮安县', '', '', '', '522725', '550400', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522726', '522700', '156-520000-522700-522726-', '独山县', '独山县', '', '', '', '522726', '558200', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522727', '522700', '156-520000-522700-522727-', '平塘县', '平塘县', '', '', '', '522727', '558300', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522728', '522700', '156-520000-522700-522728-', '罗甸县', '罗甸县', '', '', '', '522728', '550100', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522729', '522700', '156-520000-522700-522729-', '长顺县', '长顺县', '', '', '', '522729', '550700', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522730', '522700', '156-520000-522700-522730-', '龙里县', '龙里县', '', '', '', '522730', '551200', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522731', '522700', '156-520000-522700-522731-', '惠水县', '惠水县', '', '', '', '522731', '550600', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('522732', '522700', '156-520000-522700-522732-', '三都水族自治县', '三都水族自治县', '', '', '', '522732', '558100', '0854', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530000', '156', '156-530000-', '云南', '云南省', 'YunNan', 'YunNan', 'YN', '530000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530100', '530000', '156-530000-530100-', '昆明', '昆明市', '', '', '', '530100', '650000', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530101', '530100', '156-530000-530100-530101-', '市辖区', '市辖区', '', '', '', '530101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530102', '530100', '156-530000-530100-530102-', '五华区', '五华区', '', '', '', '530102', '650000', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530103', '530100', '156-530000-530100-530103-', '盘龙区', '盘龙区', '', '', '', '530103', '650000', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530111', '530100', '156-530000-530100-530111-', '官渡区', '官渡区', '', '', '', '530111', '650200', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530112', '530100', '156-530000-530100-530112-', '西山区', '西山区', '', '', '', '530112', '650100', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530113', '530100', '156-530000-530100-530113-', '东川区', '东川区', '', '', '', '530113', '654100', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530114', '530100', '156-530000-530100-530114-', '呈贡区', '呈贡区', '', '', '', '530114', '650500', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530122', '530100', '156-530000-530100-530122-', '晋宁县', '晋宁县', '', '', '', '530122', '650600', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530124', '530100', '156-530000-530100-530124-', '富民县', '富民县', '', '', '', '530124', '650400', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530125', '530100', '156-530000-530100-530125-', '宜良县', '宜良县', '', '', '', '530125', '652100', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530126', '530100', '156-530000-530100-530126-', '石林彝族自治县', '石林彝族自治县', '', '', '', '530126', '652200', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530127', '530100', '156-530000-530100-530127-', '嵩明县', '嵩明县', '', '', '', '530127', '651700', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530128', '530100', '156-530000-530100-530128-', '禄劝彝族苗族自治县', '禄劝彝族苗族自治县', '', '', '', '530128', '651500', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530129', '530100', '156-530000-530100-530129-', '寻甸回族彝族自治县', '寻甸回族彝族自治县', '', '', '', '530129', '655200', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530181', '530100', '156-530000-530100-530181-', '安宁市', '安宁市', '', '', '', '530181', '650300', '0871', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530300', '530000', '156-530000-530300-', '曲靖', '曲靖市', '', '', '', '530300', '655000', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530301', '530300', '156-530000-530300-530301-', '市辖区', '市辖区', '', '', '', '530301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530302', '530300', '156-530000-530300-530302-', '麒麟区', '麒麟区', '', '', '', '530302', '655000', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530321', '530300', '156-530000-530300-530321-', '马龙县', '马龙县', '', '', '', '530321', '655100', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530322', '530300', '156-530000-530300-530322-', '陆良县', '陆良县', '', '', '', '530322', '655600', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530323', '530300', '156-530000-530300-530323-', '师宗县', '师宗县', '', '', '', '530323', '655700', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530324', '530300', '156-530000-530300-530324-', '罗平县', '罗平县', '', '', '', '530324', '655800', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530325', '530300', '156-530000-530300-530325-', '富源县', '富源县', '', '', '', '530325', '655500', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530326', '530300', '156-530000-530300-530326-', '会泽县', '会泽县', '', '', '', '530326', '654200', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530328', '530300', '156-530000-530300-530328-', '沾益县', '沾益县', '', '', '', '530328', '655500', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530381', '530300', '156-530000-530300-530381-', '宣威市', '宣威市', '', '', '', '530381', '655400', '0874', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530400', '530000', '156-530000-530400-', '玉溪', '玉溪市', '', '', '', '530400', '653100', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530402', '530400', '156-530000-530400-530402-', '红塔区', '红塔区', '', '', '', '530402', '653100', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530421', '530400', '156-530000-530400-530421-', '江川县', '江川县', '', '', '', '530421', '652600', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530422', '530400', '156-530000-530400-530422-', '澄江县', '澄江县', '', '', '', '530422', '652500', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530423', '530400', '156-530000-530400-530423-', '通海县', '通海县', '', '', '', '530423', '652700', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530424', '530400', '156-530000-530400-530424-', '华宁县', '华宁县', '', '', '', '530424', '652800', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530425', '530400', '156-530000-530400-530425-', '易门县', '易门县', '', '', '', '530425', '651100', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530426', '530400', '156-530000-530400-530426-', '峨山彝族自治县', '峨山彝族自治县', '', '', '', '530426', '653200', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530427', '530400', '156-530000-530400-530427-', '新平彝族傣族自治县', '新平彝族傣族自治县', '', '', '', '530427', '653400', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530428', '530400', '156-530000-530400-530428-', '元江哈尼族彝族傣族自治县', '元江哈尼族彝族傣族自治县', '', '', '', '530428', '653300', '0877', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530500', '530000', '156-530000-530500-', '保山', '保山市', '', '', '', '530500', '678000', '0875', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530501', '530500', '156-530000-530500-530501-', '市辖区', '市辖区', '', '', '', '530501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530502', '530500', '156-530000-530500-530502-', '隆阳区', '隆阳区', '', '', '', '530502', '678000', '0875', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530521', '530500', '156-530000-530500-530521-', '施甸县', '施甸县', '', '', '', '530521', '678200', '0875', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530522', '530500', '156-530000-530500-530522-', '腾冲县', '腾冲县', '', '', '', '530522', '679100', '0875', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530523', '530500', '156-530000-530500-530523-', '龙陵县', '龙陵县', '', '', '', '530523', '678300', '0875', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530524', '530500', '156-530000-530500-530524-', '昌宁县', '昌宁县', '', '', '', '530524', '678100', '0875', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530600', '530000', '156-530000-530600-', '昭通', '昭通市', '', '', '', '530600', '657000', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530601', '530600', '156-530000-530600-530601-', '市辖区', '市辖区', '', '', '', '530601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530602', '530600', '156-530000-530600-530602-', '昭阳区', '昭阳区', '', '', '', '530602', '657000', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530621', '530600', '156-530000-530600-530621-', '鲁甸县', '鲁甸县', '', '', '', '530621', '657100', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530622', '530600', '156-530000-530600-530622-', '巧家县', '巧家县', '', '', '', '530622', '654600', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530623', '530600', '156-530000-530600-530623-', '盐津县', '盐津县', '', '', '', '530623', '657500', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530624', '530600', '156-530000-530600-530624-', '大关县', '大关县', '', '', '', '530624', '657400', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530625', '530600', '156-530000-530600-530625-', '永善县', '永善县', '', '', '', '530625', '657300', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530626', '530600', '156-530000-530600-530626-', '绥江县', '绥江县', '', '', '', '530626', '657700', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530627', '530600', '156-530000-530600-530627-', '镇雄县', '镇雄县', '', '', '', '530627', '657200', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530628', '530600', '156-530000-530600-530628-', '彝良县', '彝良县', '', '', '', '530628', '657600', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530629', '530600', '156-530000-530600-530629-', '威信县', '威信县', '', '', '', '530629', '657900', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530630', '530600', '156-530000-530600-530630-', '水富县', '水富县', '', '', '', '530630', '657800', '0870', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530700', '530000', '156-530000-530700-', '丽江', '丽江市', '', '', '', '530700', '674100', '0888', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530701', '530700', '156-530000-530700-530701-', '市辖区', '市辖区', '', '', '', '530701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530702', '530700', '156-530000-530700-530702-', '古城区', '古城区', '', '', '', '530702', '674100', '0888', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530721', '530700', '156-530000-530700-530721-', '玉龙纳西族自治县', '玉龙纳西族自治县', '', '', '', '530721', '674100', '0888', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530722', '530700', '156-530000-530700-530722-', '永胜县', '永胜县', '', '', '', '530722', '674200', '0888', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530723', '530700', '156-530000-530700-530723-', '华坪县', '华坪县', '', '', '', '530723', '674800', '0888', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530724', '530700', '156-530000-530700-530724-', '宁蒗彝族自治县', '宁蒗彝族自治县', '', '', '', '530724', '674300', '0888', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530800', '530000', '156-530000-530800-', '普洱', '普洱市', '', '', '', '530800', '665000', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530801', '530800', '156-530000-530800-530801-', '市辖区', '市辖区', '', '', '', '530801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530802', '530800', '156-530000-530800-530802-', '思茅区', '思茅区', '', '', '', '530802', '665000', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530821', '530800', '156-530000-530800-530821-', '宁洱县', '宁洱哈尼族彝族自治县', '', '', '', '530821', '665000', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530822', '530800', '156-530000-530800-530822-', '墨江哈尼族自治县', '墨江哈尼族自治县', '', '', '', '530822', '654800', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530823', '530800', '156-530000-530800-530823-', '景东彝族自治县', '景东彝族自治县', '', '', '', '530823', '676200', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530824', '530800', '156-530000-530800-530824-', '景谷傣族彝族自治县', '景谷傣族彝族自治县', '', '', '', '530824', '666400', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530825', '530800', '156-530000-530800-530825-', '镇沅彝族哈尼族拉祜族自治县', '镇沅彝族哈尼族拉祜族自治县', '', '', '', '530825', '666500', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530826', '530800', '156-530000-530800-530826-', '江城哈尼族彝族自治县', '江城哈尼族彝族自治县', '', '', '', '530826', '665900', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530827', '530800', '156-530000-530800-530827-', '孟连傣族拉祜族佤族自治县', '孟连傣族拉祜族佤族自治县', '', '', '', '530827', '665800', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530828', '530800', '156-530000-530800-530828-', '澜沧拉祜族自治县', '澜沧拉祜族自治县', '', '', '', '530828', '665600', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530829', '530800', '156-530000-530800-530829-', '西盟佤族自治县', '西盟佤族自治县', '', '', '', '530829', '665700', '0879', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530900', '530000', '156-530000-530900-', '临沧', '临沧市', '', '', '', '530900', '677000', '0883', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530901', '530900', '156-530000-530900-530901-', '市辖区', '市辖区', '', '', '', '530901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530902', '530900', '156-530000-530900-530902-', '临翔区', '临翔区', '', '', '', '530902', '677000', '0883', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530921', '530900', '156-530000-530900-530921-', '凤庆县', '凤庆县', '', '', '', '530921', '675900', '0883', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530922', '530900', '156-530000-530900-530922-', '云县', '云县', '', '', '', '530922', '675800', '0883', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530923', '530900', '156-530000-530900-530923-', '永德县', '永德县', '', '', '', '530923', '677600', '0883', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530924', '530900', '156-530000-530900-530924-', '镇康县', '镇康县', '', '', '', '530924', '677700', '0883', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530925', '530900', '156-530000-530900-530925-', '双江拉祜族佤族布朗族傣族自治县', '双江拉祜族佤族布朗族傣族自治县', '', '', '', '530925', '677300', '0883', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530926', '530900', '156-530000-530900-530926-', '耿马傣族佤族自治县', '耿马傣族佤族自治县', '', '', '', '530926', '677500', '0883', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('530927', '530900', '156-530000-530900-530927-', '沧源佤族自治县', '沧源佤族自治县', '', '', '', '530927', '677400', '0883', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532300', '530000', '156-530000-532300-', '楚雄州', '楚雄彝族自治州', '', '', '', '532300', '675000', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532301', '532300', '156-530000-532300-532301-', '楚雄市', '楚雄市', '', '', '', '532301', '675000', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532322', '532300', '156-530000-532300-532322-', '双柏县', '双柏县', '', '', '', '532322', '675100', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532323', '532300', '156-530000-532300-532323-', '牟定县', '牟定县', '', '', '', '532323', '675500', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532324', '532300', '156-530000-532300-532324-', '南华县', '南华县', '', '', '', '532324', '675200', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532325', '532300', '156-530000-532300-532325-', '姚安县', '姚安县', '', '', '', '532325', '675300', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532326', '532300', '156-530000-532300-532326-', '大姚县', '大姚县', '', '', '', '532326', '675400', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532327', '532300', '156-530000-532300-532327-', '永仁县', '永仁县', '', '', '', '532327', '651400', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532328', '532300', '156-530000-532300-532328-', '元谋县', '元谋县', '', '', '', '532328', '651300', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532329', '532300', '156-530000-532300-532329-', '武定县', '武定县', '', '', '', '532329', '651600', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532331', '532300', '156-530000-532300-532331-', '禄丰县', '禄丰县', '', '', '', '532331', '651200', '0878', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532500', '530000', '156-530000-532500-', '红河州', '红河哈尼族彝族自治州', '', '', '', '532500', '661400', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532501', '532500', '156-530000-532500-532501-', '个旧市', '个旧市', '', '', '', '532501', '661000', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532502', '532500', '156-530000-532500-532502-', '开远市', '开远市', '', '', '', '532502', '661600', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532503', '532500', '156-530000-532500-532503-', '蒙自市', '蒙自市', '', '', '', '532503', '661100', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532523', '532500', '156-530000-532500-532523-', '屏边苗族自治县', '屏边苗族自治县', '', '', '', '532523', '661200', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532524', '532500', '156-530000-532500-532524-', '建水县', '建水县', '', '', '', '532524', '654300', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532525', '532500', '156-530000-532500-532525-', '石屏县', '石屏县', '', '', '', '532525', '662200', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532526', '532500', '156-530000-532500-532526-', '弥勒县', '弥勒县', '', '', '', '532526', '652300', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532527', '532500', '156-530000-532500-532527-', '泸西县', '泸西县', '', '', '', '532527', '652400', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532528', '532500', '156-530000-532500-532528-', '元阳县', '元阳县', '', '', '', '532528', '662400', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532529', '532500', '156-530000-532500-532529-', '红河县', '红河县', '', '', '', '532529', '654400', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532530', '532500', '156-530000-532500-532530-', '金平苗族瑶族傣族自治县', '金平苗族瑶族傣族自治县', '', '', '', '532530', '661500', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532531', '532500', '156-530000-532500-532531-', '绿春县', '绿春县', '', '', '', '532531', '662500', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532532', '532500', '156-530000-532500-532532-', '河口瑶族自治县', '河口瑶族自治县', '', '', '', '532532', '661300', '0873', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532600', '530000', '156-530000-532600-', '文山州', '文山壮族苗族自治州', '', '', '', '532600', '663000', '0876', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532601', '532600', '156-530000-532600-532601-', '文山市', '文山市', '', '', '', '532601', '663000', '0876', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532622', '532600', '156-530000-532600-532622-', '砚山县', '砚山县', '', '', '', '532622', '663100', '0876', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532623', '532600', '156-530000-532600-532623-', '西畴县', '西畴县', '', '', '', '532623', '663500', '0876', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532624', '532600', '156-530000-532600-532624-', '麻栗坡县', '麻栗坡县', '', '', '', '532624', '663600', '0876', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532625', '532600', '156-530000-532600-532625-', '马关县', '马关县', '', '', '', '532625', '663700', '0876', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532626', '532600', '156-530000-532600-532626-', '丘北县', '丘北县', '', '', '', '532626', '663200', '0876', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532627', '532600', '156-530000-532600-532627-', '广南县', '广南县', '', '', '', '532627', '663300', '0876', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532628', '532600', '156-530000-532600-532628-', '富宁县', '富宁县', '', '', '', '532628', '663400', '0876', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532800', '530000', '156-530000-532800-', '西双版纳州', '西双版纳傣族自治州', '', '', '', '532800', '666100', '0691', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532801', '532800', '156-530000-532800-532801-', '景洪市', '景洪市', '', '', '', '532801', '666100', '0691', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532822', '532800', '156-530000-532800-532822-', '勐海县', '勐海县', '', '', '', '532822', '666200', '0691', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532823', '532800', '156-530000-532800-532823-', '勐腊县', '勐腊县', '', '', '', '532823', '666300', '0691', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532900', '530000', '156-530000-532900-', '大理州', '大理白族自治州', '', '', '', '532900', '671000', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532901', '532900', '156-530000-532900-532901-', '大理市', '大理市', '', '', '', '532901', '671000', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532922', '532900', '156-530000-532900-532922-', '漾濞彝族自治县', '漾濞彝族自治县', '', '', '', '532922', '672500', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532923', '532900', '156-530000-532900-532923-', '祥云县', '祥云县', '', '', '', '532923', '672100', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532924', '532900', '156-530000-532900-532924-', '宾川县', '宾川县', '', '', '', '532924', '671600', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532925', '532900', '156-530000-532900-532925-', '弥渡县', '弥渡县', '', '', '', '532925', '675600', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532926', '532900', '156-530000-532900-532926-', '南涧彝族自治县', '南涧彝族自治县', '', '', '', '532926', '675700', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532927', '532900', '156-530000-532900-532927-', '巍山彝族回族自治县', '巍山彝族回族自治县', '', '', '', '532927', '672400', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532928', '532900', '156-530000-532900-532928-', '永平县', '永平县', '', '', '', '532928', '672600', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532929', '532900', '156-530000-532900-532929-', '云龙县', '云龙县', '', '', '', '532929', '672700', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532930', '532900', '156-530000-532900-532930-', '洱源县', '洱源县', '', '', '', '532930', '671200', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532931', '532900', '156-530000-532900-532931-', '剑川县', '剑川县', '', '', '', '532931', '671300', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('532932', '532900', '156-530000-532900-532932-', '鹤庆县', '鹤庆县', '', '', '', '532932', '671500', '0872', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533100', '530000', '156-530000-533100-', '德宏州', '德宏傣族景颇族自治州', '', '', '', '533100', '678400', '0692', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533102', '533100', '156-530000-533100-533102-', '瑞丽市', '瑞丽市', '', '', '', '533102', '678600', '0692', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533103', '533100', '156-530000-533100-533103-', '芒市', '芒市', '', '', '', '533103', '0', '0692', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533122', '533100', '156-530000-533100-533122-', '梁河县', '梁河县', '', '', '', '533122', '679200', '0692', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533123', '533100', '156-530000-533100-533123-', '盈江县', '盈江县', '', '', '', '533123', '679300', '0692', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533124', '533100', '156-530000-533100-533124-', '陇川县', '陇川县', '', '', '', '533124', '678700', '0692', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533300', '530000', '156-530000-533300-', '怒江州', '怒江傈僳族自治州', '', '', '', '533300', '673100', '0886', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533321', '533300', '156-530000-533300-533321-', '泸水县', '泸水县', '', '', '', '533321', '673200', '0886', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533323', '533300', '156-530000-533300-533323-', '福贡县', '福贡县', '', '', '', '533323', '673400', '0886', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533324', '533300', '156-530000-533300-533324-', '贡山独龙族怒族自治县', '贡山独龙族怒族自治县', '', '', '', '533324', '673500', '0886', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533325', '533300', '156-530000-533300-533325-', '兰坪白族普米族自治县', '兰坪白族普米族自治县', '', '', '', '533325', '671400', '0886', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533400', '530000', '156-530000-533400-', '迪庆州', '迪庆藏族自治州', '', '', '', '533400', '674400', '0887', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533421', '533400', '156-530000-533400-533421-', '香格里拉县', '香格里拉县', '', '', '', '533421', '674400', '0887', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533422', '533400', '156-530000-533400-533422-', '德钦县', '德钦县', '', '', '', '533422', '674500', '0887', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('533423', '533400', '156-530000-533400-533423-', '维西傈僳族自治县', '维西傈僳族自治县', '', '', '', '533423', '674600', '0887', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540000', '156', '156-540000-', '西藏', '西藏自治区', 'XiZang', 'XiZang', 'XZ', '540000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540100', '540000', '156-540000-540100-', '拉萨', '拉萨市', '', '', '', '540100', '850000', '0891', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540101', '540100', '156-540000-540100-540101-', '市辖区', '市辖区', '', '', '', '540101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540102', '540100', '156-540000-540100-540102-', '城关区', '城关区', '', '', '', '540102', '850000', '0891', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540121', '540100', '156-540000-540100-540121-', '林周县', '林周县', '', '', '', '540121', '851600', '0891', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540122', '540100', '156-540000-540100-540122-', '当雄县', '当雄县', '', '', '', '540122', '851500', '0891', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540123', '540100', '156-540000-540100-540123-', '尼木县', '尼木县', '', '', '', '540123', '851600', '0891', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540124', '540100', '156-540000-540100-540124-', '曲水县', '曲水县', '', '', '', '540124', '850600', '0891', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540125', '540100', '156-540000-540100-540125-', '堆龙德庆县', '堆龙德庆县', '', '', '', '540125', '851400', '0891', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540126', '540100', '156-540000-540100-540126-', '达孜县', '达孜县', '', '', '', '540126', '850100', '0891', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('540127', '540100', '156-540000-540100-540127-', '墨竹工卡县', '墨竹工卡县', '', '', '', '540127', '850200', '0891', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542100', '540000', '156-540000-542100-', '昌都', '昌都地区', '', '', '', '542100', '854000', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542121', '542100', '156-540000-542100-542121-', '昌都县', '昌都县', '', '', '', '542121', '854000', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542122', '542100', '156-540000-542100-542122-', '江达县', '江达县', '', '', '', '542122', '854100', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542123', '542100', '156-540000-542100-542123-', '贡觉县', '贡觉县', '', '', '', '542123', '854200', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542124', '542100', '156-540000-542100-542124-', '类乌齐县', '类乌齐县', '', '', '', '542124', '855600', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542125', '542100', '156-540000-542100-542125-', '丁青县', '丁青县', '', '', '', '542125', '855700', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542126', '542100', '156-540000-542100-542126-', '察雅县', '察雅县', '', '', '', '542126', '854300', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542127', '542100', '156-540000-542100-542127-', '八宿县', '八宿县', '', '', '', '542127', '854600', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542128', '542100', '156-540000-542100-542128-', '左贡县', '左贡县', '', '', '', '542128', '854400', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542129', '542100', '156-540000-542100-542129-', '芒康县', '芒康县', '', '', '', '542129', '854500', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542132', '542100', '156-540000-542100-542132-', '洛隆县', '洛隆县', '', '', '', '542132', '855400', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542133', '542100', '156-540000-542100-542133-', '边坝县', '边坝县', '', '', '', '542133', '855500', '0895', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542200', '540000', '156-540000-542200-', '山南', '山南地区', '', '', '', '542200', '856000', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542221', '542200', '156-540000-542200-542221-', '乃东县', '乃东县', '', '', '', '542221', '856100', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542222', '542200', '156-540000-542200-542222-', '扎囊县', '扎囊县', '', '', '', '542222', '850800', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542223', '542200', '156-540000-542200-542223-', '贡嘎县', '贡嘎县', '', '', '', '542223', '850700', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542224', '542200', '156-540000-542200-542224-', '桑日县', '桑日县', '', '', '', '542224', '856200', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542225', '542200', '156-540000-542200-542225-', '琼结县', '琼结县', '', '', '', '542225', '856800', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542226', '542200', '156-540000-542200-542226-', '曲松县', '曲松县', '', '', '', '542226', '856300', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542227', '542200', '156-540000-542200-542227-', '措美县', '措美县', '', '', '', '542227', '856900', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542228', '542200', '156-540000-542200-542228-', '洛扎县', '洛扎县', '', '', '', '542228', '851200', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542229', '542200', '156-540000-542200-542229-', '加查县', '加查县', '', '', '', '542229', '856400', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542231', '542200', '156-540000-542200-542231-', '隆子县', '隆子县', '', '', '', '542231', '856600', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542232', '542200', '156-540000-542200-542232-', '错那县', '错那县', '', '', '', '542232', '856700', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542233', '542200', '156-540000-542200-542233-', '浪卡子县', '浪卡子县', '', '', '', '542233', '851100', '0893', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542300', '540000', '156-540000-542300-', '日喀则', '日喀则地区', '', '', '', '542300', '857000', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542301', '542300', '156-540000-542300-542301-', '日喀则市', '日喀则市', '', '', '', '542301', '857000', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542322', '542300', '156-540000-542300-542322-', '南木林县', '南木林县', '', '', '', '542322', '857100', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542323', '542300', '156-540000-542300-542323-', '江孜县', '江孜县', '', '', '', '542323', '857400', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542324', '542300', '156-540000-542300-542324-', '定日县', '定日县', '', '', '', '542324', '858200', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542325', '542300', '156-540000-542300-542325-', '萨迦县', '萨迦县', '', '', '', '542325', '857800', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542326', '542300', '156-540000-542300-542326-', '拉孜县', '拉孜县', '', '', '', '542326', '858100', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542327', '542300', '156-540000-542300-542327-', '昂仁县', '昂仁县', '', '', '', '542327', '858500', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542328', '542300', '156-540000-542300-542328-', '谢通门县', '谢通门县', '', '', '', '542328', '858900', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542329', '542300', '156-540000-542300-542329-', '白朗县', '白朗县', '', '', '', '542329', '857300', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542330', '542300', '156-540000-542300-542330-', '仁布县', '仁布县', '', '', '', '542330', '857200', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542331', '542300', '156-540000-542300-542331-', '康马县', '康马县', '', '', '', '542331', '857500', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542332', '542300', '156-540000-542300-542332-', '定结县', '定结县', '', '', '', '542332', '857900', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542333', '542300', '156-540000-542300-542333-', '仲巴县', '仲巴县', '', '', '', '542333', '858800', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542334', '542300', '156-540000-542300-542334-', '亚东县', '亚东县', '', '', '', '542334', '857600', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542335', '542300', '156-540000-542300-542335-', '吉隆县', '吉隆县', '', '', '', '542335', '858700', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542336', '542300', '156-540000-542300-542336-', '聂拉木县', '聂拉木县', '', '', '', '542336', '858300', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542337', '542300', '156-540000-542300-542337-', '萨嘎县', '萨嘎县', '', '', '', '542337', '858600', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542338', '542300', '156-540000-542300-542338-', '岗巴县', '岗巴县', '', '', '', '542338', '857700', '0892', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542400', '540000', '156-540000-542400-', '那曲', '那曲地区', '', '', '', '542400', '852000', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542421', '542400', '156-540000-542400-542421-', '那曲县', '那曲县', '', '', '', '542421', '852000', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542422', '542400', '156-540000-542400-542422-', '嘉黎县', '嘉黎县', '', '', '', '542422', '852400', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542423', '542400', '156-540000-542400-542423-', '比如县', '比如县', '', '', '', '542423', '852300', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542424', '542400', '156-540000-542400-542424-', '聂荣县', '聂荣县', '', '', '', '542424', '853500', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542425', '542400', '156-540000-542400-542425-', '安多县', '安多县', '', '', '', '542425', '853400', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542426', '542400', '156-540000-542400-542426-', '申扎县', '申扎县', '', '', '', '542426', '853100', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542427', '542400', '156-540000-542400-542427-', '索县', '索县', '', '', '', '542427', '852200', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542428', '542400', '156-540000-542400-542428-', '班戈县', '班戈县', '', '', '', '542428', '852500', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542429', '542400', '156-540000-542400-542429-', '巴青县', '巴青县', '', '', '', '542429', '852100', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542430', '542400', '156-540000-542400-542430-', '尼玛县', '尼玛县', '', '', '', '542430', '853200', '0896', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542500', '540000', '156-540000-542500-', '阿里', '阿里地区', '', '', '', '542500', '859000', '0897', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542521', '542500', '156-540000-542500-542521-', '普兰县', '普兰县', '', '', '', '542521', '859500', '0897', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542522', '542500', '156-540000-542500-542522-', '札达县', '札达县', '', '', '', '542522', '859600', '0897', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542523', '542500', '156-540000-542500-542523-', '噶尔县', '噶尔县', '', '', '', '542523', '859000', '0897', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542524', '542500', '156-540000-542500-542524-', '日土县', '日土县', '', '', '', '542524', '859700', '0897', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542525', '542500', '156-540000-542500-542525-', '革吉县', '革吉县', '', '', '', '542525', '859100', '0897', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542526', '542500', '156-540000-542500-542526-', '改则县', '改则县', '', '', '', '542526', '859200', '0897', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542527', '542500', '156-540000-542500-542527-', '措勤县', '措勤县', '', '', '', '542527', '859300', '0897', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542600', '540000', '156-540000-542600-', '林芝', '林芝地区', '', '', '', '542600', '860000', '0894', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542621', '542600', '156-540000-542600-542621-', '林芝县', '林芝县', '', '', '', '542621', '860100', '0894', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542622', '542600', '156-540000-542600-542622-', '工布江达县', '工布江达县', '', '', '', '542622', '860200', '0894', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542623', '542600', '156-540000-542600-542623-', '米林县', '米林县', '', '', '', '542623', '860500', '0894', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542624', '542600', '156-540000-542600-542624-', '墨脱县', '墨脱县', '', '', '', '542624', '860700', '0894', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542625', '542600', '156-540000-542600-542625-', '波密县', '波密县', '', '', '', '542625', '860300', '0894', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542626', '542600', '156-540000-542600-542626-', '察隅县', '察隅县', '', '', '', '542626', '860600', '0894', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('542627', '542600', '156-540000-542600-542627-', '朗县', '朗县', '', '', '', '542627', '860400', '0894', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610000', '156', '156-610000-', '陕西', '陕西省', 'ShanXi', 'ShanXi', 'SN', '610000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610100', '610000', '156-610000-610100-', '西安', '西安市', '', '', '', '610100', '710000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610101', '610100', '156-610000-610100-610101-', '市辖区', '市辖区', '', '', '', '610101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610102', '610100', '156-610000-610100-610102-', '新城区', '新城区', '', '', '', '610102', '710000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610103', '610100', '156-610000-610100-610103-', '碑林区', '碑林区', '', '', '', '610103', '710000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610104', '610100', '156-610000-610100-610104-', '莲湖区', '莲湖区', '', '', '', '610104', '710000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610111', '610100', '156-610000-610100-610111-', '灞桥区', '灞桥区', '', '', '', '610111', '710000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610112', '610100', '156-610000-610100-610112-', '未央区', '未央区', '', '', '', '610112', '710000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610113', '610100', '156-610000-610100-610113-', '雁塔区', '雁塔区', '', '', '', '610113', '710000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610114', '610100', '156-610000-610100-610114-', '阎良区', '阎良区', '', '', '', '610114', '710000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610115', '610100', '156-610000-610100-610115-', '临潼区', '临潼区', '', '', '', '610115', '710600', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610116', '610100', '156-610000-610100-610116-', '长安区', '长安区', '', '', '', '610116', '710100', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610122', '610100', '156-610000-610100-610122-', '蓝田县', '蓝田县', '', '', '', '610122', '710500', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610124', '610100', '156-610000-610100-610124-', '周至县', '周至县', '', '', '', '610124', '710400', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610125', '610100', '156-610000-610100-610125-', '户县', '户县', '', '', '', '610125', '710300', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610126', '610100', '156-610000-610100-610126-', '高陵县', '高陵县', '', '', '', '610126', '710200', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610200', '610000', '156-610000-610200-', '铜川', '铜川市', '', '', '', '610200', '727000', '0919', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610201', '610200', '156-610000-610200-610201-', '市辖区', '市辖区', '', '', '', '610201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610202', '610200', '156-610000-610200-610202-', '王益区', '王益区', '', '', '', '610202', '727000', '0919', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610203', '610200', '156-610000-610200-610203-', '印台区', '印台区', '', '', '', '610203', '727007', '0919', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610204', '610200', '156-610000-610200-610204-', '耀州区', '耀州区', '', '', '', '610204', '727100', '0919', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610222', '610200', '156-610000-610200-610222-', '宜君县', '宜君县', '', '', '', '610222', '727200', '0919', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610300', '610000', '156-610000-610300-', '宝鸡', '宝鸡市', '', '', '', '610300', '721000', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610301', '610300', '156-610000-610300-610301-', '市辖区', '市辖区', '', '', '', '610301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610302', '610300', '156-610000-610300-610302-', '渭滨区', '渭滨区', '', '', '', '610302', '721000', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610303', '610300', '156-610000-610300-610303-', '金台区', '金台区', '', '', '', '610303', '721000', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610304', '610300', '156-610000-610300-610304-', '陈仓区', '陈仓区', '', '', '', '610304', '721300', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610322', '610300', '156-610000-610300-610322-', '凤翔县', '凤翔县', '', '', '', '610322', '721400', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610323', '610300', '156-610000-610300-610323-', '岐山县', '岐山县', '', '', '', '610323', '722400', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610324', '610300', '156-610000-610300-610324-', '扶风县', '扶风县', '', '', '', '610324', '722200', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610326', '610300', '156-610000-610300-610326-', '眉县', '眉县', '', '', '', '610326', '722300', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610327', '610300', '156-610000-610300-610327-', '陇县', '陇县', '', '', '', '610327', '721200', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610328', '610300', '156-610000-610300-610328-', '千阳县', '千阳县', '', '', '', '610328', '721100', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610329', '610300', '156-610000-610300-610329-', '麟游县', '麟游县', '', '', '', '610329', '721500', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610330', '610300', '156-610000-610300-610330-', '凤县', '凤县', '', '', '', '610330', '721700', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610331', '610300', '156-610000-610300-610331-', '太白县', '太白县', '', '', '', '610331', '721600', '0917', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610400', '610000', '156-610000-610400-', '咸阳', '咸阳市', '', '', '', '610400', '712000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610401', '610400', '156-610000-610400-610401-', '市辖区', '市辖区', '', '', '', '610401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610402', '610400', '156-610000-610400-610402-', '秦都区', '秦都区', '', '', '', '610402', '712000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610403', '610400', '156-610000-610400-610403-', '杨陵区', '杨陵区', '', '', '', '610403', '712100', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610404', '610400', '156-610000-610400-610404-', '渭城区', '渭城区', '', '', '', '610404', '712000', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610422', '610400', '156-610000-610400-610422-', '三原县', '三原县', '', '', '', '610422', '713800', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610423', '610400', '156-610000-610400-610423-', '泾阳县', '泾阳县', '', '', '', '610423', '713700', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610424', '610400', '156-610000-610400-610424-', '乾县', '乾县', '', '', '', '610424', '713300', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610425', '610400', '156-610000-610400-610425-', '礼泉县', '礼泉县', '', '', '', '610425', '713200', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610426', '610400', '156-610000-610400-610426-', '永寿县', '永寿县', '', '', '', '610426', '713400', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610427', '610400', '156-610000-610400-610427-', '彬县', '彬县', '', '', '', '610427', '713500', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610428', '610400', '156-610000-610400-610428-', '长武县', '长武县', '', '', '', '610428', '713600', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610429', '610400', '156-610000-610400-610429-', '旬邑县', '旬邑县', '', '', '', '610429', '711300', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610430', '610400', '156-610000-610400-610430-', '淳化县', '淳化县', '', '', '', '610430', '711200', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610431', '610400', '156-610000-610400-610431-', '武功县', '武功县', '', '', '', '610431', '712200', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610481', '610400', '156-610000-610400-610481-', '兴平市', '兴平市', '', '', '', '610481', '713100', '029', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610500', '610000', '156-610000-610500-', '渭南', '渭南市', '', '', '', '610500', '714000', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610501', '610500', '156-610000-610500-610501-', '市辖区', '市辖区', '', '', '', '610501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610502', '610500', '156-610000-610500-610502-', '临渭区', '临渭区', '', '', '', '610502', '714000', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610521', '610500', '156-610000-610500-610521-', '华县', '华县', '', '', '', '610521', '714100', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610522', '610500', '156-610000-610500-610522-', '潼关县', '潼关县', '', '', '', '610522', '714300', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610523', '610500', '156-610000-610500-610523-', '大荔县', '大荔县', '', '', '', '610523', '715100', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610524', '610500', '156-610000-610500-610524-', '合阳县', '合阳县', '', '', '', '610524', '715300', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610525', '610500', '156-610000-610500-610525-', '澄城县', '澄城县', '', '', '', '610525', '715200', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610526', '610500', '156-610000-610500-610526-', '蒲城县', '蒲城县', '', '', '', '610526', '715500', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610527', '610500', '156-610000-610500-610527-', '白水县', '白水县', '', '', '', '610527', '715600', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610528', '610500', '156-610000-610500-610528-', '富平县', '富平县', '', '', '', '610528', '711700', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610581', '610500', '156-610000-610500-610581-', '韩城市', '韩城市', '', '', '', '610581', '715400', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610582', '610500', '156-610000-610500-610582-', '华阴市', '华阴市', '', '', '', '610582', '714200', '0913', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610600', '610000', '156-610000-610600-', '延安', '延安市', '', '', '', '610600', '716000', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610601', '610600', '156-610000-610600-610601-', '市辖区', '市辖区', '', '', '', '610601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610602', '610600', '156-610000-610600-610602-', '宝塔区', '宝塔区', '', '', '', '610602', '716000', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610621', '610600', '156-610000-610600-610621-', '延长县', '延长县', '', '', '', '610621', '717100', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610622', '610600', '156-610000-610600-610622-', '延川县', '延川县', '', '', '', '610622', '717200', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610623', '610600', '156-610000-610600-610623-', '子长县', '子长县', '', '', '', '610623', '717300', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610624', '610600', '156-610000-610600-610624-', '安塞县', '安塞县', '', '', '', '610624', '717400', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610625', '610600', '156-610000-610600-610625-', '志丹县', '志丹县', '', '', '', '610625', '717500', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610626', '610600', '156-610000-610600-610626-', '吴起县', '吴起县', '', '', '', '610626', '717600', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610627', '610600', '156-610000-610600-610627-', '甘泉县', '甘泉县', '', '', '', '610627', '716100', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610628', '610600', '156-610000-610600-610628-', '富县', '富县', '', '', '', '610628', '727500', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610629', '610600', '156-610000-610600-610629-', '洛川县', '洛川县', '', '', '', '610629', '727400', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610630', '610600', '156-610000-610600-610630-', '宜川县', '宜川县', '', '', '', '610630', '716200', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610631', '610600', '156-610000-610600-610631-', '黄龙县', '黄龙县', '', '', '', '610631', '715700', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610632', '610600', '156-610000-610600-610632-', '黄陵县', '黄陵县', '', '', '', '610632', '727300', '0911', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610700', '610000', '156-610000-610700-', '汉中', '汉中市', '', '', '', '610700', '723000', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610701', '610700', '156-610000-610700-610701-', '市辖区', '市辖区', '', '', '', '610701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610702', '610700', '156-610000-610700-610702-', '汉台区', '汉台区', '', '', '', '610702', '723000', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610721', '610700', '156-610000-610700-610721-', '南郑县', '南郑县', '', '', '', '610721', '723100', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610722', '610700', '156-610000-610700-610722-', '城固县', '城固县', '', '', '', '610722', '723200', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610723', '610700', '156-610000-610700-610723-', '洋县', '洋县', '', '', '', '610723', '723300', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610724', '610700', '156-610000-610700-610724-', '西乡县', '西乡县', '', '', '', '610724', '723500', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610725', '610700', '156-610000-610700-610725-', '勉县', '勉县', '', '', '', '610725', '724200', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610726', '610700', '156-610000-610700-610726-', '宁强县', '宁强县', '', '', '', '610726', '724400', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610727', '610700', '156-610000-610700-610727-', '略阳县', '略阳县', '', '', '', '610727', '724300', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610728', '610700', '156-610000-610700-610728-', '镇巴县', '镇巴县', '', '', '', '610728', '723600', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610729', '610700', '156-610000-610700-610729-', '留坝县', '留坝县', '', '', '', '610729', '724100', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610730', '610700', '156-610000-610700-610730-', '佛坪县', '佛坪县', '', '', '', '610730', '723400', '0916', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610800', '610000', '156-610000-610800-', '榆林', '榆林市', '', '', '', '610800', '719000', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610801', '610800', '156-610000-610800-610801-', '市辖区', '市辖区', '', '', '', '610801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610802', '610800', '156-610000-610800-610802-', '榆阳区', '榆阳区', '', '', '', '610802', '719000', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610821', '610800', '156-610000-610800-610821-', '神木县', '神木县', '', '', '', '610821', '719300', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610822', '610800', '156-610000-610800-610822-', '府谷县', '府谷县', '', '', '', '610822', '719400', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610823', '610800', '156-610000-610800-610823-', '横山县', '横山县', '', '', '', '610823', '719200', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610824', '610800', '156-610000-610800-610824-', '靖边县', '靖边县', '', '', '', '610824', '718500', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610825', '610800', '156-610000-610800-610825-', '定边县', '定边县', '', '', '', '610825', '718600', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610826', '610800', '156-610000-610800-610826-', '绥德县', '绥德县', '', '', '', '610826', '718000', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610827', '610800', '156-610000-610800-610827-', '米脂县', '米脂县', '', '', '', '610827', '718100', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610828', '610800', '156-610000-610800-610828-', '佳县', '佳县', '', '', '', '610828', '719200', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610829', '610800', '156-610000-610800-610829-', '吴堡县', '吴堡县', '', '', '', '610829', '718200', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610830', '610800', '156-610000-610800-610830-', '清涧县', '清涧县', '', '', '', '610830', '718300', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610831', '610800', '156-610000-610800-610831-', '子洲县', '子洲县', '', '', '', '610831', '718400', '0912', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610900', '610000', '156-610000-610900-', '安康', '安康市', '', '', '', '610900', '725000', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610901', '610900', '156-610000-610900-610901-', '市辖区', '市辖区', '', '', '', '610901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610902', '610900', '156-610000-610900-610902-', '汉滨区', '汉滨区', '', '', '', '610902', '725000', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610921', '610900', '156-610000-610900-610921-', '汉阴县', '汉阴县', '', '', '', '610921', '725100', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610922', '610900', '156-610000-610900-610922-', '石泉县', '石泉县', '', '', '', '610922', '725200', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610923', '610900', '156-610000-610900-610923-', '宁陕县', '宁陕县', '', '', '', '610923', '711600', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610924', '610900', '156-610000-610900-610924-', '紫阳县', '紫阳县', '', '', '', '610924', '725300', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610925', '610900', '156-610000-610900-610925-', '岚皋县', '岚皋县', '', '', '', '610925', '725400', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610926', '610900', '156-610000-610900-610926-', '平利县', '平利县', '', '', '', '610926', '725500', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610927', '610900', '156-610000-610900-610927-', '镇坪县', '镇坪县', '', '', '', '610927', '725600', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610928', '610900', '156-610000-610900-610928-', '旬阳县', '旬阳县', '', '', '', '610928', '725700', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('610929', '610900', '156-610000-610900-610929-', '白河县', '白河县', '', '', '', '610929', '725800', '0915', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('611000', '610000', '156-610000-611000-', '商洛', '商洛市', '', '', '', '611000', '726000', '0914', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('611001', '611000', '156-610000-611000-611001-', '市辖区', '市辖区', '', '', '', '611001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('611002', '611000', '156-610000-611000-611002-', '商州区', '商州区', '', '', '', '611002', '726000', '0914', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('611021', '611000', '156-610000-611000-611021-', '洛南县', '洛南县', '', '', '', '611021', '726100', '0914', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('611022', '611000', '156-610000-611000-611022-', '丹凤县', '丹凤县', '', '', '', '611022', '726200', '0914', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('611023', '611000', '156-610000-611000-611023-', '商南县', '商南县', '', '', '', '611023', '726300', '0914', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('611024', '611000', '156-610000-611000-611024-', '山阳县', '山阳县', '', '', '', '611024', '726400', '0914', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('611025', '611000', '156-610000-611000-611025-', '镇安县', '镇安县', '', '', '', '611025', '711500', '0914', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('611026', '611000', '156-610000-611000-611026-', '柞水县', '柞水县', '', '', '', '611026', '711400', '0914', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620000', '156', '156-620000-', '甘肃', '甘肃省', 'GanSu', 'GanSu', 'GS', '620000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620100', '620000', '156-620000-620100-', '兰州', '兰州市', '', '', '', '620100', '730000', '0931', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620101', '620100', '156-620000-620100-620101-', '市辖区', '市辖区', '', '', '', '620101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620102', '620100', '156-620000-620100-620102-', '城关区', '城关区', '', '', '', '620102', '730030', '0931', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620103', '620100', '156-620000-620100-620103-', '七里河区', '七里河区', '', '', '', '620103', '730050', '0931', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620104', '620100', '156-620000-620100-620104-', '西固区', '西固区', '', '', '', '620104', '730060', '0931', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620105', '620100', '156-620000-620100-620105-', '安宁区', '安宁区', '', '', '', '620105', '730070', '0931', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620111', '620100', '156-620000-620100-620111-', '红古区', '红古区', '', '', '', '620111', '730080', '0931', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620121', '620100', '156-620000-620100-620121-', '永登县', '永登县', '', '', '', '620121', '730300', '0931', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620122', '620100', '156-620000-620100-620122-', '皋兰县', '皋兰县', '', '', '', '620122', '730200', '0931', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620123', '620100', '156-620000-620100-620123-', '榆中县', '榆中县', '', '', '', '620123', '730100', '0931', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620200', '620000', '156-620000-620200-', '嘉峪关', '嘉峪关市', '', '', '', '620200', '735100', '0937', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620201', '620200', '156-620000-620200-620201-', '市辖区', '市辖区', '', '', '', '620201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620300', '620000', '156-620000-620300-', '金昌', '金昌市', '', '', '', '620300', '737100', '0935', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620301', '620300', '156-620000-620300-620301-', '市辖区', '市辖区', '', '', '', '620301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620302', '620300', '156-620000-620300-620302-', '金川区', '金川区', '', '', '', '620302', '737100', '0935', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620321', '620300', '156-620000-620300-620321-', '永昌县', '永昌县', '', '', '', '620321', '737200', '0935', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620400', '620000', '156-620000-620400-', '白银', '白银市', '', '', '', '620400', '730900', '0943', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620401', '620400', '156-620000-620400-620401-', '市辖区', '市辖区', '', '', '', '620401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620402', '620400', '156-620000-620400-620402-', '白银区', '白银区', '', '', '', '620402', '730900', '0943', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620403', '620400', '156-620000-620400-620403-', '平川区', '平川区', '', '', '', '620403', '730900', '0943', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620421', '620400', '156-620000-620400-620421-', '靖远县', '靖远县', '', '', '', '620421', '730600', '0943', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620422', '620400', '156-620000-620400-620422-', '会宁县', '会宁县', '', '', '', '620422', '730700', '0943', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620423', '620400', '156-620000-620400-620423-', '景泰县', '景泰县', '', '', '', '620423', '730400', '0943', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620500', '620000', '156-620000-620500-', '天水', '天水市', '', '', '', '620500', '741000', '0938', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620501', '620500', '156-620000-620500-620501-', '市辖区', '市辖区', '', '', '', '620501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620502', '620500', '156-620000-620500-620502-', '秦州区', '秦州区', '', '', '', '620502', '741000', '0938', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620503', '620500', '156-620000-620500-620503-', '麦积区', '麦积区', '', '', '', '620503', '741020', '0938', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620521', '620500', '156-620000-620500-620521-', '清水县', '清水县', '', '', '', '620521', '741400', '0938', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620522', '620500', '156-620000-620500-620522-', '秦安县', '秦安县', '', '', '', '620522', '741600', '0938', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620523', '620500', '156-620000-620500-620523-', '甘谷县', '甘谷县', '', '', '', '620523', '741200', '0938', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620524', '620500', '156-620000-620500-620524-', '武山县', '武山县', '', '', '', '620524', '741300', '0938', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620525', '620500', '156-620000-620500-620525-', '张家川回族自治县', '张家川回族自治县', '', '', '', '620525', '741500', '0938', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620600', '620000', '156-620000-620600-', '武威', '武威市', '', '', '', '620600', '733000', '0935', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620601', '620600', '156-620000-620600-620601-', '市辖区', '市辖区', '', '', '', '620601', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620602', '620600', '156-620000-620600-620602-', '凉州区', '凉州区', '', '', '', '620602', '733000', '0935', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620621', '620600', '156-620000-620600-620621-', '民勤县', '民勤县', '', '', '', '620621', '733300', '0935', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620622', '620600', '156-620000-620600-620622-', '古浪县', '古浪县', '', '', '', '620622', '733100', '0935', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620623', '620600', '156-620000-620600-620623-', '天祝藏族自治县', '天祝藏族自治县', '', '', '', '620623', '733200', '0935', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620700', '620000', '156-620000-620700-', '张掖', '张掖市', '', '', '', '620700', '734000', '0936', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620701', '620700', '156-620000-620700-620701-', '市辖区', '市辖区', '', '', '', '620701', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620702', '620700', '156-620000-620700-620702-', '甘州区', '甘州区', '', '', '', '620702', '734000', '0936', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620721', '620700', '156-620000-620700-620721-', '肃南裕固族自治县', '肃南裕固族自治县', '', '', '', '620721', '734400', '0936', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620722', '620700', '156-620000-620700-620722-', '民乐县', '民乐县', '', '', '', '620722', '734500', '0936', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620723', '620700', '156-620000-620700-620723-', '临泽县', '临泽县', '', '', '', '620723', '734200', '0936', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620724', '620700', '156-620000-620700-620724-', '高台县', '高台县', '', '', '', '620724', '734300', '0936', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620725', '620700', '156-620000-620700-620725-', '山丹县', '山丹县', '', '', '', '620725', '734100', '0936', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620800', '620000', '156-620000-620800-', '平凉', '平凉市', '', '', '', '620800', '744000', '0933', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620801', '620800', '156-620000-620800-620801-', '市辖区', '市辖区', '', '', '', '620801', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620802', '620800', '156-620000-620800-620802-', '崆峒区', '崆峒区', '', '', '', '620802', '744000', '0933', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620821', '620800', '156-620000-620800-620821-', '泾川县', '泾川县', '', '', '', '620821', '744300', '0933', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620822', '620800', '156-620000-620800-620822-', '灵台县', '灵台县', '', '', '', '620822', '744400', '0933', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620823', '620800', '156-620000-620800-620823-', '崇信县', '崇信县', '', '', '', '620823', '744200', '0933', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620824', '620800', '156-620000-620800-620824-', '华亭县', '华亭县', '', '', '', '620824', '744100', '0933', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620825', '620800', '156-620000-620800-620825-', '庄浪县', '庄浪县', '', '', '', '620825', '744600', '0933', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620826', '620800', '156-620000-620800-620826-', '静宁县', '静宁县', '', '', '', '620826', '743400', '0933', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620900', '620000', '156-620000-620900-', '酒泉', '酒泉市', '', '', '', '620900', '735000', '0937', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620901', '620900', '156-620000-620900-620901-', '市辖区', '市辖区', '', '', '', '620901', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620902', '620900', '156-620000-620900-620902-', '肃州区', '肃州区', '', '', '', '620902', '735000', '0937', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620921', '620900', '156-620000-620900-620921-', '金塔县', '金塔县', '', '', '', '620921', '735300', '0937', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620922', '620900', '156-620000-620900-620922-', '瓜州县', '瓜州县', '', '', '', '620922', '736100', '0937', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620923', '620900', '156-620000-620900-620923-', '肃北蒙古族自治县', '肃北蒙古族自治县', '', '', '', '620923', '736300', '0937', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620924', '620900', '156-620000-620900-620924-', '阿克塞哈萨克族自治县', '阿克塞哈萨克族自治县', '', '', '', '620924', '736400', '0937', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620981', '620900', '156-620000-620900-620981-', '玉门市', '玉门市', '', '', '', '620981', '735200', '0937', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('620982', '620900', '156-620000-620900-620982-', '敦煌市', '敦煌市', '', '', '', '620982', '736200', '0937', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621000', '620000', '156-620000-621000-', '庆阳', '庆阳市', '', '', '', '621000', '745000', '0934', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621001', '621000', '156-620000-621000-621001-', '市辖区', '市辖区', '', '', '', '621001', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621002', '621000', '156-620000-621000-621002-', '西峰区', '西峰区', '', '', '', '621002', '745000', '0934', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621021', '621000', '156-620000-621000-621021-', '庆城县', '庆城县', '', '', '', '621021', '745100', '0934', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621022', '621000', '156-620000-621000-621022-', '环县', '环县', '', '', '', '621022', '745700', '0934', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621023', '621000', '156-620000-621000-621023-', '华池县', '华池县', '', '', '', '621023', '745600', '0934', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621024', '621000', '156-620000-621000-621024-', '合水县', '合水县', '', '', '', '621024', '745400', '0934', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621025', '621000', '156-620000-621000-621025-', '正宁县', '正宁县', '', '', '', '621025', '745300', '0934', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621026', '621000', '156-620000-621000-621026-', '宁县', '宁县', '', '', '', '621026', '745200', '0934', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621027', '621000', '156-620000-621000-621027-', '镇原县', '镇原县', '', '', '', '621027', '744500', '0934', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621100', '620000', '156-620000-621100-', '定西', '定西市', '', '', '', '621100', '743000', '0932', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621101', '621100', '156-620000-621100-621101-', '市辖区', '市辖区', '', '', '', '621101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621102', '621100', '156-620000-621100-621102-', '安定区', '安定区', '', '', '', '621102', '744300', '0932', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621121', '621100', '156-620000-621100-621121-', '通渭县', '通渭县', '', '', '', '621121', '743300', '0932', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621122', '621100', '156-620000-621100-621122-', '陇西县', '陇西县', '', '', '', '621122', '748100', '0932', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621123', '621100', '156-620000-621100-621123-', '渭源县', '渭源县', '', '', '', '621123', '748200', '0932', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621124', '621100', '156-620000-621100-621124-', '临洮县', '临洮县', '', '', '', '621124', '730500', '0932', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621125', '621100', '156-620000-621100-621125-', '漳县', '漳县', '', '', '', '621125', '748300', '0932', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621126', '621100', '156-620000-621100-621126-', '岷县', '岷县', '', '', '', '621126', '748400', '0932', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621200', '620000', '156-620000-621200-', '陇南', '陇南市', '', '', '', '621200', '742500', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621201', '621200', '156-620000-621200-621201-', '市辖区', '市辖区', '', '', '', '621201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621202', '621200', '156-620000-621200-621202-', '武都区', '武都区', '', '', '', '621202', '746000', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621221', '621200', '156-620000-621200-621221-', '成县', '成县', '', '', '', '621221', '742500', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621222', '621200', '156-620000-621200-621222-', '文县', '文县', '', '', '', '621222', '746400', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621223', '621200', '156-620000-621200-621223-', '宕昌县', '宕昌县', '', '', '', '621223', '748500', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621224', '621200', '156-620000-621200-621224-', '康县', '康县', '', '', '', '621224', '746500', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621225', '621200', '156-620000-621200-621225-', '西和县', '西和县', '', '', '', '621225', '742100', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621226', '621200', '156-620000-621200-621226-', '礼县', '礼县', '', '', '', '621226', '742200', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621227', '621200', '156-620000-621200-621227-', '徽县', '徽县', '', '', '', '621227', '742300', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('621228', '621200', '156-620000-621200-621228-', '两当县', '两当县', '', '', '', '621228', '742400', '0939', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('622900', '620000', '156-620000-622900-', '临夏州', '临夏回族自治州', '', '', '', '622900', '731100', '0930', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('622901', '622900', '156-620000-622900-622901-', '临夏市', '临夏市', '', '', '', '622901', '731100', '0930', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('622921', '622900', '156-620000-622900-622921-', '临夏县', '临夏县', '', '', '', '622921', '731800', '0930', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('622922', '622900', '156-620000-622900-622922-', '康乐县', '康乐县', '', '', '', '622922', '731500', '0930', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('622923', '622900', '156-620000-622900-622923-', '永靖县', '永靖县', '', '', '', '622923', '731600', '0930', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('622924', '622900', '156-620000-622900-622924-', '广河县', '广河县', '', '', '', '622924', '731300', '0930', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('622925', '622900', '156-620000-622900-622925-', '和政县', '和政县', '', '', '', '622925', '731200', '0930', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('622926', '622900', '156-620000-622900-622926-', '东乡族自治县', '东乡族自治县', '', '', '', '622926', '731400', '0930', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('622927', '622900', '156-620000-622900-622927-', '积石山保安族东乡族撒拉族自治县', '积石山保安族东乡族撒拉族自治县', '', '', '', '622927', '731700', '0930', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('623000', '620000', '156-620000-623000-', '甘南州', '甘南藏族自治州', '', '', '', '623000', '747000', '0941', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('623001', '623000', '156-620000-623000-623001-', '合作市', '合作市', '', '', '', '623001', '747000', '0941', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('623021', '623000', '156-620000-623000-623021-', '临潭县', '临潭县', '', '', '', '623021', '747500', '0941', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('623022', '623000', '156-620000-623000-623022-', '卓尼县', '卓尼县', '', '', '', '623022', '747600', '0941', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('623023', '623000', '156-620000-623000-623023-', '舟曲县', '舟曲县', '', '', '', '623023', '746300', '0941', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('623024', '623000', '156-620000-623000-623024-', '迭部县', '迭部县', '', '', '', '623024', '747400', '0941', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('623025', '623000', '156-620000-623000-623025-', '玛曲县', '玛曲县', '', '', '', '623025', '747300', '0941', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('623026', '623000', '156-620000-623000-623026-', '碌曲县', '碌曲县', '', '', '', '623026', '747200', '0941', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('623027', '623000', '156-620000-623000-623027-', '夏河县', '夏河县', '', '', '', '623027', '747100', '0941', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630000', '156', '156-630000-', '青海', '青海省', 'QingHai', 'QingHai', 'QH', '630000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630100', '630000', '156-630000-630100-', '西宁', '西宁市', '', '', '', '630100', '810000', '0971', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630101', '630100', '156-630000-630100-630101-', '市辖区', '市辖区', '', '', '', '630101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630102', '630100', '156-630000-630100-630102-', '城东区', '城东区', '', '', '', '630102', '810000', '0971', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630103', '630100', '156-630000-630100-630103-', '城中区', '城中区', '', '', '', '630103', '810000', '0971', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630104', '630100', '156-630000-630100-630104-', '城西区', '城西区', '', '', '', '630104', '810000', '0971', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630105', '630100', '156-630000-630100-630105-', '城北区', '城北区', '', '', '', '630105', '810000', '0971', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630121', '630100', '156-630000-630100-630121-', '大通回族土族自治县', '大通回族土族自治县', '', '', '', '630121', '810100', '0971', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630122', '630100', '156-630000-630100-630122-', '湟中县', '湟中县', '', '', '', '630122', '811600', '0972', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('630123', '630100', '156-630000-630100-630123-', '湟源县', '湟源县', '', '', '', '630123', '812100', '0971', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632100', '630000', '156-630000-632100-', '海东', '海东地区', '', '', '', '632100', '810600', '0972', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632121', '632100', '156-630000-632100-632121-', '平安县', '平安县', '', '', '', '632121', '810600', '0972', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632122', '632100', '156-630000-632100-632122-', '民和回族土族自治县', '民和回族土族自治县', '', '', '', '632122', '810800', '0972', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632123', '632100', '156-630000-632100-632123-', '乐都县', '乐都县', '', '', '', '632123', '810700', '0972', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632126', '632100', '156-630000-632100-632126-', '互助土族自治县', '互助土族自治县', '', '', '', '632126', '810500', '0972', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632127', '632100', '156-630000-632100-632127-', '化隆回族自治县', '化隆回族自治县', '', '', '', '632127', '810900', '0972', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632128', '632100', '156-630000-632100-632128-', '循化撒拉族自治县', '循化撒拉族自治县', '', '', '', '632128', '811100', '0972', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632200', '630000', '156-630000-632200-', '海北州', '海北藏族自治州', '', '', '', '632200', '812200', '0970', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632221', '632200', '156-630000-632200-632221-', '门源回族自治县', '门源回族自治县', '', '', '', '632221', '810300', '0970', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632222', '632200', '156-630000-632200-632222-', '祁连县', '祁连县', '', '', '', '632222', '810400', '0970', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632223', '632200', '156-630000-632200-632223-', '海晏县', '海晏县', '', '', '', '632223', '812200', '0970', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632224', '632200', '156-630000-632200-632224-', '刚察县', '刚察县', '', '', '', '632224', '812300', '0970', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632300', '630000', '156-630000-632300-', '黄南州', '黄南藏族自治州', '', '', '', '632300', '811300', '0973', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632321', '632300', '156-630000-632300-632321-', '同仁县', '同仁县', '', '', '', '632321', '811300', '0973', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632322', '632300', '156-630000-632300-632322-', '尖扎县', '尖扎县', '', '', '', '632322', '811200', '0973', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632323', '632300', '156-630000-632300-632323-', '泽库县', '泽库县', '', '', '', '632323', '811400', '0973', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632324', '632300', '156-630000-632300-632324-', '河南蒙古族自治县', '河南蒙古族自治县', '', '', '', '632324', '811500', '0973', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632500', '630000', '156-630000-632500-', '海南州', '海南藏族自治州', '', '', '', '632500', '813000', '0974', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632521', '632500', '156-630000-632500-632521-', '共和县', '共和县', '', '', '', '632521', '813000', '0974', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632522', '632500', '156-630000-632500-632522-', '同德县', '同德县', '', '', '', '632522', '813200', '0974', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632523', '632500', '156-630000-632500-632523-', '贵德县', '贵德县', '', '', '', '632523', '811700', '0974', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632524', '632500', '156-630000-632500-632524-', '兴海县', '兴海县', '', '', '', '632524', '813300', '0974', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632525', '632500', '156-630000-632500-632525-', '贵南县', '贵南县', '', '', '', '632525', '813100', '0974', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632600', '630000', '156-630000-632600-', '果洛州', '果洛藏族自治州', '', '', '', '632600', '814000', '0975', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632621', '632600', '156-630000-632600-632621-', '玛沁县', '玛沁县', '', '', '', '632621', '814000', '0975', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632622', '632600', '156-630000-632600-632622-', '班玛县', '班玛县', '', '', '', '632622', '814300', '0975', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632623', '632600', '156-630000-632600-632623-', '甘德县', '甘德县', '', '', '', '632623', '814100', '0975', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632624', '632600', '156-630000-632600-632624-', '达日县', '达日县', '', '', '', '632624', '814200', '0975', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632625', '632600', '156-630000-632600-632625-', '久治县', '久治县', '', '', '', '632625', '624700', '0975', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632626', '632600', '156-630000-632600-632626-', '玛多县', '玛多县', '', '', '', '632626', '813500', '0975', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632700', '630000', '156-630000-632700-', '玉树州', '玉树藏族自治州', '', '', '', '632700', '815000', '0976', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632721', '632700', '156-630000-632700-632721-', '玉树县', '玉树县', '', '', '', '632721', '815000', '0976', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632722', '632700', '156-630000-632700-632722-', '杂多县', '杂多县', '', '', '', '632722', '815300', '0976', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632723', '632700', '156-630000-632700-632723-', '称多县', '称多县', '', '', '', '632723', '815100', '0976', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632724', '632700', '156-630000-632700-632724-', '治多县', '治多县', '', '', '', '632724', '815400', '0976', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632725', '632700', '156-630000-632700-632725-', '囊谦县', '囊谦县', '', '', '', '632725', '815200', '0976', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632726', '632700', '156-630000-632700-632726-', '曲麻莱县', '曲麻莱县', '', '', '', '632726', '815500', '0976', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632800', '630000', '156-630000-632800-', '海西州', '海西蒙古族藏族自治州', '', '', '', '632800', '817000', '0979', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632801', '632800', '156-630000-632800-632801-', '格尔木市', '格尔木市', '', '', '', '632801', '816000', '0979', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632802', '632800', '156-630000-632800-632802-', '德令哈市', '德令哈市', '', '', '', '632802', '817000', '0979', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632821', '632800', '156-630000-632800-632821-', '乌兰县', '乌兰县', '', '', '', '632821', '817100', '0979', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632822', '632800', '156-630000-632800-632822-', '都兰县', '都兰县', '', '', '', '632822', '816100', '0979', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('632823', '632800', '156-630000-632800-632823-', '天峻县', '天峻县', '', '', '', '632823', '817200', '0979', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640000', '156', '156-640000-', '宁夏', '宁夏回族自治区', 'NingXia', 'NingXia', 'NX', '640000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640100', '640000', '156-640000-640100-', '银川', '银川市', '', '', '', '640100', '750000', '0951', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640101', '640100', '156-640000-640100-640101-', '市辖区', '市辖区', '', '', '', '640101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640104', '640100', '156-640000-640100-640104-', '兴庆区', '兴庆区', '', '', '', '640104', '750000', '0951', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640105', '640100', '156-640000-640100-640105-', '西夏区', '西夏区', '', '', '', '640105', '750000', '0951', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640106', '640100', '156-640000-640100-640106-', '金凤区', '金凤区', '', '', '', '640106', '750000', '0951', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640121', '640100', '156-640000-640100-640121-', '永宁县', '永宁县', '', '', '', '640121', '750100', '0951', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640122', '640100', '156-640000-640100-640122-', '贺兰县', '贺兰县', '', '', '', '640122', '750200', '0951', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640181', '640100', '156-640000-640100-640181-', '灵武市', '灵武市', '', '', '', '640181', '751400', '0951', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640200', '640000', '156-640000-640200-', '石嘴山', '石嘴山市', '', '', '', '640200', '753000', '0952', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640201', '640200', '156-640000-640200-640201-', '市辖区', '市辖区', '', '', '', '640201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640202', '640200', '156-640000-640200-640202-', '大武口区', '大武口区', '', '', '', '640202', '753000', '0952', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640205', '640200', '156-640000-640200-640205-', '惠农区', '惠农区', '', '', '', '640205', '753600', '0952', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640221', '640200', '156-640000-640200-640221-', '平罗县', '平罗县', '', '', '', '640221', '753400', '0952', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640300', '640000', '156-640000-640300-', '吴忠', '吴忠市', '', '', '', '640300', '751100', '0953', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640301', '640300', '156-640000-640300-640301-', '市辖区', '市辖区', '', '', '', '640301', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640302', '640300', '156-640000-640300-640302-', '利通区', '利通区', '', '', '', '640302', '751100', '0953', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640303', '640300', '156-640000-640300-640303-', '红寺堡区', '红寺堡区', '', '', '', '640303', '751100', '0953', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640323', '640300', '156-640000-640300-640323-', '盐池县', '盐池县', '', '', '', '640323', '751500', '0953', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640324', '640300', '156-640000-640300-640324-', '同心县', '同心县', '', '', '', '640324', '751300', '0953', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640381', '640300', '156-640000-640300-640381-', '青铜峡市', '青铜峡市', '', '', '', '640381', '751600', '0953', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640400', '640000', '156-640000-640400-', '固原', '固原市', '', '', '', '640400', '756000', '0954', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640401', '640400', '156-640000-640400-640401-', '市辖区', '市辖区', '', '', '', '640401', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640402', '640400', '156-640000-640400-640402-', '原州区', '原州区', '', '', '', '640402', '756000', '0954', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640422', '640400', '156-640000-640400-640422-', '西吉县', '西吉县', '', '', '', '640422', '756200', '0954', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640423', '640400', '156-640000-640400-640423-', '隆德县', '隆德县', '', '', '', '640423', '756300', '0954', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640424', '640400', '156-640000-640400-640424-', '泾源县', '泾源县', '', '', '', '640424', '756400', '0954', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640425', '640400', '156-640000-640400-640425-', '彭阳县', '彭阳县', '', '', '', '640425', '756500', '0954', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640500', '640000', '156-640000-640500-', '中卫', '中卫市', '', '', '', '640500', '755000', '0955', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640501', '640500', '156-640000-640500-640501-', '市辖区', '市辖区', '', '', '', '640501', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640502', '640500', '156-640000-640500-640502-', '沙坡头区', '沙坡头区', '', '', '', '640502', '755000', '0955', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640521', '640500', '156-640000-640500-640521-', '中宁县', '中宁县', '', '', '', '640521', '755100', '0955', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('640522', '640500', '156-640000-640500-640522-', '海原县', '海原县', '', '', '', '640522', '755200', '0955', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650000', '156', '156-650000-', '新疆', '新疆维吾尔自治区', 'XinJiang', 'XinJiang', 'XJ', '650000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650100', '650000', '156-650000-650100-', '乌鲁木齐', '乌鲁木齐市', '', '', '', '650100', '830000', '0991', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650101', '650100', '156-650000-650100-650101-', '市辖区', '市辖区', '', '', '', '650101', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650102', '650100', '156-650000-650100-650102-', '天山区', '天山区', '', '', '', '650102', '830000', '0991', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650103', '650100', '156-650000-650100-650103-', '沙依巴克区', '沙依巴克区', '', '', '', '650103', '830000', '0991', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650104', '650100', '156-650000-650100-650104-', '新市区', '新市区', '', '', '', '650104', '830000', '0991', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650105', '650100', '156-650000-650100-650105-', '水磨沟区', '水磨沟区', '', '', '', '650105', '830000', '0991', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650106', '650100', '156-650000-650100-650106-', '头屯河区', '头屯河区', '', '', '', '650106', '830000', '0991', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650107', '650100', '156-650000-650100-650107-', '达坂城区', '达坂城区', '', '', '', '650107', '830039', '0991', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650109', '650100', '156-650000-650100-650109-', '米东区', '米东区', '', '', '', '650109', '830000', '0991', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650121', '650100', '156-650000-650100-650121-', '乌鲁木齐县', '乌鲁木齐县', '', '', '', '650121', '830000', '0991', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650200', '650000', '156-650000-650200-', '克拉玛依', '克拉玛依市', '', '', '', '650200', '834000', '0990', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650201', '650200', '156-650000-650200-650201-', '市辖区', '市辖区', '', '', '', '650201', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650202', '650200', '156-650000-650200-650202-', '独山子区', '独山子区', '', '', '', '650202', '833600', '0992', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650203', '650200', '156-650000-650200-650203-', '克拉玛依区', '克拉玛依区', '', '', '', '650203', '834000', '0990', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650204', '650200', '156-650000-650200-650204-', '白碱滩区', '白碱滩区', '', '', '', '650204', '834000', '0990', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('650205', '650200', '156-650000-650200-650205-', '乌尔禾区', '乌尔禾区', '', '', '', '650205', '834000', '0990', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652100', '650000', '156-650000-652100-', '吐鲁番', '吐鲁番地区', '', '', '', '652100', '838000', '0995', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652101', '652100', '156-650000-652100-652101-', '吐鲁番市', '吐鲁番市', '', '', '', '652101', '838000', '0995', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652122', '652100', '156-650000-652100-652122-', '鄯善县', '鄯善县', '', '', '', '652122', '838200', '0995', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652123', '652100', '156-650000-652100-652123-', '托克逊县', '托克逊县', '', '', '', '652123', '838100', '0995', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652200', '650000', '156-650000-652200-', '哈密', '哈密地区', '', '', '', '652200', '839000', '0902', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652201', '652200', '156-650000-652200-652201-', '哈密市', '哈密市', '', '', '', '652201', '839000', '0902', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652222', '652200', '156-650000-652200-652222-', '巴里坤哈萨克自治县', '巴里坤哈萨克自治县', '', '', '', '652222', '839200', '0902', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652223', '652200', '156-650000-652200-652223-', '伊吾县', '伊吾县', '', '', '', '652223', '839300', '0902', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652300', '650000', '156-650000-652300-', '昌吉', '昌吉回族自治州', '', '', '', '652300', '831100', '0994', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652301', '652300', '156-650000-652300-652301-', '昌吉市', '昌吉市', '', '', '', '652301', '831100', '0994', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652302', '652300', '156-650000-652300-652302-', '阜康市', '阜康市', '', '', '', '652302', '831500', '0994', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652323', '652300', '156-650000-652300-652323-', '呼图壁县', '呼图壁县', '', '', '', '652323', '831200', '0994', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652324', '652300', '156-650000-652300-652324-', '玛纳斯县', '玛纳斯县', '', '', '', '652324', '832200', '0994', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652325', '652300', '156-650000-652300-652325-', '奇台县', '奇台县', '', '', '', '652325', '831800', '0994', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652327', '652300', '156-650000-652300-652327-', '吉木萨尔县', '吉木萨尔县', '', '', '', '652327', '831700', '0994', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652328', '652300', '156-650000-652300-652328-', '木垒哈萨克自治县', '木垒哈萨克自治县', '', '', '', '652328', '831900', '0994', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652700', '650000', '156-650000-652700-', '博尔塔拉', '博尔塔拉蒙古自治州', '', '', '', '652700', '833400', '0909', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652701', '652700', '156-650000-652700-652701-', '博乐市', '博乐市', '', '', '', '652701', '833400', '0909', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652722', '652700', '156-650000-652700-652722-', '精河县', '精河县', '', '', '', '652722', '833300', '0909', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652723', '652700', '156-650000-652700-652723-', '温泉县', '温泉县', '', '', '', '652723', '833500', '0909', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652800', '650000', '156-650000-652800-', '巴音郭楞', '巴音郭楞蒙古自治州', '', '', '', '652800', '841000', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652801', '652800', '156-650000-652800-652801-', '库尔勒市', '库尔勒市', '', '', '', '652801', '841000', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652822', '652800', '156-650000-652800-652822-', '轮台县', '轮台县', '', '', '', '652822', '841600', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652823', '652800', '156-650000-652800-652823-', '尉犁县', '尉犁县', '', '', '', '652823', '841500', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652824', '652800', '156-650000-652800-652824-', '若羌县', '若羌县', '', '', '', '652824', '841800', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652825', '652800', '156-650000-652800-652825-', '且末县', '且末县', '', '', '', '652825', '841900', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652826', '652800', '156-650000-652800-652826-', '焉耆回族自治县', '焉耆回族自治县', '', '', '', '652826', '841100', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652827', '652800', '156-650000-652800-652827-', '和静县', '和静县', '', '', '', '652827', '841300', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652828', '652800', '156-650000-652800-652828-', '和硕县', '和硕县', '', '', '', '652828', '841200', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652829', '652800', '156-650000-652800-652829-', '博湖县', '博湖县', '', '', '', '652829', '841400', '0996', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652900', '650000', '156-650000-652900-', '阿克苏', '阿克苏地区', '', '', '', '652900', '843000', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652901', '652900', '156-650000-652900-652901-', '阿克苏市', '阿克苏市', '', '', '', '652901', '843000', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652922', '652900', '156-650000-652900-652922-', '温宿县', '温宿县', '', '', '', '652922', '843100', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652923', '652900', '156-650000-652900-652923-', '库车县', '库车县', '', '', '', '652923', '842000', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652924', '652900', '156-650000-652900-652924-', '沙雅县', '沙雅县', '', '', '', '652924', '842200', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652925', '652900', '156-650000-652900-652925-', '新和县', '新和县', '', '', '', '652925', '842100', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652926', '652900', '156-650000-652900-652926-', '拜城县', '拜城县', '', '', '', '652926', '842300', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652927', '652900', '156-650000-652900-652927-', '乌什县', '乌什县', '', '', '', '652927', '843400', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652928', '652900', '156-650000-652900-652928-', '阿瓦提县', '阿瓦提县', '', '', '', '652928', '843200', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('652929', '652900', '156-650000-652900-652929-', '柯坪县', '柯坪县', '', '', '', '652929', '843600', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653000', '650000', '156-650000-653000-', '克孜勒苏', '克孜勒苏柯尔克孜自治州', '', '', '', '653000', '845350', '0908', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653001', '653000', '156-650000-653000-653001-', '阿图什市', '阿图什市', '', '', '', '653001', '845350', '0908', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653022', '653000', '156-650000-653000-653022-', '阿克陶县', '阿克陶县', '', '', '', '653022', '845550', '0908', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653023', '653000', '156-650000-653000-653023-', '阿合奇县', '阿合奇县', '', '', '', '653023', '843500', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653024', '653000', '156-650000-653000-653024-', '乌恰县', '乌恰县', '', '', '', '653024', '845450', '0908', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653100', '650000', '156-650000-653100-', '喀什', '喀什地区', '', '', '', '653100', '844000', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653101', '653100', '156-650000-653100-653101-', '喀什市', '喀什市', '', '', '', '653101', '844000', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653121', '653100', '156-650000-653100-653121-', '疏附县', '疏附县', '', '', '', '653121', '844100', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653122', '653100', '156-650000-653100-653122-', '疏勒县', '疏勒县', '', '', '', '653122', '844200', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653123', '653100', '156-650000-653100-653123-', '英吉沙县', '英吉沙县', '', '', '', '653123', '844500', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653124', '653100', '156-650000-653100-653124-', '泽普县', '泽普县', '', '', '', '653124', '844800', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653125', '653100', '156-650000-653100-653125-', '莎车县', '莎车县', '', '', '', '653125', '844700', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653126', '653100', '156-650000-653100-653126-', '叶城县', '叶城县', '', '', '', '653126', '844900', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653127', '653100', '156-650000-653100-653127-', '麦盖提县', '麦盖提县', '', '', '', '653127', '844600', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653128', '653100', '156-650000-653100-653128-', '岳普湖县', '岳普湖县', '', '', '', '653128', '844400', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653129', '653100', '156-650000-653100-653129-', '伽师县', '伽师县', '', '', '', '653129', '844300', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653130', '653100', '156-650000-653100-653130-', '巴楚县', '巴楚县', '', '', '', '653130', '843800', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653131', '653100', '156-650000-653100-653131-', '塔什库尔干塔吉克自治县', '塔什库尔干塔吉克自治县', '', '', '', '653131', '845250', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653200', '650000', '156-650000-653200-', '和田', '和田地区', '', '', '', '653200', '848000', '0903', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653201', '653200', '156-650000-653200-653201-', '和田市', '和田市', '', '', '', '653201', '848000', '0903', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653221', '653200', '156-650000-653200-653221-', '和田县', '和田县', '', '', '', '653221', '848000', '0903', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653222', '653200', '156-650000-653200-653222-', '墨玉县', '墨玉县', '', '', '', '653222', '848100', '0903', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653223', '653200', '156-650000-653200-653223-', '皮山县', '皮山县', '', '', '', '653223', '845150', '0903', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653224', '653200', '156-650000-653200-653224-', '洛浦县', '洛浦县', '', '', '', '653224', '848200', '0903', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653225', '653200', '156-650000-653200-653225-', '策勒县', '策勒县', '', '', '', '653225', '848300', '0903', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653226', '653200', '156-650000-653200-653226-', '于田县', '于田县', '', '', '', '653226', '848400', '0903', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('653227', '653200', '156-650000-653200-653227-', '民丰县', '民丰县', '', '', '', '653227', '848500', '0903', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654000', '650000', '156-650000-654000-', '伊犁', '伊犁哈萨克自治州', '', '', '', '654000', '835000', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654002', '654000', '156-650000-654000-654002-', '伊宁市', '伊宁市', '', '', '', '654002', '835000', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654003', '654000', '156-650000-654000-654003-', '奎屯市', '奎屯市', '', '', '', '654003', '833200', '0992', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654021', '654000', '156-650000-654000-654021-', '伊宁县', '伊宁县', '', '', '', '654021', '835100', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654022', '654000', '156-650000-654000-654022-', '察布查尔锡伯自治县', '察布查尔锡伯自治县', '', '', '', '654022', '835300', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654023', '654000', '156-650000-654000-654023-', '霍城县', '霍城县', '', '', '', '654023', '835200', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654024', '654000', '156-650000-654000-654024-', '巩留县', '巩留县', '', '', '', '654024', '835400', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654025', '654000', '156-650000-654000-654025-', '新源县', '新源县', '', '', '', '654025', '835800', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654026', '654000', '156-650000-654000-654026-', '昭苏县', '昭苏县', '', '', '', '654026', '835600', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654027', '654000', '156-650000-654000-654027-', '特克斯县', '特克斯县', '', '', '', '654027', '835500', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654028', '654000', '156-650000-654000-654028-', '尼勒克县', '尼勒克县', '', '', '', '654028', '835700', '0999', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654200', '650000', '156-650000-654200-', '塔城', '塔城地区', '', '', '', '654200', '834700', '0901', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654201', '654200', '156-650000-654200-654201-', '塔城市', '塔城市', '', '', '', '654201', '834300', '0901', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654202', '654200', '156-650000-654200-654202-', '乌苏市', '乌苏市', '', '', '', '654202', '833300', '0992', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654221', '654200', '156-650000-654200-654221-', '额敏县', '额敏县', '', '', '', '654221', '834600', '0901', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654223', '654200', '156-650000-654200-654223-', '沙湾县', '沙湾县', '', '', '', '654223', '832100', '0993', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654224', '654200', '156-650000-654200-654224-', '托里县', '托里县', '', '', '', '654224', '834500', '0901', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654225', '654200', '156-650000-654200-654225-', '裕民县', '裕民县', '', '', '', '654225', '834800', '0901', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654226', '654200', '156-650000-654200-654226-', '和布克赛尔蒙古自治县', '和布克赛尔蒙古自治县', '', '', '', '654226', '834400', '0990', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654300', '650000', '156-650000-654300-', '阿勒泰', '阿勒泰地区', '', '', '', '654300', '836500', '0906', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654301', '654300', '156-650000-654300-654301-', '阿勒泰市', '阿勒泰市', '', '', '', '654301', '836500', '0906', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654321', '654300', '156-650000-654300-654321-', '布尔津县', '布尔津县', '', '', '', '654321', '836600', '0906', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654322', '654300', '156-650000-654300-654322-', '富蕴县', '富蕴县', '', '', '', '654322', '836100', '0906', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654323', '654300', '156-650000-654300-654323-', '福海县', '福海县', '', '', '', '654323', '836400', '0906', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654324', '654300', '156-650000-654300-654324-', '哈巴河县', '哈巴河县', '', '', '', '654324', '836700', '0906', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654325', '654300', '156-650000-654300-654325-', '青河县', '青河县', '', '', '', '654325', '836200', '0906', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('654326', '654300', '156-650000-654300-654326-', '吉木乃县', '吉木乃县', '', '', '', '654326', '836800', '0906', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('659000', '650000', '156-650000-659000-', '自治区', '自治区直辖县级行政区划', '', '', '', '659000', '0', '0', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('659001', '659000', '156-650000-659000-659001-', '石河子市', '石河子市', '', '', '', '659001', '832000', '0993', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('659002', '659000', '156-650000-659000-659002-', '阿拉尔市', '阿拉尔市', '', '', '', '659002', '843300', '0997', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('659003', '659000', '156-650000-659000-659003-', '图木舒克市', '图木舒克市', '', '', '', '659003', '844000', '0998', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('659004', '659000', '156-650000-659000-659004-', '五家渠市', '五家渠市', '', '', '', '659004', '831300', '0994', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('710000', '156', '156-710000-', '台湾', '台湾省', 'Taiwan', 'Taiwan', 'TW', '710000', '0', '00886', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('810000', '156', '156-810000-', '香港', '香港特别行政区', 'Hong Kong', 'Hong Kong', 'HK', '810000', '999077', '00852', '', '', '1');
INSERT INTO `admin_base_area` VALUES ('820000', '156', '156-820000-', '澳门', '澳门特别行政区', 'Macau', 'Macau', 'MO', '820000', '999078', '00853', '', '', '1');

-- ----------------------------
-- Table structure for `admin_base_brand`
-- ----------------------------
DROP TABLE IF EXISTS `admin_base_brand`;
CREATE TABLE `admin_base_brand` (
  `bbid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '品牌编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `ename` varchar(100) NOT NULL DEFAULT '' COMMENT '品牌英文名称',
  `first_letter` varchar(10) DEFAULT '' COMMENT '品牌名称首字母',
  `description` varchar(800) DEFAULT '' COMMENT '品牌简述',
  `thumbnail` varchar(255) DEFAULT '' COMMENT '品牌缩略图',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`bbid`),
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='品牌管理';

-- ----------------------------
-- Records of admin_base_brand
-- ----------------------------
INSERT INTO `admin_base_brand` VALUES ('1', 'PatekPhilippe', '百达翡丽', 'PATEK PHILIPPE', 'b', 'Patek Philippe (百达翡丽) 是瑞士现存惟一一家完全由家族独立经营的钟表制造商。百达翡丽表一向重视外形设计与制作工艺，制表工序全部在日内瓦原厂完成，是全球众多品牌表中惟一一家全部机芯获“日内瓦优质印记”(Geneva Seal)的品牌。', '', '0', '1', '2013-05-04 15:01:02', '2013-05-04 15:56:24');
INSERT INTO `admin_base_brand` VALUES ('2', 'ALangeSohne', '朗格', 'A. Lange &amp; Söhne', 'l', '朗格（A.Lange&amp;Sohne）是世界十大名表之一，也是著名的奢侈品牌。朗格表是非常精准的德国机械钟表品牌，它的主要特色在于：无与伦比 的精湛技术和高水准的完美手工。朗格作为少见的非瑞士名表品牌，是地道的东部德国产品，曾经因前东德的专制统治而消失过，但两德统一后再度焕发青春。朗格 坚持只做机械贵金属腕表，使得它的品质和价位都居高不下。', '', '0', '1', '2013-05-04 16:36:30', '2013-05-04 16:36:30');
INSERT INTO `admin_base_brand` VALUES ('3', 'Breguet', '宝玑', 'Breguet', 'b', '宝玑（Breguet）多年来一直是瑞士钟表最重要的代名词。1747年，宝玑在瑞士的纳沙泰出生，他大部分时间居于巴黎，一生中创造无数伟大的发明，他活跃于制表业中每一个范畴，连串的突破令他的事业不断攀上高峰，如改良自动表、发明自鸣钟用的鸣钟弹簧；以及避震装置等等；而其新古典主义的简洁设计更予人惊喜。', '', '0', '1', '2013-05-04 16:39:03', '2013-05-04 16:39:03');
INSERT INTO `admin_base_brand` VALUES ('4', 'JaegerLeCoultre', '积家', 'Jaeger LeCoultre', 'j', '积家（Jaeger LeCoultre）钟表自1833年成立于瑞士的汝山谷(Vallée de Joux)以来，不仅以传统制表工艺的捍卫者自居，同时也是精确计时技术和设计领域中的先驱之一。出色的质量、创新的概念及细腻的做工，让积家钟表成为业界中的佼佼者。', '', '0', '1', '2013-05-04 16:41:18', '2013-05-04 16:41:18');
INSERT INTO `admin_base_brand` VALUES ('5', 'VacheronConstantin', '江诗丹顿', 'Vacheron Constantin', 'j', '江诗丹顿（Vacheron Constantin）作为世界上历史悠久的钟表制造商,自1755年于日内瓦创立以来,从未停止生产。秉承“悉力以赴，精益求精”的宗旨,其每一枚时计均代表了瑞士高级钟表登峰造极的制表工艺,体现了江诗丹顿在世界钟表业界卓尔不群的地位。', '', '0', '1', '2013-05-04 16:42:49', '2013-05-04 16:43:53');
INSERT INTO `admin_base_brand` VALUES ('6', 'Blancpain', '宝珀', 'Blancpain', 'b', '宝珀（Blancpain）前世界上最复杂、最多功能的全手工机械表——Blancpain 宝珀。宝珀的口号就是“只做机械表”。宝珀是现存历史最久的、最古老的腕表品牌，建于1735年。Blancpain腕表的价值不仅在于人工镶嵌所花的时间，还在于它一丝不茍的每一细节。它优美的经典外型，使它可超然地不受潮流变迁所影响，成为自成一体的表艺珍品。', '', '0', '1', '2013-05-04 16:44:21', '2013-05-04 16:44:21');
INSERT INTO `admin_base_brand` VALUES ('7', 'Piaget', '伯爵', 'Piaget', 'b', '伯爵（Piaget）从1874年诞生以来，伯爵一直秉承“永远做得比要求的更好”的品牌精神，将精湛工艺与无限创意融入每一件作品中，同时优先发展创意和对细节的追求，将腕 表与珠宝的工艺完全融合在一起。创立伊始，伯爵专注于腕表机芯的设计和生产。二十世纪60年代，伯爵拓展其专业领域，陆续推出令人称奇的珠宝腕表和富于革 新精神的珠宝系列。伯爵能够捕捉时间的神韵，每一件腕表和珠宝作品都是在胆识、专业和想象力驱动下对精湛工艺的不懈探求。', '', '0', '1', '2013-05-04 16:45:24', '2013-05-04 16:45:24');
INSERT INTO `admin_base_brand` VALUES ('8', 'AudemarsPiguet', '爱彼', 'Audemars Piguet', 'a', '爱彼（Audemars Piguet）是瑞士钟表国家品牌，在1889年举行的第十届巴黎环球钟表展览会中，爱彼的Grand Complication陀表参展，精湛设计引来极大回响，声名大噪，享誉国际，为爱彼表在表坛树立了崇高的地位。时至今日，爱彼表在Audemars与 Piguet家族第四代子孙的领导下，仍秉持着原创始者的精神：传承精湛制表技艺，以及追求创新卓越的信念。深获钟表鉴赏家及收藏家的推崇，成为世界十大名表之一。', '', '0', '1', '2013-05-04 16:46:56', '2013-05-04 16:46:56');
INSERT INTO `admin_base_brand` VALUES ('9', 'GlashutteOriginal', '格拉苏蒂', 'Glashütte Original', 'g', '格拉苏蒂(Glashütte Original)产地：德国， 格拉苏蒂镇(Glashütte)  格拉苏蒂是德国高级机械腕表品牌。旗下全系列腕表100%装载自制高级机芯，秉承传统地德国手工制表工艺。每一支格拉苏蒂腕表都是独一无二的艺术品，传递着佩戴着高贵的品味。', '', '0', '1', '2013-05-04 16:47:39', '2013-05-04 16:47:39');
INSERT INTO `admin_base_brand` VALUES ('10', 'FranckMuller', '法兰克穆勒', 'Franck Muller', 'f', '法兰克·穆勒(又名 法兰·穆勒，富兰克·穆勒) 英文名称：Franck Muller，创建于1991。Franck Muller是一位有着丰富经验的表匠。十多年前他创立了以自己名字命名的腕表品牌。酒桶型的表体形象以及夸张的数字刻度是Franck Muller品牌特色和象征。酒桶型表体在全球掀起的复古情感，使得Franck Muller名声鹊起。时至如今，虽然该品牌仅有十几年的历史，但已经成为腕表品牌的经典。', '', '0', '1', '2013-05-04 16:49:10', '2013-05-04 16:49:10');
INSERT INTO `admin_base_brand` VALUES ('11', 'UlysseNardin', '雅典', 'Ulysse Nardin', 'y', '', '', '0', '0', '2013-05-04 17:22:25', '2013-05-04 17:22:25');
INSERT INTO `admin_base_brand` VALUES ('12', 'ParmigianiFleurier', '帕玛强尼', 'Parmigiani Fleurier', 'p', '', '', '0', '0', '2013-05-04 17:27:11', '2013-05-04 17:27:11');
INSERT INTO `admin_base_brand` VALUES ('13', 'JaquetDroz', '雅克德罗', 'Jaquet Droz', 'y', '', '', '0', '0', '2013-05-04 17:27:56', '2013-05-04 17:27:56');
INSERT INTO `admin_base_brand` VALUES ('14', 'RichardMille', '理查德·米勒', 'Richard Mille', 'l', '', '', '0', '0', '2013-05-04 17:28:28', '2013-05-04 17:28:28');
INSERT INTO `admin_base_brand` VALUES ('15', 'VanCleef&amp;Arpels', '梵克雅宝', 'Van Cleef &amp; Arpels', 'f', '', '', '0', '1', '2013-05-04 17:29:11', '2013-05-04 17:29:11');
INSERT INTO `admin_base_brand` VALUES ('16', 'Omega', '欧米茄', 'OMEGA', 'o', '欧米茄（OMEGA）是国际著名制表企业和品牌，代表符号“Ω”。由路易士·勃兰特始创于1848 年，欧米茄标志着制表历史上的光辉成就，傲视同侪。欧米茄(Ω)是希腊文的第二十四个，也是最后一个字母。它象征着事物的伊始与终极，第一与最后。代表了&quot;完美、极致、卓越、成就&quot;的非凡品质，诠释出欧米茄追寻&quot;卓越品质&quot;的经营理念和&quot;崇尚传统，并勇于创新&quot;的精神风范。配戴欧米茄手表，代表成就与完美。', '', '0', '1', '2013-05-04 17:39:26', '2013-05-04 18:09:43');
INSERT INTO `admin_base_brand` VALUES ('17', 'IWC', '万国', 'IWC', 'w', '万国（IWC）创立于1868年，立业地方叫沙夫豪森，当地有钟表的历史可远溯至15世纪初，足足比iwc早了459年。但得到iwc建厂制表后，时间的精确度，才开始被人们牢牢掌握在手中。打造出永恒经典的作品，其设计与技术在同行业中的领先一直是万国表缔造众多辉煌成就的动力。品牌特色：身为卓越不凡的钟表工程师，万国表提供顶级的技术内涵、创新思维和品牌个性。', '', '0', '1', '2013-05-04 17:44:38', '2013-05-04 18:09:20');
INSERT INTO `admin_base_brand` VALUES ('18', '', '梵德宝', 'Van der Bauwede', 'f', '梵德宝（Van der Bauwede）源自1890年，当时来自「北方威尼斯」布鲁日的创办人Alexis Van der Bauwede正展开他钟表生涯，专注组装和调节用于大教堂、钟楼和市政厅时钟内部的复杂机芯及其钟鸣装置。一百多年来VanderBauwede家族创造出无数高级腕表，除了承袭古典钟鸣计时器的精细 制表工艺，更因Alexis本身传承给后代的珠宝首饰设计专才而更显光耀华美。', '', '0', '2', '2013-05-04 17:54:51', '2013-05-04 18:09:06');
INSERT INTO `admin_base_brand` VALUES ('19', '', '库尔沃', 'Cuervo y Sobrinos', 'k', '库尔沃（Cuervo y Sobrinos）：一个起源于南美洲，发展于瑞士的古老奢侈品牌，拥有130年的悠久历史。诞生在被誉为“加勒比海明珠”的古巴哈瓦那，这里曾是拉丁美洲最繁华的都市，一度以奢华、顶端的艺术品而享誉全球。CYS品牌腕表的设计品味展现出浓厚的拉丁风情，加上每个系列的名字均来源于古巴著名的雪茄，让每只CYS腕表充满了十九世纪末哈瓦那的迷人气息。', '', '0', '2', '2013-05-04 18:06:19', '2013-05-04 18:06:19');
INSERT INTO `admin_base_brand` VALUES ('20', '', 'Armand Nicolet', 'Armand Nicolet', 'a', '作为一个拥有百年历史的老品牌， 他的命运与瑞士钟表业紧密相连。 虽然一度没落， 但是随着瑞士钟表业的再度崛起，这支品牌也在逐渐回归市场。Armand Nicolet作为一个瑞士著名品牌，是纯美、优质及精准的代名词。Armand Nicolet凭着其独特精巧的设计，和精密的品牌独立机芯，在全球24个国家设立了过百零售点。', '', '0', '2', '2013-05-04 18:12:01', '2013-05-04 18:12:01');
INSERT INTO `admin_base_brand` VALUES ('21', 'Rolex', '劳力士', 'Rolex', 'l', '劳力士（Rolex）是瑞士钟表业的经典品牌。劳力士表最初的标志为一只伸开五指的手掌，它表示该品牌的手表完全是靠手工精雕细琢的，后来才逐渐演变为皇冠的注册商标，以示其在手表领域中的霸主地位，展现着劳力士在制表业的帝王之气。一个世纪以来劳力士凭借卓越质量、专业的制表工艺成为杰出性能与尊贵气质的超群象征。劳力士的精准和超高耐用度，吸引无数用户，常常在钟表圈中，劳力士的粉丝们常常会用一句话来形容劳力士：一“劳”永逸。', '', '0', '1', '2013-05-04 18:13:17', '2013-05-04 18:13:17');
INSERT INTO `admin_base_brand` VALUES ('22', 'Tudor', '帝舵', 'Tudor', 'd', '帝舵（Tudor）这个名字来自英国的都铎王朝。那是英国的黄金时代，声誉大概可以比得上中国的贞观之治。中文名字被出色地译作“帝舵”，也就无可置疑地有了万方臣服的王者气派。帝舵从尖端技术到时尚风格，不仅禀承逾一个世纪的传统制表工艺，更以独一无二的手工技艺打造出一只只有生命、有灵魂的腕表。精工细作，尽显品牌的现代气息和高雅气质。', '', '0', '1', '2013-05-04 18:15:50', '2013-05-04 18:15:50');
INSERT INTO `admin_base_brand` VALUES ('23', 'Cartier', '卡地亚', 'Cartier', 'k', '卡地亚(Cartier)于1847年在法国创立,世界珠宝,腕表及配饰领域的翘楚,被英国国王爱德华七世赞誉为&quot;皇帝的珠宝商,珠宝商的皇帝&quot;。以不断创新的理念和巧夺天工的设计,书写世界珠宝及腕表设计制作的历史,受到无数皇室贵族与名流雅士的推崇和爱戴。现为瑞士历峰集团（Compagnie Financière Richemont SA）下属公司。1904年曾为飞机师阿尔拔图·山度士·度门设计世界上首只戴在手腕的腕表——卡地亚山度士腕表 (Cartier Santos)。', '', '0', '1', '2013-05-04 18:16:43', '2013-05-04 18:16:43');
INSERT INTO `admin_base_brand` VALUES ('24', 'Panerai', '沛纳海', 'Panerai', 'p', '沛纳海(Panerai) 创立于1860年，以精密机械及卓越品质著称。最早是为意大利皇家海军制作精密仪器和腕表。如今沛纳海已经成为世界知名的高级运动腕表品牌。凭借源自大海的设计灵感，沛纳海 (Panerai) 将品牌定位为运动、休闲领域中的高档腕表。意大利的设计风格和瑞士的专业技术，使得沛纳海 (Panerai) 每一款表都拥有鲜明的品牌风格和优异的质量。', '', '0', '1', '2013-05-04 20:13:14', '2013-05-04 20:13:14');
INSERT INTO `admin_base_brand` VALUES ('25', 'TagHeuer', '豪雅', 'Tag Heuer', 'h', '豪雅(TAG Heuer) 在19世纪钟表工业的黄金时代，由杰克·豪雅的祖父Edouard Heuer于瑞士圣伊蜜儿 (Saint Imier) 镇创立的。自1860年创立以来，一直被誉为瑞士前卫精准制表先锋，是全球奢侈品集团LVMH旗下的的奢华腕表品牌。TAG Heuer坚持创造精确的计时工具和精美绝伦的腕表——现已实现计时精确度达5/10000秒，打造出双陀飞轮计时器等众多成就。', '', '0', '1', '2013-05-04 20:14:38', '2013-05-04 20:14:38');
INSERT INTO `admin_base_brand` VALUES ('26', 'Hermes', '爱马仕', 'Hermès', 'a', '爱马仕（Hermès）始于1837年，是一家忠于传统手工艺，不断创新的国际化企业，拥有箱包、丝巾领带、男、女装等十六类产品系列以及最新开发的家具、室内装饰品及墙纸系列。全球共25个分公司管理及分销来自四大范畴的产品：鞍具及皮革、香水、钟表及餐瓷。1996年在北京开了中国第一家Hermes专卖店，“爱马仕”为大中华区统一中文译名。爱马仕一直秉承着超凡卓越、极至绚烂的设计理念，造就优雅之极的传统典范。', '', '0', '1', '2013-05-04 20:15:54', '2013-05-04 20:15:54');
INSERT INTO `admin_base_brand` VALUES ('27', 'MauriceLacroix', '艾美', 'Maurice Lacroix', 'a', '艾美（Maurice Lacroix）是来自瑞士的年轻品牌,始于1961年,一直以原创设计著称,其匠心系列产品曾经获得全球最佳腕表称号,是全球排名前三的尊贵腕表之一.因为优异的品质与技术，短短30年便从竞争激烈的瑞士钟表业脱颖而出，树立了优异的口碑，而中等的价位使得艾美成为许多年轻精英的不二选择。', '', '0', '1', '2013-05-04 20:19:09', '2013-05-04 20:19:09');
INSERT INTO `admin_base_brand` VALUES ('28', 'BaumeMercier', '名士', 'Baume &amp; Mercier', 'm', '名士（Baume &amp; Mercier）发展源自瑞士侏罗山脉，1830年正式命名为“名士”。成名之初，名士致力于天文台表的制作。凭借 Baume 出色卓越的制表技艺与 Mercier 对艺术的热诚，业务发展迅速，各种荣誉接踵而至。1893年获英国皇室 Kew Observatory 殊荣，1921年获日内瓦钟表业最高荣耀 Pioncon de Geneve，令名士由瑞士闻名至全球，奠定成功的基础。如今名士表款系列包罗万象，各有特色，每一款都是名士追求完美品质和艺术设计的杰作。', '', '0', '1', '2013-05-04 20:21:23', '2013-05-04 20:21:23');
INSERT INTO `admin_base_brand` VALUES ('29', 'Zenith', '真力时', 'Zenith', 'z', '真力时(Zenith)于公元1865年在瑞士创立，拥有146年的悠久历史，瑞士四大真正的钟表制造商之一。 以大胆的创意将机械腕表的精确与美的感受相融合一个半世纪以来，Zenith表厂孜孜不倦，力求完美，为时间奉献一份丰富的礼赞。 真力时(Zenith)将追求美感、真实、正直、精确、精湛的和复杂工艺的价值标准体现得淋漓尽致。更可贵的是，他们不仅发扬悠久的传统，还为其注入新鲜血液。', '', '0', '1', '2013-05-04 20:23:24', '2013-05-04 20:23:24');
INSERT INTO `admin_base_brand` VALUES ('30', 'Longines', '浪琴', 'Longines', 'l', '浪琴（Longines）是一个由欧内斯特‧富兰西林在瑞士的圣艾米尔成立的公司。它的起源可以追述到19世纪30年代。拥有180年悠久历史，是集传统，优雅和运动于一体的专业制表商。不论男士手表还是女士手表均以优雅设计以及精湛制表工艺闻名于世。浪琴表也是众多优雅运动的指定计时器或官方合作伙伴，譬如法网公开赛及众多知名马术运动。业务遍及全球130多个国家。', '', '0', '1', '2013-05-04 20:24:30', '2013-05-04 20:24:30');
INSERT INTO `admin_base_brand` VALUES ('31', '', '赫柏林', 'Michel Herbelin', 'h', '赫柏林（Michel Herbelin）来自法国的豪华腕表品牌，法国腕表销量冠军,用“瑞士芯，法国魂”来理解她则最贴切不过 。其创始人Michel Herbelin，一个热衷于质量、精益求精的手工艺人，一生都在以精湛的手艺制作精密手表，并以超群的鉴赏力和品味去装饰他研制的这些手表。他的多年潜 心研制，使得当时的机械表芯臻于完善，随后又设计创造了他自有的系列款式。他同时也是多项国际上手表技术创新和外形艺术创新的发明人。', '', '0', '2', '2013-05-04 20:26:10', '2013-05-04 20:26:10');
INSERT INTO `admin_base_brand` VALUES ('32', 'Tissot', '天梭', 'Tissot', 't', '天梭（Tissot）——非凡创意，源于传统。凭借150余年的传统瑞士制表工艺和不断创新的设计精神，销量在全球名列前茅，是瑞士制表业中的佼佼者。天梭的目标是用最有竞争力的价格向大众提供具有国际一流品质的计时工具。一直致力于将尖端制表科技和纯正瑞士文化带给全球消费者。瑞士天梭自1983年加入世界最大的手表制造商及分销商斯沃琪集团，成为其中一员，总部设立在瑞士力洛克(Le Locle)，在全球超过150个国家设有服务及推广机构。', '', '0', '1', '2013-05-04 20:27:36', '2013-05-04 20:27:36');
INSERT INTO `admin_base_brand` VALUES ('33', '', '迪沃斯', 'Davosa', 'd', '迪沃斯（Davosa）一个起源于1861年，位于瑞士日内瓦(Geneva)和巴塞尔(Basel)之间的制表工艺重镇——侏罗山区(Mountainous Jura)的哈斯勒(HASLER)制表家族。由独立的家庭企业所经营的Davosa品牌已经遍及全世界，而且在机械表的行列里占有一席之地。其以高品质的男性自动机械表为主，款式设计高雅精致、沉稳 大气，无疑是DAVOSA经典传承最强而有力的体现。使阁下不但醉心于经典华贵的设计风格之中，也会欣赏其精湛技术与细腻质感。', '', '0', '2', '2013-05-04 20:30:08', '2013-05-04 20:30:08');
INSERT INTO `admin_base_brand` VALUES ('34', '', '爱宝时', 'Epos', 'a', '爱宝时（EPOS）手表，一个由瑞士艺术制表大师彼得‧胡佛(Peter Hofer)创立的瑞士名表品牌，彼得‧胡佛先生退休前是宝玑的高级制表大师。当梦想成真、激情成为现实 ， 一个机械艺术产品开发出来， 可以用一句话总结…“制表艺术”， Peter Hofer 为他一生的工作 – 以及他的Epos 系列选择的座右铭。瑞士epos表厂，由Peter Hofer于1983年创立于瑞士钟表城 Bienne 比恩市。该表厂致力于承续1741年瑞士制表艺术传统260多年来呕心沥血发扬光大，為世界表坛开创先河，建立崭新领域。这个融合瑞士古典制表艺术和现代 美学创意的新兴表厂，以超一流的手工，巧夺天工的创作，结合特殊制造工具，将款款精密复杂的机械表芯，勾勒出风格独具、品味超凡的epos爱宝时系列腕表。', '', '0', '2', '2013-05-04 20:32:48', '2013-05-04 20:34:44');
INSERT INTO `admin_base_brand` VALUES ('35', '', '摩纹', 'Marvin Watch C°', 'm', '摩纹(Marvin Watch C°)是创立于1850年的瑞士高级钟表品牌，由马克与艾曼纽Didisheim 两兄弟在位于瑞士伯恩侏罗山区的圣伊米耶(St-Imier)创立，现已拥有160年历史，一直以优质的机芯、新颖现代的外观设计、以及高雅出众的气质，风靡全球70多个国家，同时推出精准可靠、系出名门、风格多样的精品，在热爱机械表的行家心中占有一席之地。', '', '0', '2', '2013-05-04 20:36:09', '2013-05-04 20:36:09');
INSERT INTO `admin_base_brand` VALUES ('36', 'Citizen', '西铁城', 'Citizen', 'x', '西铁城（Citizen），以为全世界全体公民提供高档次的产品和高水准的服务为使命，希望通过“为市民所喜爱，为市民所亲近”的产品，为全人类的美好生活 做贡献。作为一家庞大的跨国企业，西铁城集团在日本设有46家企业，日本海外设有64家分公司，全球合计110家分公司。一直以来，秉承永不止步的创新精 神和不断向未来挑战的品牌理念，西铁城始终行进在国际腕表行业的领先地位。', '', '0', '1', '2013-05-04 20:38:22', '2013-05-04 20:38:22');
INSERT INTO `admin_base_brand` VALUES ('37', 'Mido', '美度', 'Mido', 'm', '美度(Mido)由George Schaeren于1918年在瑞士苏黎士创立。今天美度表公司总部坐落于瑞士Jura山脉中心的勒克勒尔(Le Locle)小镇。瑞士美度表自创立以来，便始终追求将永恒设计和实用功能相结合，在技术领域不倦追求，目的是制造出一块可长时间拥有的高品质腕表。建筑灵感使美度推出了一款又一款值得珍藏的传世表款。', '', '0', '1', '2013-05-04 20:39:14', '2013-05-04 20:39:14');
INSERT INTO `admin_base_brand` VALUES ('38', 'Movado', '摩凡陀', 'Movado', 'm', '摩凡陀（Movado）于1881年在瑞士拉夏德芬创立，是世界著名的钟表制造商之一，以其标志性的博物馆表盘和现代设计美学享誉全球。摩凡陀一直致力于精湛的瑞士制表工艺及卓越非凡的设计，“永动不息”是摩凡陀不断创造高品质独特腕表的源动力。长期丰富的文化遗产、设计的创新和与艺术的密切联系一直定义着今天摩凡陀的品牌标识。', '', '0', '1', '2013-05-04 20:40:51', '2013-05-04 20:40:51');
INSERT INTO `admin_base_brand` VALUES ('39', '', '时度', 'Doxa', 's', '时度（DOXA）创立于1889年，瑞士制表名家Georges Ducommun,在瑞士中部钟表区的小城Biel，建立了一个制作钟表的工厂。早在1906年时度表便获得意大利颁发的金牌。1910年，时度便注册了品牌并沿用至今，您现在看到的时度（DOXA）标志，在近百年前就在使用了。进入近代，时度广泛出现在汽车、足球等领域，曾佩带在当年世界杯冠军德国每一个队员手腕上。时度表也是潜水手表的始祖。', '', '0', '2', '2013-05-04 20:43:01', '2013-05-04 20:43:01');
INSERT INTO `admin_base_brand` VALUES ('40', 'Titoni', '梅花', 'Titoni', 'm', '梅花（Titoni）是进驻中国较早的瑞士品牌。梅花表的生产厂家是一家典型的瑞士传统表厂，自1919年在瑞士格林肯建厂以来，相传三代，是现今少有的独立家族制表企业。该公司的一个特点是其产品中有95%是高度精准的机械腕表。其公司广告标语为“机械艺术的典范”。在中国大陆有一定的市场。', '', '0', '1', '2013-05-04 20:47:00', '2013-05-04 20:47:00');
INSERT INTO `admin_base_brand` VALUES ('41', '', '依波路', 'Ernest Borel', 'y', '依波路(Ernest Borel)，诞生于1856年，是著名瑞士腕表品牌，拥有150多年的悠久历史。品牌标志一对翩翩起舞的情侣剪影，这一经典形象感动了一个半世纪以来佩戴依波路表的情侣，成就出无数经典动人的浪漫时刻。请一起来感受依波路传奇般的品质和丰润厚重的文化。', '', '0', '2', '2013-05-04 20:48:51', '2013-05-04 20:48:51');
INSERT INTO `admin_base_brand` VALUES ('42', '', '英纳格', 'Enicar', 'y', '英纳格(ENICAR)起源于1854年一家古老的瑞士钟表手工制造作坊。ENICAR的名字，便是由RACINE家族，将其姓名倒转过来写而得名，籍以代表其家族百年以来代代相传精湛工艺的优良传统。英纳格是瑞士钟表业历史上的重要始祖，早于1910年，英纳格所出产的陀表，因其精准度而备受推崇。1988年，英纳格被香港华明行收购，但依然在瑞士进行生产。', '', '0', '2', '2013-05-04 20:49:40', '2013-05-04 20:49:40');
INSERT INTO `admin_base_brand` VALUES ('43', 'Hamilton', '汉米尔顿', 'Hamilton', 'h', '汉米尔顿（HAMILTON）在品牌创立的一百多年代历史中，汉米尔顿不断书写和创造着传奇与辉煌。自1892年成立并发展至今，以其精准耐用的实用功能及其一贯的粗犷、正直、创新、大胆坚定的美国设计风格，深受欢迎。与好莱坞300多部影片的合作，更使得HAMILTON汉米尔顿表成为最富美国文化的代表性品牌之一。', '', '0', '1', '2013-05-04 20:51:17', '2013-05-04 20:51:17');
INSERT INTO `admin_base_brand` VALUES ('44', '', '百来苏蒂', 'Bruno Söehnle', 'b', '百来苏蒂（Bruno Söehnle）早在1845年，著名表匠受德国政府资助，在德国东部的格拉苏蒂镇(Glashütte)建立了钟表生产基地。但是经过两次世界大战，格拉苏蒂镇的钟表制 造业一下子与世隔绝，1950年格拉苏蒂镇，各大制表专家重整，其中BRUON SöHNLE(百来苏迪)此时此刻在格拉苏蒂镇诞生。', '', '0', '1', '2013-05-04 20:53:47', '2013-05-04 21:12:22');
INSERT INTO `admin_base_brand` VALUES ('45', '', '玛莎拉蒂', 'Maserati', 'm', '玛莎拉蒂(Maserati)是一家意大利豪华汽车制造商，1914年12月1日成立于博洛尼亚(Bologna)，公司总部现设于摩德纳(Modena)，品牌的标志为一支三叉戟。1993年菲亚特(Fiat S.p.A.)收购玛莎拉蒂，但品牌得以保留。而今的玛莎拉蒂全新轿跑系列是意大利顶尖轿跑车制作技术的体现，也是意大利设计美学以及优质工匠设计思维的完美结合。', '', '0', '2', '2013-05-04 20:56:15', '2013-05-04 20:56:15');
INSERT INTO `admin_base_brand` VALUES ('46', '', 'CK', 'Calvin Klein', 'c', 'Calvin Klein(简称CK)，是一个美国时装品牌，于1968年成立，创始者为同名设计师卡尔文·克莱因，曾经连续四度获得知名的服装奖项;“我要最纯、最简约、最时尚”——这就是Calvin Klein[1]精神。他的设计的灵感来源于人性中对于高贵的追求，并建立在对人类共同追求的价值：爱、永恒和分享的诠释上。', '', '0', '2', '2013-05-04 20:58:04', '2013-05-04 20:58:04');
INSERT INTO `admin_base_brand` VALUES ('47', '', '雅克利曼', 'Jacques Lemans', 'y', '雅克利曼（Jacques Lemans）品牌由Alfred 与 Norbert Riedl兄弟于1977年建立，公司最初位于瑞士，生产基地位于德国。随后公司迁往奥地利，最终落户奥地利中部的St. Veit an der Glan/Kärnten。Jacques Lemans公司是奥地利最大的奢侈品集团之一，产品质量出众，设计时尚不落俗套，广受赞誉，是钟表业界冉冉升起的一颗新星。', '', '0', '2', '2013-05-04 21:00:06', '2013-05-04 21:00:06');
INSERT INTO `admin_base_brand` VALUES ('48', '', 'Time Force', 'Time Force', 't', 'Time Force来自西班牙，拥有四十多年的历史，产品遍布全球50多个国家和地区。Time-“时刻”把握，Force-“力求”完美！Time Force是时间与力量完美交融，寓意着时尚、现代、年轻、活力与自信。每一款Time Force系列腕表的形象和鲜明的个性都令其熠熠生辉。', '', '0', '2', '2013-05-04 21:01:32', '2013-05-04 21:01:32');
INSERT INTO `admin_base_brand` VALUES ('49', '', '盖尔斯', 'Guess', 'g', '盖尔斯（GUESS）成立于1981年的，最初是从牛仔起家，一心向往美国风情的Marciano四兄弟，从法国南部来到这块自由天堂，却碰上了美国服饰业的萧条时期，可是，他们首次推出的「梦露式」紧身牛仔裤却在一夕之间销售一空，于是GUESS品牌正式成立。代表GUESS品牌象征的“？”常出现在服装设计中，而倒三角形的布标则常见于牛仔裤的后口袋。GUESS的手表也非常特殊，能够表现出强烈的个人品味，受到很多爱好该品牌的年轻朋友喜爱。', '', '0', '2', '2013-05-04 21:03:11', '2013-05-04 21:03:11');
INSERT INTO `admin_base_brand` VALUES ('50', 'Seiko', '精工', 'Seiko', 'j', '精工(SEIKO)是一家著名的日本制表公司，始创于1881年，公司原名为服部计时店，1892年改名为精工舍。1924年，发表了第一只正式使用精工品牌的手表。1969年，精工表推出了世界上第一款指针式石英手表-SEIKO ASTRON35SQ。', '', '0', '1', '2013-05-04 21:04:18', '2013-05-04 21:04:18');
INSERT INTO `admin_base_brand` VALUES ('51', 'Casio', '卡西欧', 'Casio', 'k', '卡西欧（Casio）手表是日本三大品牌之一，多年来以真正多功能的G-SHOCK手表著称于世。卡西欧手表所代表的活力、年轻、时尚、多功能的品牌形象已深入民心。卡西欧公司一向以技术领先于同行为己任，历年都会有技术的突破。将高、精、尖的先进科技结合新型液晶技术，恰当地运用于腕上时计，不断地提高腕上时计的发展水平——卡西欧一贯以来所倡导的“腕上科技”精神在中国国内也被得以沿袭和传播。', '', '0', '1', '2013-05-04 21:06:34', '2013-05-04 21:06:34');
INSERT INTO `admin_base_brand` VALUES ('52', 'Orient', '东方双狮', 'Orient', 'd', '东方双狮（ORIENT）手表是很早进入中国市场的老牌日本品牌表，因其商标LOGO是两只狮子，以前在中国俗称“双狮”牌。在中国80年代是主流的手表品牌。 双狮标记是东方表(ORIENT)商标中的其中一个组成部分， 商标中左右两边共用两只狮子。由于早期的中国消费者大多因为双狮商标较容易识别， 或未能读出ORIENT的读音， 双狮标志早已深入民心。', '', '0', '1', '2013-05-04 21:08:10', '2013-05-04 21:09:55');
INSERT INTO `admin_base_brand` VALUES ('53', '', '爱彼特', 'Arbutus', 'a', '爱彼特（Arbutus）手表设 计简洁、品味高、配合时代动向为主流，深受广泛顾客的爱戴，每一只Arbutus手表的金属部分都采用316L精钢制造，皮革部分均能符合欧洲严格的防皮 肤敏感规格，最基本要求防水度不少于30米水深压力，而且所有机芯装配前都经过72小时连续运作测验合格方可进行生产流程，产品出厂前必须四面运行48小 时以及高温差，表带拉力等测试，所以市面上的每一只Arbutus手表都符合高品质要求。', '', '0', '2', '2013-05-04 21:10:46', '2013-05-04 21:10:46');
INSERT INTO `admin_base_brand` VALUES ('54', '', '蔻驰', 'Coach', 'k', '蔻驰 (Coach) 是美国著名皮革制品奢饰品品牌。Coach总部位于纽约，是首屈一指的主营男女精品配饰及礼品的美国企业。蔻驰 (Coach) 于1941年成立，当时为一所家族经营的工作坊。在美国纽约曼克顿的一间阁楼里，六位工匠以世代相传的手工技术制作了一系列皮革产品。自此，蔻驰 (Coach) 独特的手工工艺和高质量的制作被那些颇为讲究品质的顾客青睐。', '', '0', '2', '2013-05-04 21:12:58', '2013-05-04 21:12:58');
INSERT INTO `admin_base_brand` VALUES ('55', '', '芬迪', 'Fendi', 'f', '芬迪 (Fendi) 的故事开始于1925年：在罗马Via del Plebiscito一个小工场内，爱德华多·芬迪 (Edoardo Fendi) 和阿黛勒·芬迪 (Adele Fendi) 夫妇制造手袋和皮草。在二次世界大战之后，公司开始大展鸿图。爱德华多·芬迪和和阿黛勒·芬迪的五个女儿-Paola，Anna，Franca，Carla和Alda Fendi在1946年加入这个家族企业。今天，芬迪 (Fendi) 继续以创新的设计震撼时装界。', '', '0', '2', '2013-05-04 21:14:46', '2013-05-04 21:14:46');
INSERT INTO `admin_base_brand` VALUES ('56', '', 'Police', 'Police', 'p', 'Police创立于1983年，在美丽的意大利威尼斯水城，诞生了第一副POLICE品牌的太阳眼镜。贯彻着时尚、性格、潮流的宗旨POLICE品牌注重产品设计的细节，融合触觉感受，以野性的色彩组合和华光四射的标志，用特有的“COOL &amp; SEXY”的风格，诠释着意大利的生活格调与精神，为全球积极进取，独立而有创意，个性十足和不刻守常规的年轻人所追随和推崇，成为全球一个重要的引导生 活潮流的品牌。', '', '0', '2', '2013-05-04 21:16:35', '2013-05-04 21:16:35');
INSERT INTO `admin_base_brand` VALUES ('57', 'GirardPerregaux', '芝柏', 'Girard Perregaux', 'b', '', '', '0', '0', '2013-05-04 21:26:34', '2013-05-04 21:26:34');
INSERT INTO `admin_base_brand` VALUES ('58', 'Breitling', '百年灵', 'Breitling', 'b', '', '', '0', '0', '2013-05-04 21:27:55', '2013-05-04 21:27:55');
INSERT INTO `admin_base_brand` VALUES ('59', 'Chopard', '萧邦', 'Chopard', 'x', '', '', '0', '0', '2013-05-04 21:28:55', '2013-05-04 21:28:55');
INSERT INTO `admin_base_brand` VALUES ('60', 'Hublot', '宇舶', 'Hublot', 'y', '', '', '0', '0', '2013-05-04 21:29:49', '2013-05-04 21:29:49');
INSERT INTO `admin_base_brand` VALUES ('61', 'Juvenia', '尊皇', 'Juvenia', 'z', '', '', '0', '0', '2013-05-04 21:30:56', '2013-05-04 21:30:56');
INSERT INTO `admin_base_brand` VALUES ('62', 'Corum', '昆仑', 'Corum', 'k', '', '', '0', '0', '2013-05-04 21:31:51', '2013-05-04 21:31:51');
INSERT INTO `admin_base_brand` VALUES ('63', 'BellRoss', '柏莱士', 'Bell &amp; Ross', 'b', '', '', '0', '0', '2013-05-04 21:33:46', '2013-05-04 21:33:46');
INSERT INTO `admin_base_brand` VALUES ('64', 'Nomos', 'Nomos', 'Nomos', 'n', '', '', '0', '0', '2013-05-04 21:35:34', '2013-05-04 21:35:34');
INSERT INTO `admin_base_brand` VALUES ('65', 'Montblanc', '万宝龙', 'Montblanc', 'w', '', '', '0', '0', '2013-05-04 21:36:22', '2013-05-04 21:36:22');
INSERT INTO `admin_base_brand` VALUES ('66', 'CarlFBucherer', '宝齐莱', 'Carl F.Bucherer', 'b', '', '', '0', '0', '2013-05-04 21:37:29', '2013-05-04 21:37:29');
INSERT INTO `admin_base_brand` VALUES ('67', 'RaymondWeil', '雷蒙威', 'Raymond Weil', 'l', '', '', '0', '0', '2013-05-04 21:39:05', '2013-05-04 21:39:05');
INSERT INTO `admin_base_brand` VALUES ('68', 'Oris', '豪利时', 'Oris', 'h', '', '', '0', '0', '2013-05-04 21:41:03', '2013-05-04 21:41:03');
INSERT INTO `admin_base_brand` VALUES ('69', 'Rado', '雷达', 'Rado', 'l', '', '', '0', '0', '2013-05-04 21:41:52', '2013-05-04 21:41:52');
INSERT INTO `admin_base_brand` VALUES ('70', 'BallWatch', '波尔', 'Ball Watch', 'b', '', '', '0', '0', '2013-05-04 21:43:00', '2013-05-04 21:43:00');
INSERT INTO `admin_base_brand` VALUES ('71', 'BeiJing', '北京', 'BeiJing', 'b', '', '', '0', '0', '2013-05-04 21:45:31', '2013-05-04 21:45:31');
INSERT INTO `admin_base_brand` VALUES ('72', 'Certina', '雪铁纳', 'Certina', 'x', '', '', '0', '0', '2013-05-04 21:47:18', '2013-05-04 21:47:18');
INSERT INTO `admin_base_brand` VALUES ('73', 'Seagull', '海鸥', 'Seagull', 'h', '', '', '0', '0', '2013-05-04 21:48:51', '2013-05-04 21:48:51');
INSERT INTO `admin_base_brand` VALUES ('74', 'Bvlgari', '宝格丽', 'Bvlgari', 'b', '', '', '0', '0', '2013-05-04 21:49:35', '2013-05-04 21:49:35');
INSERT INTO `admin_base_brand` VALUES ('75', 'Gucci', '古琦', 'Gucci', 'g', '', '', '0', '0', '2013-05-04 21:50:44', '2013-05-04 21:50:44');
INSERT INTO `admin_base_brand` VALUES ('76', 'Chanel', '香奈儿', 'Chanel', 'x', '', '', '0', '0', '2013-05-04 21:51:17', '2013-05-04 21:51:17');
INSERT INTO `admin_base_brand` VALUES ('77', 'Dior', '迪奥', 'Dior', 'd', '', '', '0', '0', '2013-05-04 21:52:40', '2013-05-04 21:52:40');
INSERT INTO `admin_base_brand` VALUES ('78', 'LV', 'LV', 'LV', 'l', '', '', '0', '0', '2013-05-04 21:53:07', '2013-05-04 21:53:07');

-- ----------------------------
-- Table structure for `admin_base_lang`
-- ----------------------------
DROP TABLE IF EXISTS `admin_base_lang`;
CREATE TABLE `admin_base_lang` (
  `blid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '语言编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '语言名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`blid`),
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='语言管理';

-- ----------------------------
-- Records of admin_base_lang
-- ----------------------------
INSERT INTO `admin_base_lang` VALUES ('1', 'zh-cn', '中文简体', '1', '1', '2013-01-27 13:33:08', '2013-01-27 13:35:32');
INSERT INTO `admin_base_lang` VALUES ('2', 'en-us', '英文', '2', '1', '2013-01-27 13:35:42', '2013-01-27 13:35:42');
INSERT INTO `admin_base_lang` VALUES ('3', 'zh-tw', '中文繁体', '0', '0', '2013-01-27 13:35:57', '2013-01-27 13:35:57');

-- ----------------------------
-- Table structure for `admin_base_lang_field`
-- ----------------------------
DROP TABLE IF EXISTS `admin_base_lang_field`;
CREATE TABLE `admin_base_lang_field` (
  `blfid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '语言编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '语言名称',
  `type` tinyint(1) DEFAULT '0' COMMENT '语言类型：0为字符串，1为json数组',
  `zh-cn` varchar(500) DEFAULT '' COMMENT '中文简体',
  `en-us` varchar(500) DEFAULT '' COMMENT '英文',
  `zh-tw` varchar(500) DEFAULT '' COMMENT '中文繁体',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`blfid`),
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='语言字段管理';

-- ----------------------------
-- Records of admin_base_lang_field
-- ----------------------------
INSERT INTO `admin_base_lang_field` VALUES ('1', 'SiteMap_index', '网站地图', '0', '网站地图', 'Site Map', '', '0', '1', '2013-04-23 21:08:11', '2013-04-23 21:12:41');
INSERT INTO `admin_base_lang_field` VALUES ('2', 'WorkYear', '工作年限', '1', '[&quot;不限&quot;,&quot;在读学生&quot;,&quot;应届毕业生&quot;,&quot;一年以上&quot;,&quot;二年以上&quot;,&quot;三年以上&quot;,&quot;五年以上&quot;,&quot;八年以上&quot;,&quot;十年以上&quot;]', '', '', '0', '1', '2013-04-23 21:12:57', '2013-04-24 11:04:14');
INSERT INTO `admin_base_lang_field` VALUES ('3', 'PeovideSalary', '月薪范围', '1', '[&quot;面议&quot;,&quot;1500以下&quot;,&quot;1500-2999&quot;,&quot;3000-4499&quot;,&quot;4500-5999&quot;,&quot;6000-7999&quot;,&quot;8000-9999&quot;,&quot;10000-14999&quot;,&quot;15000-19999&quot;,&quot;20000-29999&quot;,&quot;30000-49999&quot;,&quot;50000及以上&quot;]', '', '', '0', '1', '2013-04-23 21:14:55', '2013-04-24 15:30:51');
INSERT INTO `admin_base_lang_field` VALUES ('4', 'DegreeFrom', '学历要求', '1', '[&quot;不限&quot;,&quot;初中&quot;,&quot;高中&quot;,&quot;中专&quot;,&quot;大专&quot;,&quot;本科&quot;,&quot;硕士&quot;,&quot;博士&quot;]', '', '', '0', '1', '2013-04-23 21:16:06', '2013-04-24 11:04:25');
INSERT INTO `admin_base_lang_field` VALUES ('5', 'CycleType', '循环类型', '1', '[&quot;请选择&quot;,&quot;每分钟&quot;,&quot;每小时&quot;,&quot;每天&quot;,&quot;每周&quot;,&quot;每月&quot;,&quot;每年&quot;]', '', '', '0', '1', '2013-05-09 10:37:54', '2013-05-09 10:37:54');

-- ----------------------------
-- Table structure for `admin_base_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `admin_base_product_category`;
CREATE TABLE `admin_base_product_category` (
  `bpcid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `parent_id` int(6) NOT NULL DEFAULT '0' COMMENT '分类父级ID',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '分类编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `crumb` varchar(100) NOT NULL DEFAULT '' COMMENT '面包屑，用横杠分割',
  `tsid` int(8) DEFAULT '0' COMMENT '淘宝sid字段',
  `tleaf` tinyint(1) DEFAULT '0' COMMENT '淘宝leaf字段',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`bpcid`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1619 DEFAULT CHARSET=utf8 COMMENT='基础商品分类管理';

-- ----------------------------
-- Records of admin_base_product_category
-- ----------------------------
INSERT INTO `admin_base_product_category` VALUES ('1', '0', 'yxhf', '游戏话费', '1-', '1', '0', '1', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('2', '0', 'fzxb', '服装鞋包', '2-', '2', '0', '2', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('3', '0', 'sjsm', '手机数码', '3-', '3', '0', '3', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('4', '0', 'jydq', '家用电器', '4-', '4', '0', '4', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('5', '0', 'mzsp', '美妆饰品', '5-', '5', '0', '5', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('6', '0', 'myyp', '母婴用品', '6-', '6', '0', '6', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('7', '0', 'jjjc', '家居建材', '7-', '7', '0', '7', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('8', '0', 'bhsp', '百货食品', '8-', '8', '0', '8', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('9', '0', 'ydhw', '运动户外', '9-', '9', '0', '9', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('10', '0', 'whyl', '文化玩乐', '10-', '10', '0', '10', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('11', '0', 'shfw', '生活服务', '11-', '11', '0', '11', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('12', '0', 'qt', '其他', '12-', '0', '0', '12', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('13', '1', 'txqqzq', '腾讯QQ专区', '1-13-', '40', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('14', '1', 'wyzb yxb zh dl', '网游装备/游戏币/帐号/代练', '1-14-', '50011665', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('15', '1', 'sjhm tc zzyw', '手机号码/套餐/增值业务', '1-15-', '50008907', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('16', '1', 'wlyxdk', '网络游戏点卡', '1-16-', '99', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('17', '1', 'yd lt dxczzx', '移动/联通/电信充值中心', '1-17-', '50004958', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('18', '2', 'nz', '男装', '2-18-', '30', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('19', '2', 'lxnx', '流行男鞋', '2-19-', '50011740', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('20', '2', 'nz nsjp', '女装/女士精品', '2-20-', '16', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('21', '2', 'nx', '女鞋', '2-21-', '50006843', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('22', '2', 'xbpj rxnb nb', '箱包皮具/热销女包/男包', '2-22-', '50006842', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('23', '2', 'nsny nsny jjf', '女士内衣/男士内衣/家居服', '2-23-', '1625', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('24', '2', 'fspj pd mz wj', '服饰配件/皮带/帽子/围巾', '2-24-', '50010404', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('25', '3', 'ghjpsm', '国货精品数码', '3-25-', '50023904', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('26', '3', 'sj', '手机', '3-26-', '1512', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('27', '3', 'smxj dfxj sxj', '数码相机/单反相机/摄像机', '3-27-', '14', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('28', '3', 'mp3 mp4 ipod lyb', 'MP3/MP4/iPod/录音笔', '3-28-', '1201', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('29', '3', 'bjbdn', '笔记本电脑', '3-29-', '1101', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('30', '3', 'pbdn mid', '平板电脑/MID', '3-30-', '50019780', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('31', '3', 'tsj ytj fwq', '台式机/一体机/服务器', '3-31-', '50018222', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('32', '3', 'wlsb wlxg', '网络设备/网络相关', '3-32-', '50018264', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('33', '3', '3csmpj', '3C数码配件', '3-33-', '50008090', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('34', '3', 'sck up cc ydyp', '闪存卡/U盘/存储/移动硬盘', '3-34-', '50012164', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('35', '3', 'bgsb hc xgfw', '办公设备/耗材/相关服务', '3-35-', '50007218', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('36', '3', 'dzcd dzs whyp', '电子词典/电纸书/文化用品', '3-36-', '50018004', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('37', '3', 'dw pj yx gl', '电玩/配件/游戏/攻略', '3-37-', '20', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('38', '4', 'djd', '大家电', '4-38-', '50022703', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('39', '4', 'yydq', '影音电器', '4-39-', '50011972', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('40', '4', 'shdq', '生活电器', '4-40-', '50012100', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('41', '4', 'cfdq', '厨房电器', '4-41-', '50012082', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('42', '4', 'grhl bj amqc', '个人护理/保健/按摩器材', '4-42-', '50002768', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('43', '5', 'cz xs mzgj', '彩妆/香水/美妆工具', '5-43-', '50010788', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('44', '5', 'mrhf mt jy', '美容护肤/美体/精油', '5-44-', '1801', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('45', '5', 'mfhf jf', '美发护发/假发', '5-45-', '50023282', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('46', '5', 'zb zs c hj', '珠宝/钻石/翡翠/黄金', '5-46-', '50011397', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('47', '5', 'zippo rsjd yj', 'ZIPPO/瑞士军刀/眼镜', '5-47-', '28', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('48', '5', 'sp lxss ssspx', '饰品/流行首饰/时尚饰品新', '5-48-', '50013864', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('49', '5', 'sb', '手表', '5-49-', '50468001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('50', '6', 'nf fs yyp ls', '奶粉/辅食/营养品/零食', '6-50-', '35', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('51', '6', 'np xh wb tcc', '尿片/洗护/喂哺/推车床', '6-51-', '50014812', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('52', '6', 'yfz ycfyp yy', '孕妇装/孕产妇用品/营养', '6-52-', '50022517', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('53', '6', 'tz tx qzz', '童装/童鞋/亲子装', '6-53-', '50008165', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('54', '6', 'wj mx dm zj yz', '玩具/模型/动漫/早教/益智', '6-54-', '25', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('55', '7', 'jjsp', '家居饰品', '7-55-', '50020808', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('56', '7', 'tssgy', '特色手工艺', '7-56-', '50020857', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('57', '7', 'zzjj', '住宅家具', '7-57-', '50008164', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('58', '7', 'sy bgjj', '商业/办公家具', '7-58-', '50020611', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('59', '7', 'jzzc', '家装主材', '7-59-', '27', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('60', '7', 'jcjc', '基础建材', '7-60-', '50020332', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('61', '7', 'wj gj', '五金/工具', '7-61-', '50020485', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('62', '7', 'dz dg', '电子/电工', '7-62-', '50020579', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('63', '7', 'csyp byrs', '床上用品/布艺软饰', '7-63-', '50008163', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('64', '7', 'zxsj sg jl', '装修设计/施工/监理', '7-64-', '50023804', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('65', '8', 'jjry hq cylp', '居家日用/婚庆/创意礼品', '8-65-', '21', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('66', '8', 'cf cyyj', '厨房/餐饮用具', '8-66-', '50016349', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('67', '8', 'qj wy sn zlyj', '清洁/卫浴/收纳/整理用具', '8-67-', '50016348', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('68', '8', 'ctzbyyp', '传统滋补营养品', '8-68-', '50020275', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('69', '8', 'ls jg tc', '零食/坚果/特产', '8-69-', '50002766', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('70', '8', 'lymm nbgh dwp', '粮油米面/南北干货/调味品', '8-70-', '50016422', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('71', '8', 'cryp by jsyp', '成人用品/避孕/计生用品', '8-71-', '2813', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('72', '8', 'xhqjj wsj z x', '洗护清洁剂/卫生巾/纸/香薰', '8-72-', '50025705', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('73', '8', 'c kf cy', '茶/咖啡/冲饮', '8-73-', '50026316', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('74', '8', 'bjp ssyybcj', '保健品/膳食营养补充剂', '8-74-', '50026800', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('75', '8', 'scrl xxsg ss', '水产肉类/新鲜蔬果/熟食', '8-75-', '50050359', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('76', '9', 'yd  js qmyp', '运动/瑜伽/健身/球迷用品', '9-76-', '50010728', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('77', '9', 'hw ds yy lxyp', '户外/登山/野营/旅行用品', '9-77-', '50013886', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('78', '9', 'ydf xxfz', '运动服/休闲服装', '9-78-', '50011699', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('79', '9', 'ydxnew', '运动鞋new', '9-79-', '50012029', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('80', '9', 'ydb hwb pj', '运动包/户外包/配件', '9-80-', '50510002', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('81', '10', 'jdmp djxl lyfw', '景点门票/度假线路/旅游服务', '10-81-', '50025707', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('82', '10', 'tjjd tskz gylg', '特价酒店/特色客栈/公寓旅馆', '10-82-', '50011949', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('83', '10', 'gd yb zh sc', '古董/邮币/字画/收藏', '10-83-', '23', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('84', '10', 'sj zz bz', '书籍/杂志/报纸', '10-84-', '33', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('85', '10', 'yl ys mx yx', '音乐/影视/明星/音像', '10-85-', '34', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('86', '10', 'lq jt gq pj', '乐器/吉他/钢琴/配件', '10-86-', '50017300', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('87', '10', 'cw cwspjyp', '宠物/宠物食品及用品', '10-87-', '29', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('88', '10', 'jtp', '交通票', '10-88-', '50014442', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('89', '11', 'gxdz sjfw diy', '个性定制/设计服务/DIY', '11-89-', '50025004', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('90', '11', 'gwthq dgmb', '购物提货券/蛋糕面包', '11-90-', '50026555', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('91', '11', 'xxyl', '休闲娱乐', '11-91-', '50026523', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('92', '11', 'cyms', '餐饮美食', '11-92-', '50008075', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('93', '11', 'csk scgwk', '超市卡/商场购物卡', '11-93-', '50019095', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('94', '11', 'jypx', '教育培训', '11-94-', '50014927', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('95', '11', 'qc yp pj gz', '汽车/用品/配件/改装', '11-95-', '26', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('96', '11', 'sy sxfw', '摄影/摄像服务', '11-96-', '50050471', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('97', '11', 'xhsd hhfz lzyy', '鲜花速递/花卉仿真/绿植园艺', '11-97-', '50007216', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('98', '11', 'dzpz', '电子凭证', '11-98-', '50018252', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('99', '11', 'wd wlfw rj', '网店/网络服务/软件', '11-99-', '50014811', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('100', '11', 'fc zf xf esf wtfw', '房产/租房/新房/二手房/委托服务', '11-100-', '50023575', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('101', '11', 'wm ws dcfw', '外卖/外送/订餐服务', '11-101-', '50024451', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('102', '11', 'xc esc', '新车/二手车', '11-102-', '50024971', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('103', '11', 'dy yc tyss', '电影/演出/体育赛事', '11-103-', '50025110', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('104', '11', 'bdhshfw', '本地化生活服务', '11-104-', '50025111', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('105', '11', 'mtc pj qszb', '摩托车/配件/骑士装备', '11-105-', '50074001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('106', '11', 'wldpdj yhq', '网络店铺代金/优惠券', '11-106-', '50158001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('107', '12', 'fwsc', '服务市场', '12-107-', '50488001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('108', '12', 'tbtc', '淘宝同城', '12-108-', '50602001', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('109', '12', 'qt', '其他', '12-109-', '50023724', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('110', '12', 'fwsp', '服务商品', '12-110-', '50230002', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('111', '13', 'dlqqtb', '点亮QQ图标', '1-13-111-', '50010890', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('112', '13', 'qqb qqk', 'QQ币/QQ卡', '1-13-112-', '50005462', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('113', '13', 'qqzzfw', 'QQ增值服务', '1-13-113-', '50007212', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('114', '13', 'qqx', 'QQ秀', '1-13-114-', '50005457', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('115', '13', 'qqyxb hld', 'QQ游戏币/欢乐豆', '1-13-115-', '50007210', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('116', '13', 'qqcw', 'QQ宠物', '1-13-116-', '50005458', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('117', '13', 'qqkj', 'QQ空间', '1-13-117-', '50005460', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('118', '13', 'qqys', 'QQ音速', '1-13-118-', '50007185', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('119', '13', 'qd', 'Q点', '1-13-119-', '50008049', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('120', '13', 'qqyxdtdj', 'QQ游戏大厅道具', '1-13-120-', '50007211', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('121', '13', 'qqqt', 'QQ其它', '1-13-121-', '50005491', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('122', '13', 'txyx', '腾讯游戏', '1-13-122-', '50005461', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('123', '14', 'chinajoy', 'chinajoy', '1-14-123-', '50026679', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('124', '14', 'jhmcshzq', '激活码测试号专区', '1-14-124-', '50010609', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('125', '14', 'sjyx', '手机游戏', '1-14-125-', '50002479', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('126', '14', 'wyyxwp zy', '网页游戏物品/资源', '1-14-126-', '50010916', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('127', '14', 'yxb', '游戏币', '1-14-127-', '50011752', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('128', '14', 'yxzb', '游戏装备', '1-14-128-', '50011751', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('129', '14', 'yxzh', '游戏帐号', '1-14-129-', '50011753', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('130', '14', 'yxdl', '游戏代练', '1-14-130-', '50011754', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('131', '15', '3gwxswzfk', '3G无线上网资费卡', '1-15-131-', '50006853', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('132', '15', '400dh', '400电话', '1-15-132-', '50023365', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('133', '15', 'hygjyw', '合约购机业务', '1-15-133-', '50024820', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('134', '15', 'ipdhk ctk', 'IP电话卡/长途卡', '1-15-134-', '150403', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('135', '15', 'lyhtc zzywbl', '老用户套餐/增值业务办理', '1-15-135-', '50023366', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('136', '15', 'lyhycyh', '老用户预存优惠', '1-15-136-', '50026336', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('137', '15', 'skypeczzq', 'Skype充值专区', '1-15-137-', '50005109', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('138', '15', 'wldhk', '网络电话卡', '1-15-138-', '150404', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('139', '15', 'wifird wxtc', 'WIFI热点/无线套餐', '1-15-139-', '50025151', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('140', '15', 'xrwsjhtc', '新入网手机号套餐', '1-15-140-', '50025114', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('141', '15', 'yxkdjf', '有线宽带缴费', '1-15-141-', '50016361', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('142', '15', 'yxkdtcbl', '有线宽带套餐办理', '1-15-142-', '50025150', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('143', '16', 'a-aezg', 'A-艾尔之光', '1-16-143-', '50026064', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('144', '16', 'b-bfdk', 'B-边锋点卡', '1-16-144-', '50007849', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('145', '16', 'b-bwdk', 'B-霸王点卡', '1-16-145-', '50007396', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('146', '16', 'b-cdk', 'B-飚车点卡', '1-16-146-', '50007414', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('147', '16', 'b-bkcs', 'B-波克城市', '1-16-147-', '50026073', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('148', '16', 'c-cyoldk', 'C-穿越OL点卡', '1-16-148-', '50024956', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('149', '16', 'c-cqwc', 'C-春秋外传', '1-16-149-', '50024934', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('150', '16', 'c-cjsh2dk', 'C-成吉思汗2点卡', '1-16-150-', '50007465', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('151', '16', 'c-cfddk', 'C-冲锋岛点卡', '1-16-151-', '50007477', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('152', '16', 'c-chddk', 'C-彩虹岛点卡', '1-16-152-', '50007456', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('153', '16', 'c-cwwgdk', 'C-宠物王国点卡', '1-16-153-', '50024993', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('154', '16', 'c-cq3', 'C-传奇3', '1-16-154-', '50026036', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('155', '16', 'c-cqgldk', 'C-传奇归来点卡', '1-16-155-', '50007943', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('156', '16', 'c-cqwcdk', 'C-传奇外传点卡', '1-16-156-', '50007883', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('157', '16', 'c-cqsjdk', 'C-传奇世界点卡', '1-16-157-', '50007398', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('158', '16', 'c-csqycdk', 'C-传世群英传点卡', '1-16-158-', '50007874', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('159', '16', 'c-cbdk', 'C-赤壁点卡', '1-16-159-', '50007810', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('160', '16', 'c-cyhxdk', 'C-穿越火线点卡', '1-16-160-', '50008021', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('161', '16', 'c-csxy', 'C-创世西游', '1-16-161-', '50024767', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('162', '16', 'c-cgahfdk', 'C-CGA浩方点卡', '1-16-162-', '50007822', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('163', '16', 'c-cjwzdk', 'C-超级舞者点卡', '1-16-163-', '50007416', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('164', '16', 'c-cjpp', 'C-超级跑跑', '1-16-164-', '50026037', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('165', '16', 'c-csws', 'C-传世无双', '1-16-165-', '50026040', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('166', '16', 'c-cqqcdk', 'C-春秋Q传点卡', '1-16-166-', '50007856', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('167', '16', 'c-czn', 'C-苍穹之怒', '1-16-167-', '50026056', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('168', '16', 'c-csoldk', 'C-创世OL点卡', '1-16-168-', '50502001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('169', '16', 'd-djdl', 'D-第九大陆', '1-16-169-', '50026436', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('170', '16', 'd- dbcsdk', 'D- 夺宝传世点卡', '1-16-170-', '50024957', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('171', '16', 'd-dhsdk', 'D-大话水浒点卡', '1-16-171-', '50024998', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('172', '16', 'd-dxcyysdk', 'D-地下城与勇士点卡', '1-16-172-', '50007428', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('173', '16', 'd-dhxy2dk', 'D-大话西游2点卡', '1-16-173-', '50007410', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('174', '16', 'd-djyxdk', 'D-刀剑英雄点卡', '1-16-174-', '50007413', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('175', '16', 'd-dhhsddk', 'D-大航海时代点卡', '1-16-175-', '50007420', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('176', '16', 'd-dthxdk', 'D-大唐豪侠点卡', '1-16-176-', '50007421', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('177', '16', 'd-dhxy3dk', 'D-大话西游3点卡', '1-16-177-', '50008003', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('178', '16', 'd-dhziidk', 'D-大海战II点卡', '1-16-178-', '50007919', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('179', '16', 'd-dhxyzzgdk', 'D-大话西游之战歌点卡', '1-16-179-', '50007949', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('180', '16', 'd-dthxwcdk', 'D-大唐豪侠外传点卡', '1-16-180-', '50024996', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('181', '16', 'd-dtwsdk', 'D-大唐无双点卡', '1-16-181-', '50007476', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('182', '16', 'd-dtyh', 'D-大唐英豪', '1-16-182-', '50024931', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('183', '16', 'd-dxxd', 'D-东邪西毒', '1-16-183-', '50007848', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('184', '16', 'd-dmlqdk', 'D-大明龙权点卡', '1-16-184-', '50007439', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('185', '16', 'd-dhhl', 'D-大话红楼', '1-16-185-', '50026057', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('186', '16', 'd-dmxdk', 'D-大冒险点卡', '1-16-186-', '50202003', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('187', '16', 'e-emfzdk', 'E-恶魔法则点卡', '1-16-187-', '50024968', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('188', '16', 'e-evedk', 'E-EVE点卡', '1-16-188-', '50007442', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('189', '16', 'f-flyxdk', 'F-风雷游戏点卡', '1-16-189-', '50126003', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('190', '16', 'f-fsbgjb', 'F-封神榜国际版', '1-16-190-', '50024935', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('191', '16', 'f-fsb3', 'F-封神榜3', '1-16-191-', '50024936', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('192', '16', 'f-fjxy', 'F-富甲西游', '1-16-192-', '50024927', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('193', '16', 'f-fbzqdk', 'F-风暴战区点卡', '1-16-193-', '50025201', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('194', '16', 'f-fydk', 'F-风云点卡', '1-16-194-', '50007443', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('195', '16', 'f-fsbdk', 'F-封神榜点卡', '1-16-195-', '50007432', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('196', '16', 'f-fkjyoldk', 'F-反恐精英OL点卡', '1-16-196-', '50007433', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('197', '16', 'f-fkst', 'F-疯狂石头', '1-16-197-', '50024928', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('198', '16', 'f-fkxd', 'F-反恐行动', '1-16-198-', '50024932', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('199', '16', 'f-fifa', 'F-FIFA', '1-16-199-', '50024247', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('200', '16', 'f-fksc', 'F-疯狂赛车', '1-16-200-', '50026042', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('201', '16', 'g-gfxz', 'G-功夫小子', '1-16-201-', '50026038', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('202', '16', 'g-gfp', 'G-功夫派', '1-16-202-', '50024804', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('203', '16', 'gtjwt2dk', 'GT劲舞团2点卡', '1-16-203-', '50007445', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('204', '16', 'g-gydk', 'G-古域点卡', '1-16-204-', '50024997', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('205', '16', 'g-gcdwcdk', 'G-鬼吹灯外传点卡', '1-16-205-', '50007408', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('206', '16', 'h-hmzydk', 'H-幻魔之眼点卡', '1-16-206-', '50024967', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('207', '16', 'h-hjddk', 'H-黄金岛点卡', '1-16-207-', '50007805', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('208', '16', 'h-hdwdk', 'H-海盗王点卡', '1-16-208-', '50007440', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('209', '16', 'h-hx2dk', 'H-华夏2点卡', '1-16-209-', '50007399', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('210', '16', 'h-hjgd', 'H-黄金国度', '1-16-210-', '50026066', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('211', '16', 'h-hxzydk', 'H-幻想之翼点卡', '1-16-211-', '50192003', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('212', '16', 'i-itowndk', 'I-iTown点卡', '1-16-212-', '50024994', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('213', '16', 'j-jyzjdk', 'J-九阴真经点卡', '1-16-213-', '50026659', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('214', '16', 'j-jzscdk', 'J-决战双城点卡', '1-16-214-', '50024965', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('215', '16', 'j-jlcsdk', 'J-精灵传说点卡', '1-16-215-', '50024992', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('216', '16', 'j-jl·jdk', 'J-剑灵·诀点卡', '1-16-216-', '50024699', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('217', '16', 'j-jwtdk', 'J-劲舞团点卡', '1-16-217-', '50007435', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('218', '16', 'j-jxqywlb3dk', 'J-剑侠情缘网络版3点卡', '1-16-218-', '50007438', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('219', '16', 'j-jxqy2dk', 'J-剑侠情缘2点卡', '1-16-219-', '50007405', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('220', '16', 'j-jxsjdk', 'J-剑侠世界点卡', '1-16-220-', '50007426', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('221', '16', 'j-jtlqdk', 'J-街头篮球点卡', '1-16-221-', '50007370', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('222', '16', 'j-jxqywlbdk', 'J-剑侠情缘网络版点卡', '1-16-222-', '50007955', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('223', '16', 'j-jtdddk', 'J-惊天动地点卡', '1-16-223-', '50007409', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('224', '16', 'j-jrdk', 'J-巨人点卡', '1-16-224-', '50007417', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('225', '16', 'j-jdcs', 'J-九鼎传说', '1-16-225-', '50026059', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('226', '16', 'j-jx', 'J-剑仙', '1-16-226-', '50026062', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('227', '16', 'jhm xsb', '激活码/新手包', '1-16-227-', '50025889', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('228', '16', 'j-jzoldk', 'J-九州OL点卡', '1-16-228-', '50116005', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('229', '16', 'j-jdfhdk', 'J-绝地反击点卡', '1-16-229-', '50208004', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('230', '16', 'k-kdxydk', 'K-口袋西游点卡', '1-16-230-', '50007359', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('231', '16', 'k-kz2', 'K-抗战2', '1-16-231-', '50024848', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('232', '16', 'k-kzyxcdk', 'K-抗战英雄传点卡', '1-16-232-', '50007931', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('233', '16', 'l-ldj', 'L-鹿鼎记', '1-16-233-', '50024809', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('234', '16', 'l-lqyxcdk', 'L-洛奇英雄传点卡', '1-16-234-', '50025200', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('235', '16', 'l-lqyfkdk', 'L-篮球也疯狂点卡', '1-16-235-', '50024995', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('236', '16', 'l-lzgdk', 'L-龙之谷点卡', '1-16-236-', '50007937', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('237', '16', 'l-lzsjdk', 'L-联众世界点卡', '1-16-237-', '50007859', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('238', '16', 'l-lsztdk', 'L-绿色征途点卡', '1-16-238-', '50007452', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('239', '16', 'l-ldk', 'L-龙点卡', '1-16-239-', '50007464', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('240', '16', 'l-lmzydk', 'L-浪漫庄园点卡', '1-16-240-', '50007815', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('241', '16', 'l-lqdk', 'L-洛奇点卡', '1-16-241-', '50007446', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('242', '16', 'l-lj', 'L-亮剑', '1-16-242-', '50026072', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('243', '16', 'l-lxhdjol', 'L-流星蝴蝶剑OL', '1-16-243-', '50502002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('244', '16', 'm-mezy', 'M-摩尔庄园', '1-16-244-', '50024772', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('245', '16', 'm-mfhq', 'M-魔法哈奇', '1-16-245-', '50024805', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('246', '16', 'm-mj2dk', 'M-魔界2点卡', '1-16-246-', '50024963', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('247', '16', 'm-mydqb', 'M-魔域掉钱版', '1-16-247-', '50025621', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('248', '16', 'm-mhlzdk', 'M-梦幻龙族点卡', '1-16-248-', '50007454', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('249', '16', 'm-mssjdk', 'M-魔兽世界点卡', '1-16-249-', '50007361', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('250', '16', 'm-mhxydk', 'M-梦幻西游点卡', '1-16-250-', '50007675', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('251', '16', 'm-mydk', 'M-魔域点卡', '1-16-251-', '50007380', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('252', '16', 'm-mxddk', 'M-冒险岛点卡', '1-16-252-', '50007395', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('253', '16', 'm-mhzxdk', 'M-梦幻诛仙点卡', '1-16-253-', '50007453', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('254', '16', 'm-mlbbdk', 'M-魔力宝贝点卡', '1-16-254-', '50007481', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('255', '16', 'm-mxsjdk', 'M-梦想世界点卡', '1-16-255-', '50007470', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('256', '16', 'm-mhgddk', 'M-梦幻国度点卡', '1-16-256-', '50007973', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('257', '16', 'm-mjsgdk', 'M-名将三国点卡', '1-16-257-', '50007901', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('258', '16', 'm-mpykt', 'M-猫扑一卡通', '1-16-258-', '50024864', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('259', '16', 'm-mpykt', 'M-冒泡一卡通', '1-16-259-', '50024865', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('260', '16', 'm-mhssdk', 'M-梦幻蜀山点卡', '1-16-260-', '50196005', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('261', '16', 'm-msgdk', 'M-梦三国点卡', '1-16-261-', '50492001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('262', '16', 'm-mljhdk', 'M-麻辣江湖点卡', '1-16-262-', '50496001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('263', '16', 'm-mslrdk', 'M-美食猎人点卡', '1-16-263-', '50500002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('264', '16', 'p-ptyjdk', 'P-破天一剑点卡', '1-16-264-', '50007991', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('265', '16', 'p-ppyx', 'P-泡泡游戏', '1-16-265-', '50024926', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('266', '16', 'p-pptdk', 'P-泡泡堂点卡', '1-16-266-', '50007967', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('267', '16', 'p-ppkdcdk', 'P-跑跑卡丁车点卡', '1-16-267-', '50007437', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('268', '16', 'q-dk', 'Q-麒麟点卡', '1-16-268-', '50098008', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('269', '16', 'q-qftbk', 'Q-起凡通宝卡', '1-16-269-', '50114008', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('270', '16', 'q-nyh', 'Q-倩女幽魂', '1-16-270-', '50024770', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('271', '16', 'q-qqxxc', 'Q-QQ仙侠传', '1-16-271-', '50025320', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('272', '16', 'q-qxzbdk', 'Q-七雄争霸点卡', '1-16-272-', '50025322', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('273', '16', 'q-qqxydk', 'Q-QQ西游点卡', '1-16-273-', '50025323', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('274', '16', 'q-qn3dk', 'Q-千年3点卡', '1-16-274-', '50007462', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('275', '16', 'q-qqfcdk', 'Q-QQ飞车点卡', '1-16-275-', '50007450', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('276', '16', 'q-qqsgdk', 'Q-QQ三国点卡', '1-16-276-', '50007868', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('277', '16', 'q-qddk', 'Q-起点点卡', '1-16-277-', '50007792', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('278', '16', 'q-qqhxdk', 'Q-QQ幻想点卡', '1-16-278-', '50007411', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('279', '16', 'q-qqzyhxdk', 'Q-QQ自由幻想点卡', '1-16-279-', '50007985', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('280', '16', 'q-qjdk', 'Q-奇迹点卡', '1-16-280-', '50007400', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('281', '16', 'q-qqhxdk', 'Q-QQ华夏点卡', '1-16-281-', '50007825', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('282', '16', 'q-qqsm', 'Q-全球使命', '1-16-282-', '50026067', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('283', '16', 'qtyxdk', '其他游戏点卡', '1-16-283-', '50007779', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('284', '16', 'q-qjsj2dk', 'Q-奇迹世界2点卡', '1-16-284-', '50050644', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('285', '16', 'q-qh360b', 'Q-奇虎360币', '1-16-285-', '50102011', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('286', '16', 'q-qshdk', 'Q-秦始皇点卡', '1-16-286-', '50208005', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('287', '16', 'q-qxzldk', 'Q-群雄逐鹿点卡', '1-16-287-', '50494002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('288', '16', 'r-rdcsdk', 'R-热斗传说点卡', '1-16-288-', '50024964', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('289', '16', 'r-rxcqdk', 'R-热血传奇点卡', '1-16-289-', '50007670', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('290', '16', 'r-rxjhdk', 'R-热血江湖点卡', '1-16-290-', '50007368', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('291', '16', 'r-rwpdiidk', 'R-热舞派对II点卡', '1-16-291-', '50007997', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('292', '16', 'r-rxyh', 'R-热血英豪', '1-16-292-', '50026034', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('293', '16', 'r-rxzd', 'R-热血战队', '1-16-293-', '50026058', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('294', '16', 'r-rrykt', 'R-人人一卡通', '1-16-294-', '50024863', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('295', '16', 's-sjjydk', 'S-世纪佳缘点卡', '1-16-295-', '50050224', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('296', '16', 's-smdl', 'S-神魔大陆', '1-16-296-', '50024168', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('297', '16', 's-seh', 'S-赛尔号', '1-16-297-', '50024802', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('298', '16', 's-sgsj', 'S-神鬼世界', '1-16-298-', '50024697', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('299', '16', 's-sxftdk', 'S-兽血沸腾点卡', '1-16-299-', '50007473', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('300', '16', 's-smonlinedk', 'S-蜀门Online点卡', '1-16-300-', '50007447', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('301', '16', 's-sgcqdk', 'S-神鬼传奇点卡', '1-16-301-', '50007467', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('302', '16', 's-sgqycdk', 'S-三国群英传点卡', '1-16-302-', '50007458', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('303', '16', 'sdgdonlinedk', 'SD敢达online点卡', '1-16-303-', '50007466', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('304', '16', 's-sgcdk', 'S-三国策点卡', '1-16-304-', '50007777', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('305', '16', 's-ssoldk', 'S-蜀山OL点卡', '1-16-305-', '50007887', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('306', '16', 's-slcsdk', 'S-丝路传说点卡', '1-16-306-', '50007407', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('307', '16', 's-sqdk', 'S-神泣点卡', '1-16-307-', '50007381', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('308', '16', 's-sh', 'S-神话', '1-16-308-', '50026068', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('309', '16', 's-sgtx', 'S-三国天下', '1-16-309-', '50024930', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('310', '16', 's-sgsonline', 'S-三国杀Online', '1-16-310-', '50026039', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('311', '16', 's-sjqy', 'S-三界奇缘', '1-16-311-', '50026063', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('312', '16', 's-sws', 'S-水浒无双', '1-16-312-', '50026069', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('313', '16', 's-sxcdk', 'S-神仙传点卡', '1-16-313-', '50050645', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('314', '16', 's-sgzhdk', 'S-三国战魂点卡', '1-16-314-', '50050646', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('315', '16', 's-sjcsdk', 'S-圣境传说点卡', '1-16-315-', '50138001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('316', '16', 's-sjdk', 'S-神界点卡', '1-16-316-', '50206003', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('317', '16', 's-sklhdk', 'S-时空裂痕点卡', '1-16-317-', '50490001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('318', '16', 's-sgzbdk', 'S-三国争霸点卡', '1-16-318-', '50494001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('319', '16', 's-sdxldk', 'S-神雕侠侣点卡', '1-16-319-', '50500001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('320', '16', 's-ssjxcdk', 'S-蜀山剑侠传点卡', '1-16-320-', '50492002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('321', '16', 's-sbcqdk', 'S-神兵传奇点卡', '1-16-321-', '50490002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('322', '16', 's-sdcqdk', 'S-圣道传奇点卡', '1-16-322-', '50506001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('323', '16', 't-txlsztdk', 'T-腾讯绿色征途点卡', '1-16-323-', '50025480', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('324', '16', 't-tksjdk', 'T-坦克世界点卡', '1-16-324-', '50025109', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('325', '16', 't-tlbb3dk', 'T-天龙八部3点卡', '1-16-325-', '50007418', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('326', '16', 't-txsdk', 'T-天下叁点卡', '1-16-326-', '50007468', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('327', '16', 't-tt2dk', 'T-天堂2点卡', '1-16-327-', '50007479', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('328', '16', 't-tstddk', 'T-吞食天地点卡', '1-16-328-', '50008015', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('329', '16', 't-tj2dk', 'T-天骄2点卡', '1-16-329-', '50007483', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('330', '16', 't-td', 'T-天道', '1-16-330-', '50026070', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('331', '16', 'v-vsjjptvip dk', 'V-VS竞技平台VIP/点卡', '1-16-331-', '50007793', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('332', '16', 'w-wmsjgjbdk', 'W-完美世界国际版点卡', '1-16-332-', '50007459', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('333', '16', 'w-wlwcdk', 'W-武林外传点卡', '1-16-333-', '50007664', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('334', '16', 'w-wmsjdk', 'W-完美世界点卡', '1-16-334-', '50007402', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('335', '16', 'w-wddk', 'W-问道点卡', '1-16-335-', '50007403', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('336', '16', 'w-wjqdk', 'W-舞街区点卡', '1-16-336-', '50008027', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('337', '16', 'w-wsdk', 'W-武神点卡', '1-16-337-', '50007925', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('338', '16', 'w-wh', 'W-武魂', '1-16-338-', '50026045', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('339', '16', 'w-wwzw3', 'W-万王之王3', '1-16-339-', '50026065', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('340', '16', 'wyyxdk', '网页游戏点卡', '1-16-340-', '50007913', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('341', '16', 'wyczpt（ptjkk）', '网游充值平台（平台加款卡）', '1-16-341-', '50007785', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('342', '16', 'w-wszndk', 'W-巫师之怒点卡', '1-16-342-', '50050647', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('343', '16', 'w-wsdk', 'W-万神点卡', '1-16-343-', '50050649', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('344', '16', 'x-xlzq', 'X-迅雷专区', '1-16-344-', '50025778', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('345', '16', 'x-jxewc', 'X-剑侠贰外传', '1-16-345-', '50024937', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('346', '16', 'x-xklcdk', 'X-侠客列传点卡', '1-16-346-', '50025654', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('347', '16', 'x-xcb', 'X-星辰变', '1-16-347-', '50024126', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('348', '16', 'x-xjzb2', 'X-星际争霸2', '1-16-348-', '50007875', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('349', '16', 'x-xjⅱ《zyzy》cwb', 'X-星际Ⅱ《自由之翼》畅玩版', '1-16-349-', '50026054', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('350', '16', 'x-xccsdk', 'X-星尘传说点卡', '1-16-350-', '50007840', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('351', '16', 'x-（lg）xyjdk', 'X-（蓝港）西游记点卡', '1-16-351-', '50008034', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('352', '16', 'x-xhx', 'X-小花仙', '1-16-352-', '50024803', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('353', '16', 'x-xxdk', 'X-寻仙点卡', '1-16-353-', '50007390', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('354', '16', 'x-xjoldk', 'X-仙剑OL点卡', '1-16-354-', '50007599', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('355', '16', 'x-xydiidk', 'X-侠义道II点卡', '1-16-355-', '50007863', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('356', '16', 'x-xligamedk', 'X-新浪IGame点卡', '1-16-356-', '50007833', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('357', '16', 'x-xqjsjdk', 'X-新奇迹世界点卡', '1-16-357-', '50007800', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('358', '16', 'x-xffdk', 'X-新飞飞点卡', '1-16-358-', '50007436', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('359', '16', 'x-xyxnddk', 'X-新英雄年代点卡', '1-16-359-', '50008039', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('360', '16', 'x-jlzjdk', 'X-降龙之剑点卡', '1-16-360-', '50023165', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('361', '16', 'x-xtdk', 'X-仙途点卡', '1-16-361-', '50007961', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('362', '16', 'x-xlqy2', 'X-仙侣奇缘2', '1-16-362-', '50024933', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('363', '16', 'x-xzg', 'X-新战国', '1-16-363-', '50026071', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('364', '16', 'x-xxsjdk', 'X-仙侠世界点卡', '1-16-364-', '50050648', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('365', '16', 'x-xyqjdk', 'X-西游Q记点卡', '1-16-365-', '50192004', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('366', '16', 'x-xwdk', 'X-希望点卡', '1-16-366-', '50204002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('367', '16', 'x-wbⅱdk', 'X-炫舞吧Ⅱ点卡', '1-16-367-', '50208006', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('368', '16', 'x-xlwbhy', 'X-新浪微博会员', '1-16-368-', '50498001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('369', '16', 'x-xtzjdk', 'X-玄天之剑点卡', '1-16-369-', '50504001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('370', '16', 'y-ybtx', 'Y-佣兵天下', '1-16-370-', '50025062', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('371', '16', 'y-yxlmdk', 'Y-英雄联盟点卡', '1-16-371-', '50025108', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('372', '16', 'y-yxwn', 'Y-游戏蜗牛', '1-16-372-', '50025646', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('373', '16', 'y-yhztdk', 'Y-永恒之塔点卡', '1-16-373-', '50007385', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('374', '16', 'y-yt2dk', 'Y-倚天2点卡', '1-16-374-', '50007471', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('375', '16', 'y-yttlj', 'Y-倚天屠龙记', '1-16-375-', '50024698', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('376', '16', 'y-yzonline', 'Y-远征Online', '1-16-376-', '50024443', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('377', '16', 'y-yxcy', 'Y-游戏茶苑', '1-16-377-', '50026033', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('378', '16', 'y-yycs', 'Y-月影传说', '1-16-378-', '50026055', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('379', '16', 'z-zt2sdk', 'Z-征途2S点卡', '1-16-379-', '50007474', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('380', '16', 'z-zhonlinedk', 'Z-诸侯Online点卡', '1-16-380-', '50007979', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('381', '16', 'z-ztdk', 'Z-征途点卡', '1-16-381-', '50007372', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('382', '16', 'z-zxqcdk', 'Z-诛仙前传点卡', '1-16-382-', '50007832', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('383', '16', 'z-zsgwsoldk', 'Z-真三国无双OL点卡', '1-16-383-', '50008009', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('384', '16', 'z-zthjbdk', 'Z-征途怀旧版点卡', '1-16-384-', '50007427', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('385', '16', 'z-zgyxzxdk', 'Z-中国游戏中心点卡', '1-16-385-', '50007841', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('386', '16', 'z-ztsjbdk', 'Z-征途时间版点卡', '1-16-386-', '50007451', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('387', '16', 'z-zfdk', 'Z-征服点卡', '1-16-387-', '50007377', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('388', '16', 'z-zgfy', 'Z-战国风云', '1-16-388-', '50024929', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('389', '16', 'z-zhzww', 'Z-纵横中文网', '1-16-389-', '50024729', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('390', '16', 'z-zg', 'Z-战歌', '1-16-390-', '50024771', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('391', '16', 'z-zh', 'Z-斩魂', '1-16-391-', '50026043', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('392', '16', 'z-zdzwava', 'Z-战地之王AVA', '1-16-392-', '50025321', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('393', '16', 'z-zhyx', 'Z-中华英雄', '1-16-393-', '50026060', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('394', '16', 'z-zbtx', 'Z-争霸天下', '1-16-394-', '50214001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('395', '17', 'dxhfczk', '电信话费充值卡', '1-17-395-', '50011814', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('396', '17', 'gddhczk', '固定电话充值卡', '1-17-396-', '150406', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('397', '17', 'zgydczk', '中国移动充值卡', '1-17-397-', '150401', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('398', '17', 'zgltczk', '中国联通充值卡', '1-17-398-', '150402', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('399', '18', 'bx mj', '背心/马甲', '2-18-399-', '50011153', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('400', '18', 'cs', '衬衫', '2-18-400-', '50011123', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('401', '18', 'fy', '风衣', '2-18-401-', '50011159', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('402', '18', 'gzzf', '工装制服', '2-18-402-', '50005867', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('403', '18', 'jk', '夹克', '2-18-403-', '50010158', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('404', '18', 'mk', '棉裤', '2-18-404-', '50025885', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('405', '18', 'my', '棉衣', '2-18-405-', '50011165', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('406', '18', 'mzfz', '民族服装', '2-18-406-', '50001748', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('407', '18', 'nzk', '牛仔裤', '2-18-407-', '50010167', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('408', '18', 'ndy', '呢大衣', '2-18-408-', '50025883', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('409', '18', 'polos', 'Polo衫', '2-18-409-', '50010402', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('410', '18', 'pk', '皮裤', '2-18-410-', '50011127', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('411', '18', 'py', '皮衣', '2-18-411-', '50011161', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('412', '18', 'tx', 'T恤', '2-18-412-', '50000436', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('413', '18', 'wy', '卫衣', '2-18-413-', '50010159', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('414', '18', 'xxk', '休闲裤', '2-18-414-', '3035', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('415', '18', 'xf', '西服', '2-18-415-', '50010160', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('416', '18', 'xk', '西裤', '2-18-416-', '50011129', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('417', '18', 'xftz', '西服套装', '2-18-417-', '50011130', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('418', '18', 'yrk', '羽绒裤', '2-18-418-', '50025884', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('419', '18', 'yrf', '羽绒服', '2-18-419-', '50011167', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('420', '18', 'zzs my', '针织衫/毛衣', '2-18-420-', '50000557', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('421', '19', 'dbx', '低帮鞋', '2-19-421-', '50012906', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('422', '19', 'fbx', '帆布鞋', '2-19-422-', '50011744', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('423', '19', 'gbx', '高帮鞋', '2-19-423-', '50012907', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('424', '19', 'lx', '凉鞋', '2-19-424-', '50011745', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('425', '19', 'tx', '拖鞋', '2-19-425-', '50011746', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('426', '19', 'xz', '靴子', '2-19-426-', '50011743', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('427', '19', 'yx', '雨鞋', '2-19-427-', '50012908', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('428', '20', 'bsq', '半身裙', '2-20-428-', '1623', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('429', '20', 'cs', '衬衫', '2-20-429-', '162104', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('430', '20', 'dwt', '短外套', '2-20-430-', '50011277', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('431', '20', 'dmnz', '大码女装', '2-20-431-', '1629', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('432', '20', 'fy', '风衣', '2-20-432-', '50008901', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('433', '20', 'hs qp lf', '婚纱/旗袍/礼服', '2-20-433-', '50011404', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('434', '20', 'kz', '裤子', '2-20-434-', '1622', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('435', '20', 'lyq', '连衣裙', '2-20-435-', '50010850', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('436', '20', 'lss xfs', '蕾丝衫/雪纺衫', '2-20-436-', '162116', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('437', '20', 'mj', '马夹', '2-20-437-', '50013196', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('438', '20', 'mzzs', '毛针织衫', '2-20-438-', '50000697', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('439', '20', 'my', '毛衣', '2-20-439-', '162103', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('440', '20', 'mnwt', '毛呢外套', '2-20-440-', '50013194', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('441', '20', 'my mf', '棉衣/棉服', '2-20-441-', '50008900', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('442', '20', 'nzk', '牛仔裤', '2-20-442-', '162205', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('443', '20', 'py', '皮衣', '2-20-443-', '50008904', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('444', '20', 'pc', '皮草', '2-20-444-', '50008905', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('445', '20', 'tx', 'T恤', '2-20-445-', '50000671', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('446', '20', 'tz mzfz wtfz', '唐装/民族服装/舞台服装', '2-20-446-', '50008906', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('447', '20', 'wy rs', '卫衣/绒衫', '2-20-447-', '50008898', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('448', '20', 'xbx xdd', '小背心/小吊带', '2-20-448-', '162105', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('449', '20', 'xz', '西装', '2-20-449-', '50008897', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('450', '20', 'yrf', '羽绒服', '2-20-450-', '50008899', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('451', '20', 'zlnnz', '中老年女装', '2-20-451-', '50000852', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('452', '20', 'zytz xsxf gzzf', '职业套装/学生校服/工作制服', '2-20-452-', '1624', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('453', '21', 'dbx', '低帮鞋', '2-21-453-', '50012027', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('454', '21', 'fbx', '帆布鞋', '2-21-454-', '50012042', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('455', '21', 'gbx', '高帮鞋', '2-21-455-', '50012825', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('456', '21', 'lx', '凉鞋', '2-21-456-', '50012032', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('457', '21', 'tx', '拖鞋', '2-21-457-', '50012033', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('458', '21', 'xz', '靴子', '2-21-458-', '50012028', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('459', '21', 'yx', '雨鞋', '2-21-459-', '50012047', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('460', '22', 'bd', '包袋', '2-22-460-', '50012010', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('461', '22', 'lxx', '旅行箱', '2-22-461-', '50012019', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('462', '22', 'lxd', '旅行袋', '2-22-462-', '50050199', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('463', '22', 'qbkt', '钱包卡套', '2-22-463-', '50012018', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('464', '22', 'xbxgpj', '箱包相关配件', '2-22-464-', '50026617', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('465', '23', 'bnsz', '保暖上装', '2-23-465-', '50008885', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('466', '23', 'bnk', '保暖裤', '2-23-466-', '50012777', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('467', '23', 'bntz', '保暖套装', '2-23-467-', '50012778', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('468', '23', 'cp xd', '插片/胸垫', '2-23-468-', '50012786', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('469', '23', 'dw ddw sw mtw', '短袜/打底袜/丝袜/美腿袜', '2-23-469-', '50006846', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('470', '23', 'dd bx tx', '吊带/背心/T恤', '2-23-470-', '50010394', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('471', '23', 'dd', '肚兜', '2-23-471-', '50008890', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('472', '23', 'dwd', '吊袜带', '2-23-472-', '50012785', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('473', '23', 'dk', '搭扣', '2-23-473-', '50012787', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('474', '23', 'jd', '肩带', '2-23-474-', '50012784', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('475', '23', 'mx', '抹胸', '2-23-475-', '50008888', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('476', '23', 'nk', '内裤', '2-23-476-', '50008882', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('477', '23', 'rt', '乳贴', '2-23-477-', '50008889', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('478', '23', 'sssy', '塑身上衣', '2-23-478-', '50008884', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('479', '23', 'ssmtk', '塑身美体裤', '2-23-479-', '50012774', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('480', '23', 'ssyf yj', '塑身腰封/腰夹', '2-23-480-', '50012775', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('481', '23', 'ssfttz', '塑身分体套装', '2-23-481-', '50012776', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('482', '23', 'sslty', '塑身连体衣', '2-23-482-', '50012781', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('483', '23', 'sysz', '睡衣上装', '2-23-483-', '50008886', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('484', '23', 'sk jjk', '睡裤/家居裤', '2-23-484-', '50012766', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('485', '23', 'sq', '睡裙', '2-23-485-', '50012771', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('486', '23', 'sy jjftz', '睡衣/家居服套装', '2-23-486-', '50012772', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('487', '23', 'sp yp', '睡袍/浴袍', '2-23-487-', '50012773', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('488', '23', 'wx', '文胸', '2-23-488-', '50008881', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('489', '23', 'wxtz', '文胸套装', '2-23-489-', '50008883', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('490', '24', 'et', '耳套', '2-24-490-', '50009037', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('491', '24', 'hslfpj', '婚纱礼服配件', '2-24-491-', '164206', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('492', '24', 'ld lj', '领带/领结', '2-24-492-', '302902', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('493', '24', 'ldj', '领带夹', '2-24-493-', '50001248', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('494', '24', 'mz', '帽子', '2-24-494-', '302910', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('495', '24', 'qtpj', '其他配件', '2-24-495-', '50009047', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('496', '24', 'st', '手套', '2-24-496-', '50010410', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('497', '24', 'sp', '手帕', '2-24-497-', '50009035', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('498', '24', 'wj sj pj', '围巾/丝巾/披肩', '2-24-498-', '50007003', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('499', '24', 'wj st mztj', '围巾/手套/帽子套件', '2-24-499-', '50009578', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('500', '24', 'xk', '袖扣', '2-24-500-', '302909', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('501', '24', 'xb pdpj', '鞋包/皮带配件', '2-24-501-', '50010406', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('502', '24', 'yd pd yl', '腰带/皮带/腰链', '2-24-502-', '50009032', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('503', '24', 'ydjh sh zh', '运动颈环/手环/指环', '2-24-503-', '50011729', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('504', '24', 'zyml', '制衣面料', '2-24-504-', '50009033', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('505', '25', 'ghjpbjb', '国货精品笔记本', '3-25-505-', '50023945', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('506', '25', 'ghjpsj', '国货精品手机', '3-25-506-', '50012081', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('507', '27', 'dfjt', '单反镜头', '3-27-507-', '140116', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('508', '27', 'ddwd', '单电微单', '3-27-508-', '50021422', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('509', '27', 'jjxj', '胶卷相机', '3-27-509-', '50003770', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('510', '27', 'lomo', 'LOMO', '3-27-510-', '50003793', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('511', '27', 'ptsmxj', '普通数码相机', '3-27-511-', '1403', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('512', '27', 'smsxj', '数码摄像机', '3-27-512-', '1402', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('513', '27', 'zysmdf', '专业数码单反', '3-27-513-', '50003773', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('514', '31', 'diyjrj', 'DIY兼容机', '3-31-514-', '110308', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('515', '31', 'fwq server', '服务器/Server', '3-31-515-', '50010605', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('516', '31', 'gzz', '工作站', '3-31-516-', '50010613', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('517', '31', 'tszj', '台式整机', '3-31-517-', '50008351', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('518', '31', 'ytj', '一体机', '3-31-518-', '50018323', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('519', '11', 'cpu', 'CPU', '11-519-', '110203', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('520', '11', 'dnzb', '电脑周边', '11-520-', '50003321', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('521', '11', 'dmtyx', '多媒体音箱', '11-521-', '50001810', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('522', '11', 'dsk h', '电视卡/盒', '11-522-', '110216', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('523', '11', 'djem', '电竞耳麦', '11-523-', '50003850', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('524', '11', 'gtyp', '固态硬盘', '11-524-', '50013151', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('525', '11', 'gq kl dvd', '光驱/刻录/DVD', '11-525-', '110212', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('526', '11', 'htbpj', '绘图板配件', '11-526-', '50019041', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('527', '11', 'jp', '键盘', '11-527-', '110210', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('528', '11', 'jx', '机箱', '11-528-', '110211', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('529', '11', 'jstz', '键鼠套装', '11-529-', '50002415', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('530', '11', 'nc', '内存', '11-530-', '110202', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('531', '11', 'ppyjxsq', '品牌液晶显示器', '11-531-', '110502', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('532', '11', 'srsb', '散热设备', '11-532-', '110215', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('533', '11', 'sk', '声卡', '11-533-', '110205', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('534', '11', 'sxt', '摄像头', '11-534-', '110508', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('535', '11', 'sxsr htb', '手写输入/绘图板', '11-535-', '110511', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('536', '11', 'tjdy', '台机电源', '11-536-', '50003848', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('537', '11', 'wxsb', '无线鼠标', '11-537-', '50012320', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('538', '11', 'wl gqbfq', '网络/高清播放器', '11-538-', '50013014', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('539', '11', 'xk', '显卡', '11-539-', '110206', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('540', '11', 'yxsb', '有线鼠标', '11-540-', '50012307', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('541', '11', 'yp', '硬盘', '11-541-', '110207', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('542', '11', 'yph', '硬盘盒', '11-542-', '50003213', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('543', '11', 'zb', '主板', '11-543-', '110201', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('544', '11', 'zzyjxsq', '组装液晶显示器', '11-544-', '50008759', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('545', '32', '3gwxlyq', '3G无线路由器', '3-32-545-', '50022650', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('546', '32', 'adsl modem kdm', 'ADSL MODEM/宽带猫', '3-32-546-', '50016213', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('547', '32', 'dn wlgj', '电脑/网络工具', '3-32-547-', '50016203', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('548', '32', 'dlm', '电力猫', '3-32-548-', '50020262', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('549', '32', 'gxsb', '光纤设备', '3-32-549-', '50016189', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('550', '32', 'jhj', '交换机', '3-32-550-', '110805', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('551', '32', 'jfbx', '机房布线', '3-32-551-', '50019361', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('552', '32', 'lyq', '路由器', '3-32-552-', '110808', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('553', '32', 'lyq m wkpj', '路由器/猫/网卡配件', '3-32-553-', '50019812', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('554', '32', 'qtwlxg', '其它网络相关', '3-32-554-', '110809', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('555', '32', 'spjk', '视频监控', '3-32-555-', '50019494', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('556', '32', 'smxc', '数码线材', '3-32-556-', '50020174', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('557', '32', 'wk', '网卡', '3-32-557-', '110209', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('558', '32', 'wg', '网关', '3-32-558-', '50016214', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('559', '32', 'wlccsb', '网络存储设备', '3-32-559-', '50016195', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('560', '32', 'wxwl', '无线网络', '3-32-560-', '50019309', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('561', '32', 'wlsb', '网络设备', '3-32-561-', '50019318', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('562', '32', 'wlaq', '网络安全', '3-32-562-', '50019341', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('563', '32', 'wxgq', '无线高清', '3-32-563-', '50118013', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('564', '32', 'yysp', '语音视频', '3-32-564-', '50019510', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('565', '33', '3gwxswksb', '3G无线上网卡设备', '3-33-565-', '111703', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('566', '33', 'bjbdnpj', '笔记本电脑配件', '3-33-566-', '50024095', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('567', '33', 'df ddxjpj', '单反/单电相机配件', '3-33-567-', '50024097', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('568', '33', 'dzspj', '电子书配件', '3-33-568-', '50020180', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('569', '33', 'djcppj', '电教产品配件', '3-33-569-', '50024104', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('570', '33', 'dzyqjsc', '电子元器件市场', '3-33-570-', '50024099', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('571', '33', 'gdc cddc tz', '干电池/充电电池/套装', '3-33-571-', '50003312', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('572', '33', 'jdyyzbpj', '家电影音周边配件', '3-33-572-', '50011826', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('573', '33', 'jpxjpj', '胶片相机配件', '3-33-573-', '50050622', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('574', '33', 'lyej', '蓝牙耳机', '3-33-574-', '50005050', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('575', '33', 'mp3 mp4pj', 'MP3/MP4配件', '3-33-575-', '50005051', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('576', '33', 'pgzypj', '苹果专用配件', '3-33-576-', '50018326', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('577', '33', 'pbdnpj', '平板电脑配件', '3-33-577-', '50024098', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('578', '33', 'sjpj', '手机配件', '3-33-578-', '50024094', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('579', '33', 'smxjpj', '数码相机配件', '3-33-579-', '50024096', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('580', '33', 'sxjpj', '摄像机配件', '3-33-580-', '50024103', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('581', '33', 'smb sn zl', '数码包/收纳/整理', '3-33-581-', '50024101', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('582', '33', 'smxk', '数码相框', '3-33-582-', '50008482', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('583', '33', 'smzb', '数码周边', '3-33-583-', '50024109', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('584', '33', 'usbdnzb', 'USB电脑周边', '3-33-584-', '50018909', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('585', '33', 'yddy', '移动电源', '3-33-585-', '50009211', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('586', '34', 'jyb', '记忆棒', '3-34-586-', '50012167', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('587', '34', 'sck', '闪存卡', '3-34-587-', '50012166', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('588', '34', 'up', 'U盘', '3-34-588-', '50012165', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('589', '34', 'ydyp', '移动硬盘', '3-34-589-', '110507', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('590', '35', 'bxx', '保险箱', '3-35-590-', '50001718', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('591', '35', 'bgsbpjjxgfw', '办公设备配件及相关服务', '3-35-591-', '50012600', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('592', '35', 'bgyz', '办公用纸', '3-35-592-', '50019250', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('593', '35', 'bzsb bpjhc', '包装设备/标牌及耗材', '3-35-593-', '50024369', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('594', '35', 'cz txsb', '传真/通信设备', '3-35-594-', '50008551', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('595', '35', 'cpklccl', '磁盘刻录存储类', '3-35-595-', '50024253', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('596', '35', 'dyjpj', '打印机配件', '3-35-596-', '50012601', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('597', '35', 'dyj', '打印机', '3-35-597-', '110514', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('598', '35', 'dgnytjjpj', '多功能一体机及配件', '3-35-598-', '50024258', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('599', '35', 'd yc skjjpj', '点/验钞/收款机及配件', '3-35-599-', '50024346', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('600', '35', 'fhfyj', '复合复印机', '3-35-600-', '111201', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('601', '35', 'fwl', '服务类', '3-35-601-', '50024389', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('602', '35', 'jj', '胶卷', '3-35-602-', '140117', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('603', '35', 'jd', '胶带', '3-35-603-', '50021133', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('604', '35', 'ms', '墨水', '3-35-604-', '50019240', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('605', '35', 'mfxghcl', '墨粉硒鼓耗材类', '3-35-605-', '50024248', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('606', '35', 'mjkqqc', '门禁考勤器材', '3-35-606-', '50024394', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('607', '35', 'qtbgsb', '其它办公设备', '3-35-607-', '50010757', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('608', '35', 'qthc', '其它耗材', '3-35-608-', '111409', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('609', '35', 'qtbgsbpj', '其它办公设备配件', '3-35-609-', '50024400', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('610', '35', 'ss zd bgxc', '绳索/扎带/办公线材', '3-35-610-', '50021132', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('611', '35', 'smy', '扫描仪', '3-35-611-', '110501', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('612', '35', 'szj', '碎纸机', '3-35-612-', '211710', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('613', '35', 'tyj', '投影机', '3-35-613-', '111219', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('614', '35', 'tyjpj', '投影机配件', '3-35-614-', '50008352', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('615', '35', 'tmsm cjqc', '条码扫描/采集器材', '3-35-615-', '50024300', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('616', '36', 'bl sxgj', '笔类/书写工具', '3-36-616-', '50012716', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('617', '36', 'cjyp', '裁剪用品', '3-36-617-', '50005747', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('618', '36', 'chyp', '财会用品', '3-36-618-', '50013477', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('619', '36', 'dzcd xxj', '电子辞典/学习机', '3-36-619-', '50008870', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('620', '36', 'ddj', '点读机', '3-36-620-', '50022538', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('621', '36', 'ddb', '点读笔', '3-36-621-', '50022537', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('622', '36', 'dzylq dzs', '电子阅览器/电纸书', '3-36-622-', '50010731', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('623', '36', 'htclyp', '绘图测量用品', '3-36-623-', '50005756', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('624', '36', 'hj hc sfyp', '画具/画材/书法用品', '3-36-624-', '50024641', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('625', '36', 'jzyp', '胶粘用品', '3-36-625-', '50005730', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('626', '36', 'jsq', '计算器', '3-36-626-', '211708', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('627', '36', 'jxys zsgsyp', '教学演示/展示告示用品', '3-36-627-', '50005752', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('628', '36', 'qtwhyp', '其它文化用品', '3-36-628-', '211707', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('629', '36', 'rcxxyp', '日常学习用品', '3-36-629-', '50005757', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('630', '36', 'sn clyp', '收纳/陈列用品', '3-36-630-', '50012645', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('631', '36', 'yszp', '印刷制品', '3-36-631-', '50016353', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('632', '36', 'zzbc', '纸张本册', '3-36-632-', '50012676', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('633', '36', 'zdyp', '装订用品', '3-36-633-', '50005736', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('634', '37', 'fxp', '方向盘', '3-37-634-', '50012079', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('635', '37', 'jyyxj ps3 wii xbox', '家用游戏机/PS3/Wii/XBOX', '3-37-635-', '50017906', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('636', '37', 'ndsi ndslzypj', 'NDSI/NDSL专用配件', '3-37-636-', '50012163', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('637', '37', 'pspzypj', 'PSP专用配件', '3-37-637-', '50012160', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('638', '37', 'ps2 ps3zypj（bhps1)', 'PS2/PS3专用配件（包含PS1)', '3-37-638-', '50012162', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('639', '37', 'psvzypj', 'PSV专用配件', '3-37-639-', '50025710', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('640', '37', 'rttngc fc n64 sfc zypj', '任天堂NGC/FC/N64/SFC 专用配件', '3-37-640-', '50018225', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('641', '37', 'rttzjpj', '任天堂掌机配件', '3-37-641-', '50018230', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('642', '37', 'sj dc md ss sega zypj', '世嘉 DC/MD/SS/SEGA 专用配件', '3-37-642-', '50018224', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('643', '37', 'wiizypj zb', 'WII专用配件/周边', '3-37-643-', '50012161', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('644', '37', 'xboxzypj', 'XBOX专用配件', '3-37-644-', '50018082', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('645', '37', 'yxzj psp ndsl', '游戏掌机/PSP/NDSL', '3-37-645-', '50017905', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('646', '37', 'yxsb', '游戏手柄', '3-37-646-', '50012068', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('647', '37', 'yxrj', '游戏软件', '3-37-647-', '50012834', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('648', '37', 'yg', '摇杆', '3-37-648-', '50012080', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('649', '38', 'bx', '冰箱', '4-38-649-', '50003881', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('650', '38', 'djdpj', '大家电配件', '4-38-650-', '50022734', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('651', '38', 'jtyy', '家庭影院', '4-38-651-', '50001813', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('652', '38', 'jg', '酒柜', '4-38-652-', '50015563', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('653', '38', 'kd', '空调', '4-38-653-', '350401', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('654', '38', 'lg bxlrx', '冷柜/便携冷热箱', '4-38-654-', '50015558', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('655', '38', 'pbds', '平板电视', '4-38-655-', '50019790', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('656', '38', 'qtdsj', '其他电视机', '4-38-656-', '50012137', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('657', '38', 'rsq', '热水器', '4-38-657-', '50013474', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('658', '38', 'rqz', '燃气灶', '4-38-658-', '50015382', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('659', '38', 'xyj', '洗衣机', '4-38-659-', '350301', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('660', '38', 'xdg', '消毒柜', '4-38-660-', '350503', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('661', '38', 'yyj', '油烟机', '4-38-661-', '350511', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('662', '38', 'yzxtz', '烟灶消套装', '4-38-662-', '50018263', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('663', '39', 'cdj kz hjyy', 'CD机/卡座/黑胶音源', '4-39-663-', '50011973', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('664', '39', 'ej em', '耳机/耳麦', '4-39-664-', '1205', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('665', '39', 'gcjjfa', '工程解决方案', '4-39-665-', '50012148', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('666', '39', 'hifiyx gf qc', 'Hifi音箱/功放/器材', '4-39-666-', '50012142', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('667', '39', 'kyq lxj sj', '扩音器/录像机/世嘉', '4-39-667-', '50012149', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('668', '39', 'mkf ht', '麦克风/话筒', '4-39-668-', '50003318', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('669', '39', 'qtyx', '其他音箱', '4-39-669-', '50012934', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('670', '39', 'sst bxst sy', '随身听/便携视听/收音', '4-39-670-', '50012067', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('671', '39', 'wtsb', '舞台设备', '4-39-671-', '50020192', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('672', '39', 'wlgqbfq', '网络高清播放器', '4-39-672-', '50005174', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('673', '39', 'ydj dvd lg vcd gq', '影碟机/DVD/蓝光/VCD/高清', '4-39-673-', '50005009', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('674', '39', 'yyjdpj', '影音家电配件', '4-39-674-', '50011866', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('675', '39', 'zh mn ktyx', '组合/迷你/卡通音响', '4-39-675-', '121616', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('676', '40', 'csq csq', '抽湿器/除湿器', '4-40-676-', '50017072', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('677', '40', 'csb zqqjj', '超声波/蒸汽清洁机', '4-40-677-', '50006508', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('678', '40', 'drt', '电热毯', '4-40-678-', '50000360', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('679', '40', 'dfs', '电风扇', '4-40-679-', '50008557', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('680', '40', 'ds', '吊扇', '4-40-680-', '50018327', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('681', '40', 'dd', '电熨斗', '4-40-681-', '50008552', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('682', '40', 'djj', '对讲机', '4-40-682-', '50008563', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('683', '40', 'dhj(ys ws wl)', '电话机(有绳/无绳/网络)', '4-40-683-', '50008542', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('684', '40', 'gtj', '挂烫机', '4-40-684-', '50013195', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('685', '40', 'gyj', '干衣机', '4-40-685-', '50012101', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('686', '40', 'gxq cxq', '干鞋器/擦鞋器', '4-40-686-', '50002890', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('687', '40', 'jsq', '加湿器', '4-40-687-', '350407', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('688', '40', 'kqjh yb', '空气净化/氧吧', '4-40-688-', '350402', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('689', '40', 'kds', '空调扇', '4-40-689-', '50017589', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('690', '40', 'mqxjq', '毛球修剪器', '4-40-690-', '350310', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('691', '40', 'nfj qnq', '暖风机/取暖器', '4-40-691-', '350404', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('692', '40', 'qtshjd', '其它生活家电', '4-40-692-', '50008544', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('693', '40', 'sdj', '扫地机', '4-40-693-', '50008555', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('694', '40', 'shjdpj', '生活家电配件', '4-40-694-', '50012135', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('695', '40', 'xcq', '吸尘器', '4-40-695-', '50008554', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('696', '40', 'zqs gxs', '蒸汽刷/干洗刷', '4-40-696-', '50008553', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('697', '40', 'zqtb', '蒸汽拖把', '4-40-697-', '50022648', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('698', '41', 'blj', '冰淇淋机', '4-41-698-', '50004204', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('699', '41', 'bj ys jyh', '保健/养生/煎药壶', '4-41-699-', '50005929', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('700', '41', 'cfjdpj', '厨房家电配件', '4-41-700-', '50012099', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('701', '41', 'dkx', '电烤箱', '4-41-701-', '50002894', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('702', '41', 'dgl', '电锅煲类', '4-41-702-', '50012959', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('703', '41', 'dcl', '电磁炉', '4-41-703-', '350502', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('704', '41', 'djj', '豆浆机', '4-41-704-', '50008556', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('705', '41', 'dsl', '多士炉', '4-41-705-', '50000013', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('706', '41', 'drsh', '电热水壶', '4-41-706-', '50003695', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('707', '41', 'db klbj', '电饼铛/可丽饼机', '4-41-707-', '50004363', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('708', '41', 'drb', '电热杯', '4-41-708-', '50013007', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('709', '41', 'dsq txq', '定时器/提醒器', '4-41-709-', '350709', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('710', '41', 'ddddq', '电动打蛋器', '4-41-710-', '50004399', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('711', '41', 'dzg', '电炸锅', '4-41-711-', '50003987', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('712', '41', 'drfh', '电热饭盒', '4-41-712-', '50008369', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('713', '41', 'gbrbl', '光波热波炉', '4-41-713-', '50015397', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('714', '41', 'jsq', '净水器', '4-41-714-', '350504', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('715', '41', 'jb llj', '搅拌/料理机', '4-41-715-', '50012097', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('716', '41', 'jssb', '净水设备', '4-41-716-', '50562004', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('717', '41', 'kfj', '咖啡机', '4-41-717-', '350507', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('718', '41', 'mbj', '面包机', '4-41-718-', '50018103', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('719', '41', 'qtcfjd', '其它厨房家电', '4-41-719-', '50008543', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('720', '41', 'snj', '酸奶机', '4-41-720-', '50002535', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('721', '41', 'sycd', '商用厨电', '4-41-721-', '50013021', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('722', '41', 'wbl', '微波炉', '4-41-722-', '50002809', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('723', '41', 'ysj', '饮水机', '4-41-723-', '50002893', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('724', '41', 'zzj', '榨汁机', '4-41-724-', '50018218', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('725', '41', 'zdq zdq', '煮蛋器/蒸蛋器', '4-41-725-', '50002898', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('726', '42', 'amqc', '按摩器材', '4-42-726-', '50018398', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('727', '42', 'glpj', '各类配件', '4-42-727-', '50011877', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('728', '42', 'jkjcyq', '健康检测仪器', '4-42-728-', '50023687', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('729', '42', 'jybjqc', '家用保健器材', '4-42-729-', '50012083', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('730', '42', 'jyhlfzqc', '家用护理辅助器材', '4-42-730-', '50023690', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('731', '42', 'jlbjqc', '经络保健器材', '4-42-731-', '50023688', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('732', '42', 'kqhl', '口腔护理', '4-42-732-', '50024626', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('733', '42', 'mfgj', '美发工具', '4-42-733-', '50023686', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('734', '42', 'mtss', '美体瘦身', '4-42-734-', '50008548', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('735', '42', 'mr mtfzgj', '美容/美体辅助工具', '4-42-735-', '50008545', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('736', '42', 'qjmrgj', '清洁美容工具', '4-42-736-', '50010567', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('737', '42', 'qtgrhl', '其它个人护理', '4-42-737-', '350210', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('738', '43', 'bbs', 'BB霜', '5-43-738-', '50013794', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('739', '43', 'cb cxb', '唇笔/唇线笔', '5-43-739-', '50010801', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('740', '43', 'cc cm', '唇彩/唇蜜', '5-43-740-', '50010807', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('741', '43', 'cg kh', '唇膏/口红', '5-43-741-', '50010808', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('742', '43', 'cztz czp', '彩妆套装/彩妆盘', '5-43-742-', '50010812', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('743', '43', 'fdy g', '粉底液/膏', '5-43-743-', '50010789', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('744', '43', 'fb', '粉饼', '5-43-744-', '50010790', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('745', '43', 'gl zq dd', '隔离/妆前/打底', '5-43-745-', '50010793', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('746', '43', 'hzs sb', '化妆刷/刷包', '5-43-746-', '50019251', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('747', '43', 'hz mrgj', '化妆/美容工具', '5-43-747-', '50010817', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('748', '43', 'jmg jmzcy', '睫毛膏/睫毛增长液', '5-43-748-', '50010794', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('749', '43', 'jjm jjmgj', '假睫毛/假睫毛工具', '5-43-749-', '50019254', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('750', '43', 'mf sf', '蜜粉/散粉', '5-43-750-', '50010792', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('751', '43', 'mb mf mg', '眉笔/眉粉/眉膏', '5-43-751-', '50010798', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('752', '43', 'nscz', '男士彩妆', '5-43-752-', '50019246', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('753', '43', 'qtcz', '其它彩妆', '5-43-753-', '50010814', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('754', '43', 'sh z', '腮红/胭脂', '5-43-754-', '50010805', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('755', '43', 'sypt js', '双眼皮贴/胶水', '5-43-755-', '50010800', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('756', '43', 'stch', '身体彩绘', '5-43-756-', '50010813', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('757', '43', 'xs', '香水', '5-43-757-', '50010815', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('758', '43', 'xy gg yyf', '修颜/高光/阴影粉', '5-43-758-', '50010936', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('759', '43', 'yx', '眼线', '5-43-759-', '50010797', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('760', '43', 'yy', '眼影', '5-43-760-', '50010796', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('761', '43', 'z', '遮瑕', '5-43-761-', '50010803', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('762', '43', 'zjy mjcp', '指甲油/美甲产品', '5-43-762-', '50010810', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('763', '44', 'cbhl', '唇部护理', '5-44-763-', '50011994', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('764', '44', 'fs', '防晒', '5-44-764-', '50011982', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('765', '44', 'hzs sfs', '化妆水/爽肤水', '5-44-765-', '50011978', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('766', '44', 'jm', '洁面', '5-44-766-', '50011977', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('767', '44', 'jyfl', '精油芳疗', '5-44-767-', '50011992', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('768', '44', 'mbjh', '面部精华', '5-44-768-', '50011979', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('769', '44', 'mm mmf', '面膜/面膜粉', '5-44-769-', '50011981', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('770', '44', 'mbams', '面部按摩霜', '5-44-770-', '50011996', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('771', '44', 'mbms qjz', '面部磨砂/去角质', '5-44-771-', '50011997', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('772', '44', 'mbhltz', '面部护理套装', '5-44-772-', '50011993', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('773', '44', 'nshl', '男士护理', '5-44-773-', '50011988', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('774', '44', 'qtby', '其他保养', '5-44-774-', '50011991', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('775', '44', 'ry ms', '乳液/面霜', '5-44-775-', '50011980', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('776', '44', 'sthl', '身体护理', '5-44-776-', '50011983', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('777', '44', 'sbby', '手部保养', '5-44-777-', '50011998', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('778', '44', 'tqhl', 'T区护理', '5-44-778-', '50011995', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('779', '44', 'xz', '卸妆', '5-44-779-', '50011990', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('780', '44', 'xbhl', '胸部护理', '5-44-780-', '50011987', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('781', '44', 'ybhl', '眼部护理', '5-44-781-', '50011986', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('782', '45', 'jf jfpj', '假发/假发配件', '5-45-782-', '50023283', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('783', '45', 'rftf', '染发烫发', '5-45-783-', '50023294', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('784', '45', 'tfzx', '头发造型', '5-45-784-', '50023293', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('785', '45', 'xfhf', '洗发护发', '5-45-785-', '50023292', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('786', '46', 'bj pt', '铂金/PT', '5-46-786-', '50011401', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('787', '46', 'c', '翡翠', '5-46-787-', '50011399', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('788', '46', 'hjkj', '黄金K金', '5-46-788-', '50011400', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('789', '46', 'hlbs gzbs', '红蓝宝石/贵重宝石', '5-46-789-', '50011402', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('790', '46', 'trzz', '天然珍珠', '5-46-790-', '50013964', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('791', '46', 'trys', '天然玉石', '5-46-791-', '50013957', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('792', '46', 'tr', '天然琥珀', '5-46-792-', '50013963', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('793', '46', 'zs', '钻石', '5-46-793-', '50011398', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('794', '46', 'zgswarovskisj', '专柜swarovski水晶', '5-46-794-', '50011663', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('795', '47', 'dyy、hyyp', '滴眼液、护眼用品', '5-47-795-', '50011896', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('796', '47', 'gnyj', '功能眼镜', '5-47-796-', '50011893', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('797', '47', 'jj', '酒具', '5-47-797-', '50012709', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('798', '47', 'kjyj', '框架眼镜', '5-47-798-', '50011892', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('799', '47', 'ppdhj qtdhj', '品牌打火机/其它打火机', '5-47-799-', '50000467', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('800', '47', 'rsjd', '瑞士军刀', '5-47-800-', '290601', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('801', '47', 'tyyj', '太阳眼镜', '5-47-801-', '50010368', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('802', '47', 'yjj', '眼镜架', '5-47-802-', '50011894', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('803', '47', 'yjp', '眼镜片', '5-47-803-', '50011895', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('804', '47', 'yjpj、hlj', '眼镜配件、护理剂', '5-47-804-', '50011888', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('805', '47', 'yj', '烟具', '5-47-805-', '2909', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('806', '47', 'zippo zb', 'ZIPPO/芝宝', '5-47-806-', '2908', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('807', '48', 'bj', '摆件', '5-48-807-', '50013877', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('808', '48', 'diysppj', 'DIY饰品配件', '5-48-808-', '50013879', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('809', '48', 'es', '耳饰', '5-48-809-', '50014227', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('810', '48', 'fs', '发饰', '5-48-810-', '50013878', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('811', '48', 'jl', '脚链', '5-48-811-', '50013871', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('812', '48', 'jz zh', '戒指/指环', '5-48-812-', '50013875', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('813', '48', 'qtss', '其它首饰', '5-48-813-', '50013882', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('814', '48', 'sl', '手链', '5-48-814-', '50013869', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('815', '48', 's', '手镯', '5-48-815-', '50013870', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('816', '48', 'ssbyjd', '首饰保养鉴定', '5-48-816-', '50013880', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('817', '48', 'ssh zsj', '首饰盒/展示架', '5-48-817-', '50013881', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('818', '48', 'xl', '项链', '5-48-818-', '50013865', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('819', '48', 'xz dz', '项坠/吊坠', '5-48-819-', '50013868', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('820', '48', 'xz', '胸针', '5-48-820-', '50013876', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('821', '49', 'wb hb', '腕表/怀表', '5-49-821-', '50005700', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('822', '50', 'qt', '其它', '6-50-822-', '50014813', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('823', '50', 'tspfnf', '特殊配方奶粉', '6-50-823-', '50016094', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('824', '50', 'yyennf', '婴幼儿牛奶粉', '6-50-824-', '211104', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('825', '50', 'yyedwp', '婴幼儿调味品', '6-50-825-', '50018596', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('826', '50', 'yyefs', '婴幼儿辅食', '6-50-826-', '50018801', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('827', '50', 'yyeyyp', '婴幼儿营养品', '6-50-827-', '50018808', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('828', '50', 'yyels', '婴幼儿零食', '6-50-828-', '50018807', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('829', '50', 'yyeynf', '婴幼儿羊奶粉', '6-50-829-', '50018184', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('830', '51', 'bnk nd', '布尿裤/尿垫', '6-51-830-', '50012711', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('831', '51', 'bbxyhfp', '宝宝洗浴护肤品', '6-51-831-', '50014248', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('832', '51', 'bd xbd cxyp', '背带/学步带/出行用品', '6-51-832-', '50006020', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('833', '51', 'etf zy jj', '儿童房/桌椅/家具', '6-51-833-', '50148003', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('834', '51', 'fz tx aq bh', '防撞/提醒/安全/保护', '6-51-834-', '50005952', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('835', '51', 'lfq zjq twjdrchlxyp', '理发器/指甲钳/体温计等日常护理小用品', '6-51-835-', '50012436', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('836', '51', 'np', '奶瓶', '6-51-836-', '50009522', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('837', '51', 'nz afnz', '奶嘴/安抚奶嘴', '6-51-837-', '50228003', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('838', '51', 'qjy xyy rsj', '清洁液/洗衣液/柔顺剂', '6-51-838-', '50012466', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('839', '51', 'qw ts gmt', '驱蚊/退烧/感冒贴', '6-51-839-', '50018394', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('840', '51', 'qtytyp', '其它婴童用品', '6-51-840-', '211112', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('841', '51', 'sj', '湿巾', '6-51-841-', '50012546', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('842', '51', 'sd lx zt cp', '睡袋/凉席/枕头/床品', '6-51-842-', '50012412', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('843', '51', 'sb cj ym fj', '水杯/餐具/研磨/附件', '6-51-843-', '50009521', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('844', '51', 'tc yec yl cy', '童床/婴儿床/摇篮/餐椅', '6-51-844-', '50013866', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('845', '51', 'xd xnq xjd', '消毒/吸奶器/小家电', '6-51-845-', '50018391', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('846', '51', 'yj ys yg', '牙胶/牙刷/牙膏', '6-51-846-', '50012448', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('847', '51', 'yestc xbc', '婴儿手推车/学步车', '6-51-847-', '50022520', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('848', '51', 'znk llk znp', '纸尿裤/拉拉裤/纸尿片', '6-51-848-', '50018813', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('849', '52', 'brwx nk cjk', '哺乳文胸/内裤/产检裤', '6-52-849-', '50016687', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('850', '52', 'cfm yfw yfx', '产妇帽/孕妇袜/孕妇鞋', '6-52-850-', '50012314', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('851', '52', 'ffs', '防辐射', '6-52-851-', '50012374', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('852', '52', 'jjf brz qyk', '家居服/哺乳装/秋衣裤', '6-52-852-', '50023613', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('853', '52', 'mb d', '妈咪包/袋', '6-52-853-', '50005961', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('854', '52', 'mmcqchyp', '妈妈产前产后用品', '6-52-854-', '50006000', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('855', '52', 'sfd cfsssty pgjzd', '束缚带/产妇瘦身塑体衣/盆骨矫正带', '6-52-855-', '50023660', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('856', '52', 'yfz', '孕妇装', '6-52-856-', '50012354', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('857', '52', 'yfk tfk', '孕妇裤/托腹裤', '6-52-857-', '50023573', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('858', '52', 'ycfnf', '孕产妇奶粉', '6-52-858-', '50010392', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('859', '52', 'ycfhf xh w', '孕产妇护肤/洗护/祛纹', '6-52-859-', '50026457', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('860', '52', 'ycfyyp', '孕产妇营养品', '6-52-860-', '50026460', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('861', '52', 'yzyy', '月子营养', '6-52-861-', '50026471', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('862', '52', 'zyjc', '早孕检测', '6-52-862-', '50011864', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('863', '53', 'bx dds', '背心/吊带衫', '6-53-863-', '50156002', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('864', '53', 'cs', '衬衫', '6-53-864-', '50010527', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('865', '53', 'dw hqd dd', '肚围/护脐带/肚兜', '6-53-865-', '50012431', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('866', '53', 'etnyk sy(0-16s)', '儿童内衣裤/睡衣(0-16岁)', '6-53-866-', '50012433', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('867', '53', 'etwdf ycf lf', '儿童舞蹈服/演出服/礼服', '6-53-867-', '50016012', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('868', '53', 'etyy k m', '儿童泳衣/裤/帽', '6-53-868-', '50023868', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('869', '53', 'etps fs', '儿童配饰/发饰', '6-53-869-', '50024824', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('870', '53', 'etwz(0-16s)', '儿童袜子(0-16岁)', '6-53-870-', '50006584', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('871', '53', 'etqp tz mzfz', '儿童旗袍/唐装/民族服装', '6-53-871-', '50152002', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('872', '53', 'fcy zy', '反穿衣/罩衣', '6-53-872-', '50146004', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('873', '53', 'kz', '裤子', '6-53-873-', '50013618', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('874', '53', 'lsy pf hy', '连身衣/爬服/哈衣', '6-53-874-', '50010537', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('875', '53', 'mj', '马甲', '6-53-875-', '50010524', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('876', '53', 'my zzs', '毛衣/针织衫', '6-53-876-', '50010539', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('877', '53', 'ma mf', '棉袄/棉服', '6-53-877-', '50010531', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('878', '53', 'mz wj kz st et jt', '帽子/围巾/口罩/手套/耳套/脚套', '6-53-878-', '50006583', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('879', '53', 'pf dp', '披风/斗篷', '6-53-879-', '50010530', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('880', '53', 'qz', '裙子', '6-53-880-', '50013693', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('881', '53', 'qzz qzsz', '亲子装/亲子时装', '6-53-881-', '50012424', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('882', '53', 'qt', '其它', '6-53-882-', '50006217', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('883', '53', 'tx', 'T恤', '6-53-883-', '50013189', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('884', '53', 'tz', '套装', '6-53-884-', '50010540', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('885', '53', 'tx yex', '童鞋/婴儿鞋', '6-53-885-', '50012340', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('886', '53', 'wy rs', '卫衣/绒衫', '6-53-886-', '50010518', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('887', '53', 'wt jk dy', '外套/夹克/大衣', '6-53-887-', '50012308', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('888', '53', 'xf xfdz', '校服/校服定制', '6-53-888-', '50016450', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('889', '53', 'yelh', '婴儿礼盒', '6-53-889-', '50014512', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('890', '53', 'yrf yrnd', '羽绒服/羽绒内胆', '6-53-890-', '50010526', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('891', '54', 'bbjnp gxcp', '宝宝纪念品/个性产品', '6-54-891-', '50000813', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('892', '54', 'cn sgzz fz gjjwj', '彩泥/手工制作/仿真/过家家玩具', '6-54-892-', '50023502', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('893', '54', 'dd yk gx ftwj', '电动/遥控/惯性/发条玩具', '6-54-893-', '50007116', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('894', '54', 'dz fg cq zgwj', '电子/发光/充气/整蛊玩具', '6-54-894-', '50024050', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('895', '54', 'etb bb xb', '儿童包/背包/箱包', '6-54-895-', '50012404', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('896', '54', 'gd bjd sb jqr', '高达/BJD/手办/机器人', '6-54-896-', '50016058', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('897', '54', 'hwyd xx ctwj', '户外运动/休闲/传统玩具', '6-54-897-', '2512', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('898', '54', 'jtmx', '静态模型', '6-54-898-', '50024128', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('899', '54', 'jh ms cosplayyj', '聚会/魔术/cosplay用具', '6-54-899-', '50015994', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('900', '54', 'js mg mf yyq', '解锁/迷宫/魔方/悠悠球', '6-54-900-', '50023498', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('901', '54', 'jm cz cz pt pdwj', '积木/拆装/串珠/拼图/配对玩具', '6-54-901-', '50023504', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('902', '54', 'kt dm yxzb', '卡通/动漫/游戏周边', '6-54-902-', '50003682', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('903', '54', 'mrbylwj', '毛绒布艺类玩具', '6-54-903-', '50011975', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('904', '54', 'myxxfw', '母婴线下服务', '6-54-904-', '50023507', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('905', '54', 'qp zmyx', '棋牌/桌面游戏', '6-54-905-', '50008528', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('906', '54', 'qtwj', '其它玩具', '6-54-906-', '50000802', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('907', '54', 'tc etlh', '童车/儿童轮滑', '6-54-907-', '50013198', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('908', '54', 'ww pj', '娃娃/配件', '6-54-908-', '50012770', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('909', '54', 'wjmxlj gj hc fj', '玩具模型零件/工具/耗材/辅件', '6-54-909-', '50008737', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('910', '54', 'wyzb(sw)', '网游周边(实物)', '6-54-910-', '50015988', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('911', '54', 'xx sy hhwj', '学习/实验/绘画文具', '6-54-911-', '50015127', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('912', '54', 'yyc xswj', '游泳池/戏水玩具', '6-54-912-', '50012455', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('913', '54', 'yl jxsb dxss', '游乐/教学设备/大型设施', '6-54-913-', '50023508', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('914', '54', 'yexl bsso pxjs', '幼儿响铃/布书手偶/爬行健身', '6-54-914-', '50024048', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('915', '54', 'ydddmx', '油动电动模型', '6-54-915-', '50024060', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('916', '54', 'zj yl znwj', '早教/音乐/智能玩具', '6-54-916-', '50008876', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('917', '55', 'bj', '摆件', '7-55-917-', '50020835', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('918', '55', 'bs', '壁饰', '7-55-918-', '50001290', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('919', '55', 'cysp', '创意饰品', '7-55-919-', '50020856', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('920', '55', 'diy szyh', 'DIY/数字油画', '7-55-920-', '50002045', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('921', '55', 'dkgy', '雕刻工艺', '7-55-921-', '50020834', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('922', '55', 'fljpj', '风铃及配件', '7-55-922-', '50020846', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('923', '55', 'gh sf', '国画/书法', '7-55-923-', '50021905', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('924', '55', 'gys', '工艺伞', '7-55-924-', '50020851', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('925', '55', 'gyc', '工艺船', '7-55-925-', '50010356', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('926', '55', 'gys', '工艺扇', '7-55-926-', '50022440', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('927', '55', 'gl tl', '挂历/台历', '7-55-927-', '50003462', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('928', '55', 'hp hq fzh fzsp', '花瓶/花器/仿真花/仿真饰品', '7-55-928-', '50024938', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('929', '55', 'jjzs nz', '家居钟饰/闹钟', '7-55-929-', '50020850', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('930', '55', 'lz zt', '蜡烛/烛台', '7-55-930-', '50020848', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('931', '55', 'qtgysp', '其他工艺饰品', '7-55-931-', '50022568', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('932', '55', 'ts', '贴饰', '7-55-932-', '50020840', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('933', '55', 'wkhgz', '无框画挂钟', '7-55-933-', '50005919', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('934', '55', 'wkh（clmypb）', '无框画（此类目已屏蔽）', '7-55-934-', '50020839', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('935', '55', 'xdzsh', '现代装饰画', '7-55-935-', '50021907', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('936', '55', 'xk hk', '相框/画框', '7-55-936-', '50000561', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('937', '55', 'xl', '香薰炉', '7-55-937-', '50020854', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('938', '55', 'yh', '油画', '7-55-938-', '50021902', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('939', '55', 'zp zpq', '照片/照片墙', '7-55-939-', '50020841', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('940', '55', 'zsqm', '装饰器皿', '7-55-940-', '50020836', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('941', '55', 'zsj zsgb', '装饰架/装饰搁板', '7-55-941-', '50020842', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('942', '55', 'zsgp', '装饰挂牌', '7-55-942-', '50020843', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('943', '55', 'zsgg', '装饰挂钩', '7-55-943-', '50020845', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('944', '55', 'ztb', '竹炭包', '7-55-944-', '50020855', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('945', '56', 'dqtsgyp', '地区特色工艺品', '7-56-945-', '50021047', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('946', '56', 'hwgyp', '海外工艺品', '7-56-946-', '50021046', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('947', '56', 'hl', '葫芦', '7-56-947-', '50025777', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('948', '56', 'jzfbsp，hgzf(ymjgyp)', '禁止发布商品，后果自负(原民间工艺品)', '7-56-948-', '2902', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('949', '56', 'qttsgyp', '其他特色工艺品', '7-56-949-', '50025555', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('950', '56', 'ssmztsgyp', '少数民族特色工艺品', '7-56-950-', '50021045', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('951', '56', 'sdyp', '圣诞用品', '7-56-951-', '50025557', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('952', '56', 'zjgyp', '宗教工艺品', '7-56-952-', '50021048', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('953', '57', 'a tl', '案/台类', '7-57-953-', '50015886', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('954', '57', 'cl', '床类', '7-57-954-', '50015200', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('955', '57', 'cdl', '床垫类', '7-57-955-', '50021837', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('956', '57', 'ctjj', '成套家具', '7-57-956-', '50015771', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('957', '57', 'es xzzq', '二手/闲置专区', '7-57-957-', '50015566', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('958', '57', 'gdl', '根雕类', '7-57-958-', '50020614', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('959', '57', 'hw tyjj', '户外/庭院家具', '7-57-959-', '50015230', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('960', '57', 'gl', '柜类', '7-57-960-', '50001705', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('961', '57', 'jl', '几类', '7-57-961-', '50015816', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('962', '57', 'jl', '架类', '7-57-962-', '50008274', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('963', '57', 'jzl', '镜子类', '7-57-963-', '50020617', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('964', '57', 'jjfl', '家具辅料', '7-57-964-', '50015568', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('965', '57', 'jjfw（jgjsfws）', '家具服务（仅供集市服务商）', '7-57-965-', '50236005', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('966', '57', 'pf hc', '屏风/花窗', '7-57-966-', '50015915', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('967', '57', 'qqjj', '情趣家具', '7-57-967-', '50022373', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('968', '57', 'sfl', '沙发类', '7-57-968-', '50020006', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('969', '57', 'sjsjj', '设计师家具', '7-57-969-', '50022397', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('970', '57', 'mkj', '榻榻米空间', '7-57-970-', '50020615', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('971', '57', 'xl', '箱类', '7-57-971-', '50020618', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('972', '57', 'yjikea', '宜家IKEA', '7-57-972-', '50006281', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('973', '57', 'zjl', '坐具类', '7-57-973-', '50015455', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('974', '57', 'zl', '桌类', '7-57-974-', '50008280', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('975', '58', 'bgjj', '办公家具', '7-58-975-', '211503', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('976', '58', 'zyjj', '殡葬业家具', '7-58-976-', '50020681', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('977', '58', 'csjj', '超市家具', '7-58-977-', '50020612', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('978', '58', 'csjj', '城市家具', '7-58-978-', '50020671', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('979', '58', 'cy hbjj', '餐饮/烘焙家具', '7-58-979-', '50020672', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('980', '58', 'fzdjj', '服装店家具', '7-58-980-', '50020673', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('981', '58', 'fl mrjj', '发廊/美容家具', '7-58-981-', '50020677', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('982', '58', 'hj zg', '货架/展柜', '7-58-982-', '50015518', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('983', '58', 'jdjj', '酒店家具', '7-58-983-', '50015541', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('984', '58', 'sn zy jsjj', '桑拿/足浴/健身家具', '7-58-984-', '50020675', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('985', '58', 'xyjxjj', '校园教学家具', '7-58-985-', '50020679', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('986', '58', 'yl jb ktvjj', '娱乐/酒吧/KTV家具', '7-58-986-', '50020674', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('987', '58', 'yljj', '医疗家具', '7-58-987-', '50020680', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('988', '59', 'cf', '厨房', '7-59-988-', '50002409', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('989', '59', 'cz', '瓷砖', '7-59-989-', '50022270', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('990', '59', 'djds', '灯具灯饰', '7-59-990-', '50019935', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('991', '59', 'dn nqp srq', '地暖/暖气片/散热器', '7-59-991-', '50020906', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('992', '59', 'db', '地板', '7-59-992-', '50022271', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('993', '59', 'es xzzq', '二手/闲置专区', '7-59-993-', '50008725', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('994', '59', 'gy', '光源', '7-59-994-', '50013217', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('995', '59', 'hb cw by', '环保/除味/保养', '7-59-995-', '2159', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('996', '59', 'jcdd', '集成吊顶', '7-59-996-', '50019835', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('997', '59', 'lyj lyg', '晾衣架/晾衣杆', '7-59-997-', '50020966', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('998', '59', 'lt', '楼梯', '7-59-998-', '50022263', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('999', '59', 'm', '门', '7-59-999-', '50022357', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1000', '59', 'nqp', '暖气片', '7-59-1000-', '50068005', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1001', '59', 'pjzq', '配件专区', '7-59-1001-', '50008696', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1002', '59', 'qz', '墙纸', '7-59-1002-', '50013322', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1003', '59', 'qt', '其它', '7-59-1003-', '50008321', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1004', '59', 'tl（rjq）', '涂料（乳胶漆）', '7-59-1004-', '50024852', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1005', '59', 'wyyp', '卫浴用品', '7-59-1005-', '50020007', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1006', '59', 'yq', '油漆', '7-59-1006-', '50013222', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1007', '59', 'yb', '浴霸', '7-59-1007-', '50020573', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1008', '59', 'znjjxt', '智能家居系统', '7-59-1008-', '50021794', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1009', '60', 'bc', '板材', '7-60-1009-', '50020333', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1010', '60', 'bl', '玻璃', '7-60-1010-', '50020449', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1011', '60', 'c', '窗', '7-60-1011-', '50020421', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1012', '60', 'dhjxl', '雕花件系列', '7-60-1012-', '50020445', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1013', '60', 'fscl', '防水材料', '7-60-1013-', '50588003', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1014', '60', 'gdq', '隔断墙', '7-60-1014-', '50020348', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1015', '60', 'gycl', '隔音材料', '7-60-1015-', '50020397', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1016', '60', 'grcl', '隔热材料', '7-60-1016-', '50020400', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1017', '60', 'gc', '钢材', '7-60-1017-', '50020404', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1018', '60', 'ggb', '硅钙板', '7-60-1018-', '50013508', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1019', '60', 'lxc', '铝型材', '7-60-1019-', '50020412', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1020', '60', 'mf', '木方', '7-60-1020-', '50020372', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1021', '60', 'mcmft', '门窗密封条', '7-60-1021-', '50020442', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1022', '60', 'qtjcjc', '其它基础建材', '7-60-1022-', '50020392', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1023', '60', 'rzdls', '人造大理石', '7-60-1023-', '50013517', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1024', '60', 's s', '沙/石', '7-60-1024-', '50020352', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1025', '60', 'sn', '水泥', '7-60-1025-', '50020358', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1026', '60', 'sggc', '水管管材', '7-60-1026-', '50020362', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1027', '60', 'sgb', '石膏板', '7-60-1027-', '50020417', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1028', '60', 'sy', '砂岩', '7-60-1028-', '50020480', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1029', '60', 'sgbh', '施工保护', '7-60-1029-', '50013226', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1030', '60', 'trdls', '天然大理石', '7-60-1030-', '50020472', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1031', '60', 'xt', '线条', '7-60-1031-', '50020369', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1032', '60', 'xxzscl', '新型装饰材料', '7-60-1032-', '50020459', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1033', '60', 'ygf', '阳光房', '7-60-1033-', '50020608', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1034', '60', 'z', '砖', '7-60-1034-', '50020341', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1035', '61', 'ddgj', '电动工具', '7-61-1035-', '50020646', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1036', '61', 'jywj', '家用五金', '7-61-1036-', '50020486', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1037', '61', 'jxwj', '机械五金', '7-61-1037-', '50020490', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1038', '61', 'jdwj', '机电五金', '7-61-1038-', '50020491', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1039', '61', 'jgj', '紧固件', '7-61-1039-', '50020492', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1040', '61', 'qdgj', '气动工具', '7-61-1040-', '50020489', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1041', '61', 'rj', '刃具', '7-61-1041-', '50020493', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1042', '61', 'sdgj', '手动工具', '7-61-1042-', '50020487', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1043', '61', 'yqyb', '仪器仪表', '7-61-1043-', '50020519', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1044', '61', 'yy qzgj', '液压/起重工具', '7-61-1044-', '50020494', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1045', '62', 'aqjcsb', '安全检查设备', '7-62-1045-', '50021153', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1046', '62', 'byq', '变压器', '7-62-1046-', '50020975', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1047', '62', 'bxx', '布线箱', '7-62-1047-', '50020995', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1048', '62', 'cz', '插座', '7-62-1048-', '50020585', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1049', '62', 'dh', '底盒', '7-62-1049-', '50020596', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1050', '62', 'dgpj', '电工配件', '7-62-1050-', '50020998', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1051', '62', 'dlq', '断路器', '7-62-1051-', '50021027', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1052', '62', 'dx', '电线', '7-62-1052-', '50021033', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1053', '62', 'dgtg', '电工套管', '7-62-1053-', '50021042', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1054', '62', 'fdbjqcjxt', '防盗报警器材及系统', '7-62-1054-', '50021105', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1055', '62', 'jdq', '节电器', '7-62-1055-', '50020606', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1056', '62', 'jdq', '继电器', '7-62-1056-', '50020978', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1057', '62', 'jkqcjxt', '监控器材及系统', '7-62-1057-', '50021057', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1058', '62', 'jxb ct', '接线板/插头', '7-62-1058-', '50022516', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1059', '62', 'jhq', '交换器', '7-62-1059-', '50013405', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1060', '62', 'kg', '开关', '7-62-1060-', '50021011', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1061', '62', 'ledsb', 'LED设备', '7-62-1061-', '50022651', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1062', '62', 'tyndc', '太阳能电池', '7-62-1062-', '50020602', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1063', '62', 'xdc', '蓄电池', '7-62-1063-', '50020985', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1064', '62', 'xfbjsb', '消防报警设备', '7-62-1064-', '50021120', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1065', '62', 'zhq', '转换器', '7-62-1065-', '50020599', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1066', '62', 'qt', '其它', '7-62-1066-', '50013796', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1067', '63', 'bjqrb ctt gyrb', '背景墙软包/床头套/工艺软包', '7-63-1067-', '50024947', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1068', '63', 'bl ml sgdiyblml', '布料/面料/手工diy布料面料', '7-63-1068-', '50005033', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1069', '63', 'bydg dgmj', '布艺蛋糕/蛋糕毛巾', '7-63-1069-', '50010041', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1070', '63', 'czby', '餐桌布艺', '7-63-1070-', '50024918', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1071', '63', 'cl cs', '窗帘/窗纱', '7-63-1071-', '50024923', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1072', '63', 'cl mlpj', '窗帘/门帘配件', '7-63-1072-', '50024925', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1073', '63', 'csyp', '床上用品', '7-63-1073-', '50012791', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1074', '63', 'dd', '地垫', '7-63-1074-', '50000583', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1075', '63', 'dt', '地毯', '7-63-1075-', '50000582', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1076', '63', 'fcz sft kdz', '防尘罩/沙发套/空调罩', '7-63-1076-', '50005494', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1077', '63', 'frdiycl、gjjcp', '缝纫DIY材料、工具及成品', '7-63-1077-', '50017143', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1078', '63', 'gt bt', '挂毯/壁毯', '7-63-1078-', '50000584', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1079', '63', 'gl ml sc pj', '挂帘/门帘/纱窗/配件', '7-63-1079-', '50002789', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1080', '63', 'jjtx lt mt jjx', '家居拖鞋/凉拖/棉拖/居家鞋', '7-63-1080-', '50012051', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1081', '63', 'kd bz', '靠垫/抱枕', '7-63-1081-', '213002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1082', '63', 'mj yj yp', '毛巾/浴巾/浴袍', '7-63-1082-', '50010103', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1083', '63', 'qtll', '其他帘类', '7-63-1083-', '50024924', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1084', '63', 'qt', '其它', '7-63-1084-', '50006101', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1085', '63', 'szx cxgjpj', '十字绣/刺绣工具配件', '7-63-1085-', '290209', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1086', '63', 'szx cx', '十字绣/刺绣', '7-63-1086-', '50024922', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1087', '63', 'xxt mt rt', '休闲毯/毛毯/绒毯', '7-63-1087-', '50001871', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1088', '63', 'zd yd sfd', '坐垫/椅垫/沙发垫', '7-63-1088-', '50024797', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1089', '64', 'qt', '其他', '7-64-1089-', '50056001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1090', '64', 'zxsj snsj', '装修设计/室内设计', '7-64-1090-', '50023809', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1091', '64', 'zxsgfw', '装修施工服务', '7-64-1091-', '50023810', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1092', '64', 'zxgcjl', '装修工程监理', '7-64-1092-', '50023921', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1093', '65', 'bnt hl bnyp', '保暖贴/怀炉/保暖用品', '8-65-1093-', '50012512', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1094', '65', 'cylp', '创意礼品', '8-65-1094-', '50016434', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1095', '65', 'fhyp', '防护用品', '8-65-1095-', '50012514', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1096', '65', 'jr pdqdyp', '节日/派对庆典用品', '8-65-1096-', '2801', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1097', '65', 'jywjgj', '家用五金工具', '8-65-1097-', '50009206', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1098', '65', 'mt jf sx zgyj', '美体/减肥/塑型/增高用具', '8-65-1098-', '50023068', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1099', '65', 'qcyp', '驱虫用品', '8-65-1099-', '50025838', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1100', '65', 's yj fy fc', '伞/雨具/防雨/防潮', '8-65-1100-', '50010099', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1101', '65', 's mnfs pj bd bt', '扇/迷你风扇/配件/冰垫/冰贴', '8-65-1101-', '50010464', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1102', '65', 'xyp', '鞋用品', '8-65-1102-', '50006528', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1103', '65', 'xyp', '香薰用品', '8-65-1103-', '50025839', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1104', '65', 'z', '钟', '8-65-1104-', '50008275', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1105', '65', 'ztb', '竹炭包', '8-65-1105-', '50003948', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1106', '66', 'bz sb sh', '杯子/水杯/水壶', '8-66-1106-', '50006885', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1107', '66', 'bxrq bxqm', '保鲜容器/保鲜器皿', '8-66-1107-', '50014236', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1108', '66', 'cj', '餐具', '8-66-1108-', '50002796', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1109', '66', 'cj', '茶具', '8-66-1109-', '2107', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1110', '66', 'cyxgj cfcw', '厨用小工具/厨房储物', '8-66-1110-', '50008281', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1111', '66', 'jh jb jj', '酒壶/酒杯/酒具', '8-66-1111-', '215206', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1112', '66', 'kfqj', '咖啡器具', '8-66-1112-', '50004438', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1113', '66', 'pyj', '烹饪用具', '8-66-1113-', '50010101', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1114', '66', 'sk hbyj', '烧烤/烘焙用具', '8-66-1114-', '50002258', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1115', '66', 'ycxczyp', '一次性餐桌用品', '8-66-1115-', '50022523', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1116', '67', 'grxhqjyj', '个人洗护清洁用具', '8-67-1116-', '50009146', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1117', '67', 'jw dbqjyj', '家务/地板清洁用具', '8-67-1117-', '50003949', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1118', '67', 'jtsnyj', '家庭收纳用具', '8-67-1118-', '50018683', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1119', '67', 'jtzlyj', '家庭整理用具', '8-67-1119-', '50023189', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1120', '67', 'jtfcyj', '家庭防尘用具', '8-67-1120-', '50023243', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1121', '67', 'wyyj wypj', '卫浴用具/卫浴配件', '8-67-1121-', '2132', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1122', '67', 'ywx s hlyj', '衣物洗/晒/护理用具', '8-67-1122-', '50000569', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1123', '67', 'yxgj pj', '浴洗工具/配件', '8-67-1123-', '50022707', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1124', '68', 'ajgf', '阿胶膏方', '8-68-1124-', '50015219', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1125', '68', 'clbjp', '参类保健品', '8-68-1125-', '50005945', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1126', '68', 'dcxc', '冬虫夏草', '8-68-1126-', '50008046', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1127', '68', 'fm fcp', '蜂蜜/蜂产品', '8-68-1127-', '50005773', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1128', '68', 'jqzp', '枸杞及其制品', '8-68-1128-', '50015207', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1129', '68', 'lr', '鹿茸', '8-68-1129-', '50015134', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1130', '68', 'lz', '灵芝', '8-68-1130-', '50015194', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1131', '68', 'qtctzbp', '其他传统滋补品', '8-68-1131-', '50020296', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1132', '68', 'sq', '三七', '8-68-1132-', '50009980', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1133', '68', 'sy', '山药', '8-68-1133-', '50009979', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1134', '68', 's fd', '石斛/枫斗', '8-68-1134-', '50012186', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1135', '68', 'xg lwy', '雪蛤/林蛙油', '8-68-1135-', '50015211', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1136', '68', 'xzysp', '新资源食品', '8-68-1136-', '50050143', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1137', '68', 'ysc', '养生茶', '8-68-1137-', '50010420', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1138', '68', 'ystysp', '药食同源食品', '8-68-1138-', '50015218', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1139', '68', 'yw', '燕窝', '8-68-1139-', '50008044', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1140', '69', 'bg ph', '饼干/膨化', '8-69-1140-', '50010550', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1141', '69', 'gd dx', '糕点/点心', '8-69-1141-', '50552001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1142', '69', 'mj zl m gg', '蜜饯/枣类/梅/果干', '8-69-1142-', '50013061', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1143', '69', 'nrg zrf rlss', '牛肉干/猪肉脯/肉类熟食', '8-69-1143-', '50008613', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1144', '69', 'nl rzp ', '奶酪/乳制品/', '8-69-1144-', '50008430', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1145', '69', 'qkl diyqkl', '巧克力/DIY巧克力', '8-69-1145-', '50008055', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1146', '69', 'sht jg ch', '山核桃/坚果/炒货', '8-69-1146-', '50012981', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1147', '69', 'tgls gd bd', '糖果零食/果冻/布丁', '8-69-1147-', '50016091', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1148', '69', 'ys yg hwjs', '鱿鱼丝/鱼干/海味即食', '8-69-1148-', '50009556', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1149', '70', 'dwp gj sl', '调味品/果酱/沙拉', '8-70-1149-', '50009821', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1150', '70', 'fbss', '方便速食', '8-70-1150-', '50025689', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1151', '70', 'hbyl fl sptjj', '烘焙原料/辅料/食品添加剂', '8-70-1151-', '50010696', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1152', '70', 'm mf zl', '米/面粉/杂粮', '8-70-1152-', '50009837', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1153', '70', 'nbgh rlgh', '南北干货/肉类干货', '8-70-1153-', '50025682', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1154', '70', 'qtsp', '其他食品', '8-70-1154-', '50016443', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1155', '70', 'syy dwy', '食用油/调味油', '8-70-1155-', '50050378', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1156', '71', 'jsyp', '计生用品', '8-71-1156-', '50012829', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1157', '71', 'nyqj', '男用器具', '8-71-1157-', '50019617', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1158', '71', 'nyqj', '女用器具', '8-71-1158-', '50019630', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1159', '71', 'qqyp', '情趣用品', '8-71-1159-', '50019641', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1160', '71', 'qqny', '情趣内衣', '8-71-1160-', '50019651', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1161', '71', 'qqjj', '情趣家具', '8-71-1161-', '50020206', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1162', '72', 'jthjqjj', '家庭环境清洁剂', '8-72-1162-', '50012487', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1163', '72', 'js pjhlp', '家私/皮具护理品', '8-72-1163-', '50018971', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1164', '72', 'qcyp', '驱虫用品', '8-72-1164-', '210207', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1165', '72', 'sncc fxyp', '室内除臭/芳香用品', '8-72-1165-', '50018960', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1166', '72', 'wsj hd crnk', '卫生巾/护垫/成人尿裤', '8-72-1166-', '50016889', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1167', '72', 'xfy grqj', '洗发沐浴/个人清洁', '8-72-1167-', '50012482', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1168', '72', 'xxyp', '香熏用品', '8-72-1168-', '2165', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1169', '72', 'ywqjj hlj', '衣物清洁剂/护理剂', '8-72-1169-', '50018975', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1170', '72', 'zp sj', '纸品/湿巾', '8-72-1170-', '50012473', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1171', '73', 'crnf', '成人奶粉', '8-73-1171-', '50010422', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1172', '73', 'cy', '茶叶', '8-73-1172-', '50026397', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1173', '73', 'of mp cyp', '藕粉/麦片/冲饮品', '8-73-1173-', '50009857', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1174', '73', 'rzp', '乳制品', '8-73-1174-', '50604012', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1175', '73', 'srkf kfd f', '速溶咖啡/咖啡豆/粉', '8-73-1175-', '210605', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1176', '73', 'trffsp', '天然粉粉食品', '8-73-1176-', '50003860', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1177', '73', 'yl', '饮料', '8-73-1177-', '50026398', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1178', '74', 'bjyp', '保健饮品', '8-74-1178-', '50026809', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1179', '74', 'dbz ajs', '蛋白质/氨基酸', '8-74-1179-', '50026805', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1180', '74', 'dwjh tqw', '动物精华/提取物', '8-74-1180-', '50026808', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1181', '74', 'gnfhxssyybcj', '功能复合型膳食营养补充剂', '8-74-1181-', '50026810', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1182', '74', 'hyswl', '海洋生物类', '8-74-1182-', '50026803', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1183', '74', 'j g wswfj', '菌/菇/微生物发酵', '8-74-1183-', '50026804', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1184', '74', 'qt', '其他', '8-74-1184-', '50050237', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1185', '74', 'ssxw tshhw', '膳食纤维/碳水化合物', '8-74-1185-', '50026806', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1186', '74', 'wss kwz', '维生素/矿物质', '8-74-1186-', '50026802', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1187', '74', 'zwjh tqw', '植物精华/提取物', '8-74-1187-', '50026807', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1188', '74', 'zfs zl', '脂肪酸/脂类', '8-74-1188-', '50050227', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1189', '75', 'zsc pc jc tssc', '腌制蔬菜/泡菜/酱菜/脱水蔬菜', '8-75-1189-', '50025680', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1190', '75', 'd dzp', '蛋/蛋制品', '8-75-1190-', '50012382', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1191', '75', 'hx scp zp', '海鲜/水产品/制品', '8-75-1191-', '50050371', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1192', '75', 'sr rzp', '生肉/肉制品', '8-75-1192-', '50050372', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1193', '75', 'ss lc sfc', '熟食/凉菜/私房菜', '8-75-1193-', '50050643', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1194', '75', 'xxsc sczp', '新鲜蔬菜/蔬菜制品', '8-75-1194-', '50010566', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1195', '75', 'xxsg sgzp', '新鲜水果/水果制品', '8-75-1195-', '50050725', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1196', '75', 'xxdg', '新鲜蛋糕', '8-75-1196-', '50024607', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1197', '76', 'bq', '棒球', '9-76-1197-', '50017859', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1198', '76', 'bq', '壁球', '9-76-1198-', '50017625', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1199', '76', 'blq', '保龄球', '9-76-1199-', '50017757', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1200', '76', 'bq sh bsyd', '冰球/速滑/冰上运动', '9-76-1200-', '50018194', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1201', '76', 'ddc ddcpj', '电动车/电动车配件', '9-76-1201-', '50019782', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1202', '76', 'f zszq snxx', '飞镖/桌上足球/室内休闲', '9-76-1202-', '50018005', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1203', '76', 'f1 sc', 'F1/赛车', '9-76-1203-', '50018189', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1204', '76', 'gef', '高尔夫', '9-76-1204-', '50017776', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1205', '76', 'q', '橄榄球', '9-76-1205-', '50018096', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1206', '76', 'z kz mjyd', '毽子/空竹/民间运动', '9-76-1206-', '50018025', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1207', '76', 'hjyd', '击剑运动', '9-76-1207-', '50023370', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1208', '76', 'lq', '篮球', '9-76-1208-', '50013202', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1209', '76', 'lh hb jxyd', '轮滑/滑板/极限运动', '9-76-1209-', '50016689', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1210', '76', 'mj qp yzl', '麻将/棋牌/益智类', '9-76-1210-', '50017871', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1211', '76', 'msyd', '马术运动', '9-76-1211-', '50023363', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1212', '76', 'mp(yyyd)', '慢跑(有氧运动)', '9-76-1212-', '50019503', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1213', '76', 'ppq', '乒乓球', '9-76-1213-', '50012937', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1214', '76', 'pq', '排球', '9-76-1214-', '50017616', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1215', '76', 'pbj dxjsqx', '跑步机/大型健身器械', '9-76-1215-', '50017117', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1216', '76', 'qtssjnp', '其他赛事纪念品', '9-76-1216-', '50010745', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1217', '76', 'qtydyp', '其它运动用品', '9-76-1217-', '50010749', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1218', '76', 'sd gl bxzxc', '山地/公路/便携自行车', '9-76-1218-', '2612', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1219', '76', 'twt', '跳舞毯', '9-76-1219-', '50010828', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1220', '76', 'qd ws bh', '跆拳道/武术/搏击', '9-76-1220-', '50017913', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1221', '76', 'tbj zxxjsqc', '踏步机/中小型健身器材', '9-76-1221-', '50017085', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1222', '76', 'tq', '台球', '9-76-1222-', '50017722', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1223', '76', 'tjydqc', '田径运动器材', '9-76-1223-', '50017269', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1224', '76', 'wq', '网球', '9-76-1224-', '50017077', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1225', '76', 'wd jmc tc', '舞蹈/健美操/体操', '9-76-1225-', '50016472', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1226', '76', 'ymq', '羽毛球', '9-76-1226-', '50011556', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1227', '76', 'yy', '游泳', '9-76-1227-', '50016729', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1228', '76', 'other_type', '瑜伽', '9-76-1228-', '50016663', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1229', '76', 'ylc tycgss', '游乐场/体育场馆设施', '9-76-1229-', '50013253', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1230', '76', 'ydhj jjyp', '运动护具/急救用品', '9-76-1230-', '50019502', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1231', '76', 'ydsj jc', '运动书籍/教材', '9-76-1231-', '50019501', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1232', '76', 'ydjsk hyk', '运动健身卡/会员卡', '9-76-1232-', '50019500', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1233', '76', 'zq', '足球', '9-76-1233-', '50013823', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1234', '77', 'cdzb', '垂钓装备', '9-77-1234-', '50014023', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1235', '77', 'cdyd', '场地预定', '9-77-1235-', '50025640', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1236', '77', 'dj dygj', '刀具/多用工具', '9-77-1236-', '50014759', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1237', '77', 'dt lxzn yxzl', '地图/旅行指南/影像资料', '9-77-1237-', '50014767', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1238', '77', 'dsz sz', '登山杖/手杖', '9-77-1238-', '50014762', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1239', '77', 'fcd dx zt', '防潮垫/地席/枕头', '9-77-1239-', '50014756', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1240', '77', 'fh jszb', '防护/救生装备', '9-77-1240-', '50018158', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1241', '77', 'gl hwsp', '干粮/户外食品', '9-77-1241-', '50014766', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1242', '77', 'hwfz', '户外服装', '9-77-1242-', '50013888', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1243', '77', 'hwxw', '户外鞋袜', '9-77-1243-', '50019269', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1244', '77', 'hwxxjj', '户外休闲家具', '9-77-1244-', '50013892', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1245', '77', 'hwzm', '户外照明', '9-77-1245-', '50019601', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1246', '77', 'hd px', '活动/培训', '9-77-1246-', '50016382', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1247', '77', 'jmfs jmyp', '军迷服饰/军迷用品', '9-77-1247-', '50019007', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1248', '77', 'lxbxzb', '旅行便携装备', '9-77-1248-', '50016119', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1249', '77', 'lj cj ycskyp', '炉具/餐具/野餐烧烤用品', '9-77-1249-', '50014757', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1250', '77', 'sd', '睡袋', '9-77-1250-', '50013908', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1251', '77', 'tx dh hwbl', '通讯/导航/户外表类', '9-77-1251-', '50014763', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1252', '77', 'wyj ysy hwyj', '望远镜/夜视仪/户外眼镜', '9-77-1252-', '50019592', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1253', '77', 'xsqj hlyp', '洗漱清洁/护理用品', '9-77-1253-', '50014764', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1254', '77', 'ysyj ssrq', '饮水用具/盛水容器', '9-77-1254-', '50019712', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1255', '77', 'zxhwydzb', '专项户外运动装备', '9-77-1255-', '50013891', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1256', '77', 'zp tm zppj', '帐篷/天幕/帐篷配件', '9-77-1256-', '50019539', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1257', '78', 'jsfz', '健身服装', '9-78-1257-', '50022891', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1258', '78', 'ydtx', '运动T恤', '9-78-1258-', '50013228', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1259', '78', 'ydwy tts', '运动卫衣/套头衫', '9-78-1259-', '50011717', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1260', '78', 'ydfy', '运动风衣', '9-78-1260-', '50011718', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1261', '78', 'ydqk wt', '运动茄克/外套', '9-78-1261-', '50011739', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1262', '78', 'ydmy', '运动棉衣', '9-78-1262-', '50011720', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1263', '78', 'ydyrf', '运动羽绒服', '9-78-1263-', '50011721', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1264', '78', 'ydmy xs', '运动毛衣/线衫', '9-78-1264-', '50011704', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1265', '78', 'ydtz', '运动套装', '9-78-1265-', '50022728', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1266', '78', 'ydpolos', '运动POLO衫', '9-78-1266-', '50022889', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1267', '78', 'ydk', '运动裤', '9-78-1267-', '50023105', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1268', '78', 'ydq', '运动裙', '9-78-1268-', '50023109', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1269', '78', 'ydqf', '运动球服', '9-78-1269-', '50023415', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1270', '78', 'ydmj', '运动马甲', '9-78-1270-', '50023110', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1271', '79', 'bx xxx', '板鞋/休闲鞋', '9-79-1271-', '50012043', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1272', '79', 'bqx', '棒球鞋', '9-79-1272-', '50017865', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1273', '79', 'fbx', '帆布鞋', '9-79-1273-', '50012044', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1274', '79', 'lqx', '篮球鞋', '9-79-1274-', '50012031', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1275', '79', 'pbx', '跑步鞋', '9-79-1275-', '50012036', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1276', '79', 'ppqx', '乒乓球鞋', '9-79-1276-', '50012946', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1277', '79', 'pqx', '排球鞋', '9-79-1277-', '50017619', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1278', '79', 'qtydx', '其它运动鞋', '9-79-1278-', '50012064', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1279', '79', 'tx qsnx', '童鞋/青少年鞋', '9-79-1279-', '50026312', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1280', '79', 'wqx', '网球鞋', '9-79-1280-', '50012037', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1281', '79', 'ydstx lx', '运动沙滩鞋/凉鞋', '9-79-1281-', '50012048', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1282', '79', 'ydtx', '运动拖鞋', '9-79-1282-', '50012049', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1283', '79', 'ymqx', '羽毛球鞋', '9-79-1283-', '50012331', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1284', '79', 'zqx', '足球鞋', '9-79-1284-', '50012038', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1285', '79', 'zhxlx snjsx', '综合训练鞋/室内健身鞋', '9-79-1285-', '50012041', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1286', '80', 'byyp xpjps', '保养用品/鞋配件配饰', '9-80-1286-', '50019281', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1287', '80', 'djbb', '单肩背包', '9-80-1287-', '50023096', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1288', '80', 'fyz bbpj', '防雨罩/背包配件', '9-80-1288-', '50015943', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1289', '80', 'fsb fsx', '防水包/防水箱', '9-80-1289-', '50014502', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1290', '80', 'hwsyb', '户外摄影包', '9-80-1290-', '50014496', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1291', '80', 'jh wh', '颈环/腕环', '9-80-1291-', '50023103', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1292', '80', 'kb lb xxb', '挎包/拎包/休闲包', '9-80-1292-', '50014503', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1293', '80', 'lxb lxx', '旅行包/旅行箱', '9-80-1293-', '50014495', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1294', '80', 'qb kb zjb', '钱包/卡包/证件包', '9-80-1294-', '50014500', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1295', '80', 'qtfspj', '其他服饰配件', '9-80-1295-', '50015376', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1296', '80', 'sjbb', '双肩背包', '9-80-1296-', '50014493', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1297', '80', 'st', '手套', '9-80-1297-', '50015370', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1298', '80', 'tj ze', '头巾/遮耳', '9-80-1298-', '50015371', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1299', '80', 'tz mstz', '贴章/魔术贴章', '9-80-1299-', '50018245', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1300', '80', 'wj wb', '围巾/围脖', '9-80-1300-', '50015372', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1301', '80', 'xd', '鞋垫', '9-80-1301-', '50019690', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1302', '80', 'xt tj', '雪套/套脚', '9-80-1302-', '50015373', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1303', '80', 'ydgb lxb', '运动鼓包/旅行包', '9-80-1303-', '50023100', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1304', '80', 'yb sb pjb', '腰包/手包/配件包', '9-80-1304-', '50014494', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1305', '80', 'ydw', '运动袜', '9-80-1305-', '50015374', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1306', '80', 'yd', '腰带', '9-80-1306-', '50018244', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1307', '80', 'yy yk yp', '雨衣/雨裤/雨披', '9-80-1307-', '50015377', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1308', '80', 'ydm', '运动帽', '9-80-1308-', '50015369', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1309', '80', 'ydhj', '运动护具', '9-80-1309-', '50516004', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1310', '80', 'ydsh', '运动水壶', '9-80-1310-', '50522001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1311', '81', 'bs dt jtkq', '巴士/地铁/交通卡券', '10-81-1311-', '50012917', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1312', '81', 'jdmp', '景点门票', '10-81-1312-', '50017087', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1313', '81', 'lykq fw', '旅游卡券/服务', '10-81-1313-', '50012910', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1314', '81', 'lyzbsp', '旅游周边商品', '10-81-1314-', '50024207', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1315', '81', 'qz（txz）', '签证（通行证）', '10-81-1315-', '50012849', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1316', '81', 'sjycmp', '实景演出门票', '10-81-1316-', '50136001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1317', '81', 'yl yc', '邮轮/游船', '10-81-1317-', '50019242', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1318', '81', 'zc（lybc、zxczl）', '租车（旅游包车、自行车租赁）', '10-81-1318-', '50014469', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1319', '81', 'zyx gty yry', '自由行/跟团游/一日游', '10-81-1319-', '50262002', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1320', '82', 'jdkz', '酒店客栈', '10-82-1320-', '50016161', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1321', '82', 'jdkztc', '酒店客栈套餐', '10-82-1321-', '50019784', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1322', '83', 'gss qs kwjt', '观赏石/奇石/矿物晶体', '10-83-1322-', '50462018', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1323', '83', 'gwzx', '古玩杂项', '10-83-1323-', '2301', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1324', '83', 'hssc', '红色收藏', '10-83-1324-', '50019288', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1325', '83', 'js tcqj', '金属/搪瓷器具', '10-83-1325-', '50019273', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1326', '83', 'jszk', '金石篆刻', '10-83-1326-', '2305', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1327', '83', 'lhh gjsb', '连环画/古籍善本', '10-83-1327-', '50019306', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1328', '83', 'pz bpz', '票证/标牌章', '10-83-1328-', '50019296', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1329', '83', 'qb', '钱币', '10-83-1329-', '2310', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1330', '83', 'qwsc', '趣味收藏', '10-83-1330-', '50001931', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1331', '83', 'qtscp', '其它收藏品', '10-83-1331-', '2311', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1332', '83', 'sf hh', '书法/绘画', '10-83-1332-', '50012880', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1333', '83', 'sgy ms', '手工艺/民俗', '10-83-1333-', '50450016', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1334', '83', 'scpby jdgj', '收藏品保养/鉴定工具', '10-83-1334-', '50005060', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1335', '83', 't c cp', '陶/瓷/瓷片', '10-83-1335-', '50426004', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1336', '83', 'wfyp wj', '文房用品/文具', '10-83-1336-', '50019289', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1337', '83', 'xyscp', '西洋收藏品', '10-83-1337-', '50008583', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1338', '83', 'yp', '邮品', '10-83-1338-', '2309', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1339', '83', 'ys', '玉石', '10-83-1339-', '50024158', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1340', '83', 'yj jj', '烟具/酒具', '10-83-1340-', '50446020', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1341', '83', 'zjyp', '宗教用品', '10-83-1341-', '50019293', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1342', '83', 'zs', '紫砂', '10-83-1342-', '50003583', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1343', '84', 'bz', '报纸', '10-84-1343-', '50004621', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1344', '84', 'bkdy', '报刊订阅', '10-84-1344-', '50001378', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1345', '84', 'bj xllsj', '保健/心理类书籍', '10-84-1345-', '50004743', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1346', '84', 'cj', '传记', '10-84-1346-', '50004925', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1347', '84', 'dt dl', '地图/地理', '10-84-1347-', '50004835', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1348', '84', 'dy5yzq', '低于5元专区', '10-84-1348-', '50010689', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1349', '84', 'es xzs', '二手/闲置书', '10-84-1349-', '50011016', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1350', '84', 'etdw jf', '儿童读物/教辅', '10-84-1350-', '3314', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1351', '84', 'fl', '法律', '10-84-1351-', '50004816', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1352', '84', 'gy nyjs', '工业/农业技术', '10-84-1352-', '50004788', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1353', '84', 'gwybs tb、gbs', '国外原版书/台版、港版书', '10-84-1353-', '50004870', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1354', '84', 'gl', '管理', '10-84-1354-', '50000063', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1355', '84', 'gjs bkqs', '工具书/百科全书', '10-84-1355-', '3332', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1356', '84', 'gj（x）', '古籍（新）', '10-84-1356-', '50506014', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1357', '84', 'jsj wl', '计算机/网络', '10-84-1357-', '3306', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1358', '84', 'jj', '经济', '10-84-1358-', '50004687', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1359', '84', 'ks jc lw', '考试/教材/论文', '10-84-1359-', '50000072', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1360', '84', 'ls', '历史', '10-84-1360-', '50004658', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1361', '84', 'ly', '旅游', '10-84-1361-', '50004725', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1362', '84', 'mh dmxs', '漫画/动漫小说', '10-84-1362-', '50001965', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1363', '84', 'pxkc', '培训课程', '10-84-1363-', '50004960', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1364', '84', 'qkzz', '期刊杂志', '10-84-1364-', '50010485', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1365', '84', 'qt', '其他', '10-84-1365-', '50132001', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1366', '84', 'rwsk', '人文社科', '10-84-1366-', '50013002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1367', '84', 'sh', '生活', '10-84-1367-', '50003112', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1368', '84', 'shkx', '社会科学', '10-84-1368-', '50004620', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1369', '84', 'tbwkdsjzq', '淘宝网开店书籍专区', '10-84-1369-', '50005715', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1370', '84', 'tyyd', '体育运动', '10-84-1370-', '3334', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1371', '84', 'tyyd(x)', '体育运动(新)', '10-84-1371-', '50492006', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1372', '84', 'wy yywz', '外语/语言文字', '10-84-1372-', '3331', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1373', '84', 'wh', '文化', '10-84-1373-', '50004806', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1374', '84', 'wx', '文学', '10-84-1374-', '50000141', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1375', '84', 'wlyc', '网络原创', '10-84-1375-', '50026342', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1376', '84', 'xs', '小说', '10-84-1376-', '50004674', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1377', '84', 'yxws', '医学卫生', '10-84-1377-', '50004767', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1378', '84', 'ylss', '娱乐时尚', '10-84-1378-', '50004645', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1379', '84', 'ys', '艺术', '10-84-1379-', '50000054', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1380', '84', 'yesj', '育儿书籍', '10-84-1380-', '50004849', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1381', '84', 'zzjs', '政治军事', '10-84-1381-', '50004893', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1382', '84', 'zwsx lz', '自我实现/励志', '10-84-1382-', '50000049', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1383', '84', 'zrkx', '自然科学', '10-84-1383-', '50000177', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1384', '84', 'zxhzj', '哲学和宗教', '10-84-1384-', '3338', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1385', '85', 'crjyyx', '成人教育音像', '10-85-1385-', '50005271', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1386', '85', 'dy', '电影', '10-85-1386-', '50000201', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1387', '85', 'dsj', '电视剧', '10-85-1387-', '50003291', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1388', '85', 'dhd', '动画碟', '10-85-1388-', '50003679', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1389', '85', 'qt', '其它', '10-85-1389-', '3412', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1390', '85', 'shbk', '生活百科', '10-85-1390-', '50005272', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1391', '85', 'xqzy', '戏曲综艺', '10-85-1391-', '50005273', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1392', '85', 'ylcd dvd', '音乐CD/DVD', '10-85-1392-', '3415', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1393', '85', 'ye etjyyx', '育儿/儿童教育音像', '10-85-1393-', '50011257', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1394', '86', 'dzhcq', '电子合成器', '10-86-1394-', '50017504', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1395', '86', 'etwjlq', '儿童玩具乐器', '10-86-1395-', '50017321', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1396', '86', 'gq', '钢琴', '10-86-1396-', '50017316', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1397', '86', 'lqyx', '乐器音箱', '10-86-1397-', '50017318', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1398', '86', 'lqpj', '乐器配件', '10-86-1398-', '50017319', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1399', '86', 'lqdz cz', '乐器定制/出租', '10-86-1399-', '50017320', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1400', '86', 'lqjc qp', '乐器教材/曲谱', '10-86-1400-', '50017305', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1401', '86', 'midilq dnyl', 'MIDI乐器/电脑音乐', '10-86-1401-', '50017311', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1402', '86', 'mzlq', '民族乐器', '10-86-1402-', '50532001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1403', '86', 'xylq', '西洋乐器', '10-86-1403-', '50530002', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1404', '87', 'cwfsjpj', '宠物服饰及配件', '10-87-1404-', '50001739', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1405', '87', 'csljqtxc', '仓鼠类及其它小宠', '10-87-1405-', '50015293', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1406', '87', 'cwaxzy ly', '宠物爱心助养/领养', '10-87-1406-', '50023028', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1407', '87', 'xmyp', '畜牧用品', '10-87-1407-', '50023357', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1408', '87', 'cwfsp', '宠物附属品', '10-87-1408-', '50023358', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1409', '87', 'gg', '狗狗', '10-87-1409-', '217309', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1410', '87', 'gls', '狗零食', '10-87-1410-', '50015262', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1411', '87', 'm', '猫咪', '10-87-1411-', '50016383', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1412', '87', 'mzl', '猫主粮', '10-87-1412-', '50023066', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1413', '87', 'mls', '猫零食', '10-87-1413-', '50023067', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1414', '87', 'm gryp', '猫/狗日用品', '10-87-1414-', '50015285', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1415', '87', 'm gmrqjyp', '猫/狗美容清洁用品', '10-87-1415-', '50023206', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1416', '87', 'm gbjp', '猫/狗保健品', '10-87-1416-', '50015288', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1417', '87', 'm gylyp', '猫/狗医疗用品', '10-87-1417-', '50015289', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1418', '87', 'm gwj', '猫/狗玩具', '10-87-1418-', '217311', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1419', '87', 'mljqyp', '马类及其用品', '10-87-1419-', '50015294', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1420', '87', 'mr jy pz tydfw', '美容/寄养/配种/托运等服务', '10-87-1420-', '50015295', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1421', '87', 'nljyp', '鸟类及用品', '10-87-1421-', '50008604', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1422', '87', 'pc mcjqyp', '爬虫/鸣虫及其用品', '10-87-1422-', '50008622', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1423', '87', 'qzl', '犬主粮', '10-87-1423-', '50015380', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1424', '87', 'qtcw', '其它宠物', '10-87-1424-', '217302', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1425', '87', 'szsj', '水族世界', '10-87-1425-', '217312', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1426', '87', 'tljqyp', '兔类及其用品', '10-87-1426-', '50015292', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1427', '88', '7ztg', '7折团购', '10-88-1427-', '50017815', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1428', '88', '8ztg', '8折团购', '10-88-1428-', '50017814', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1429', '88', '6ztg', '6折团购', '10-88-1429-', '50017816', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1430', '88', 'c', '车', '10-88-1430-', '50014459', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1431', '88', 'dnwbsb', '电脑外部设备', '10-88-1431-', '50014452', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1432', '88', 'fz', '服装', '10-88-1432-', '50014446', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1433', '88', 'grhlyp', '个人护理用品', '10-88-1433-', '50014445', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1434', '88', 'gzwp', '贵重物品', '10-88-1434-', '50014453', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1435', '88', 'jyfzp', '家用纺织品', '10-88-1435-', '50014444', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1436', '88', 'jyblzp', '家用玻璃制品', '10-88-1436-', '50014454', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1437', '88', 'jytczp', '家用套餐制品', '10-88-1437-', '50014455', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1438', '88', 'jyjszp', '家用金属制品', '10-88-1438-', '50014456', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1439', '88', 'jysl zctzp', '家用塑料/竹草腾制品', '10-88-1439-', '50014461', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1440', '88', 'lp', '礼品', '10-88-1440-', '50014460', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1441', '88', 'm', '帽', '10-88-1441-', '50014447', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1442', '88', 'mp', '门票', '10-88-1442-', '50014465', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1443', '88', 'sp', '饰品', '10-88-1443-', '50014443', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1444', '88', 'sjjsz', '伞具及手杖', '10-88-1444-', '50014449', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1445', '88', 'wj', '文具', '10-88-1445-', '50014448', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1446', '88', 'wj', '玩具', '10-88-1446-', '50014458', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1447', '88', 'x', '鞋', '10-88-1447-', '50014450', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1448', '88', 'xb', '箱包', '10-88-1448-', '50014457', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1449', '88', 'yj', '眼镜', '10-88-1449-', '50014451', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1450', '88', 'ydzp', '运动制品', '10-88-1450-', '50014462', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1451', '88', 'yp', '邮票', '10-88-1451-', '50014464', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1452', '88', 'zb', '钟表', '10-88-1452-', '50014463', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1453', '89', 'bg wjdz', '办公/文具定制', '11-89-1453-', '50388003', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1454', '89', 'bzypdz', '包装用品定制', '11-89-1454-', '50510011', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1455', '89', 'fsxbdz', '服饰箱包定制', '11-89-1455-', '50025009', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1456', '89', 'qtdz', '其它定制', '11-89-1456-', '50025012', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1457', '89', 'ry zsdz', '日用/装饰定制', '11-89-1457-', '50025007', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1458', '89', 'smpjdz', '数码配件定制', '11-89-1458-', '50025008', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1459', '89', 'sjfw', '设计服务', '11-89-1459-', '50014854', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1460', '89', 'spdz', '饰品定制', '11-89-1460-', '50025010', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1461', '89', 'zpcy', '照片冲印', '11-89-1461-', '140701', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1462', '90', 'gwq lpk', '购物券/礼品卡', '11-90-1462-', '50050546', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1463', '90', 'mb yb dg', '面包/月饼/蛋糕', '11-90-1463-', '50019055', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1464', '90', 'spthq', '食品提货券', '11-90-1464-', '50019058', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1465', '91', 'cg qp kfg', '茶馆/棋牌/咖啡馆', '11-91-1465-', '50348001', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1466', '91', 'hwxxwl', '户外休闲玩乐', '11-91-1466-', '50026044', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1467', '91', 'jb jlb srhs', '酒吧/俱乐部/私人会所', '11-91-1467-', '50026008', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1468', '91', 'ktv', 'KTV', '11-91-1468-', '50019081', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1469', '91', 'mrmf mtmj', '美容美发/美体美甲', '11-91-1469-', '50019080', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1470', '91', 'qtxxyl', '其他休闲娱乐', '11-91-1470-', '50026568', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1471', '91', 'snxxwl', '室内休闲玩乐', '11-91-1471-', '50025982', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1472', '91', 'ydjs', '运动健身', '11-91-1472-', '50019079', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1473', '91', 'zy xy am', '足浴/洗浴/按摩', '11-91-1473-', '50019100', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1474', '92', 'cl cg', '茶楼/茶馆', '11-92-1474-', '50015762', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1475', '92', 'hg gg dl', '火锅/干锅/豆捞', '11-92-1475-', '50026554', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1476', '92', 'kc xc xskc', '快餐/小吃/西式快餐', '11-92-1476-', '50025996', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1477', '92', 'qtmszkq', '其他美食折扣券', '11-92-1477-', '50019072', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1478', '92', 'rhll yzms', '日韩料理/亚洲美食', '11-92-1478-', '50026022', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1479', '92', 'sk sr ky', '烧烤/烧肉/烤鱼', '11-92-1479-', '50026002', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1480', '92', 'tp bl kf ly', '甜品/冰淇淋/咖啡/冷饮', '11-92-1480-', '50019073', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1481', '92', 'xc', '西餐', '11-92-1481-', '50015758', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1482', '92', 'zc dfcx', '中餐/地方菜系', '11-92-1482-', '50015759', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1483', '92', 'zzc', '自助餐', '11-92-1483-', '50015757', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1484', '93', 'cs bmdk', '超市/便民店卡', '11-93-1484-', '50019096', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1485', '93', 'sc bhgwk', '商场/百货购物卡', '11-93-1485-', '50019097', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1486', '93', 'zhtyk', '综合通用卡', '11-93-1486-', '50019098', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1487', '94', 'jc jc zl', '教程/教材/资料', '11-94-1487-', '50026608', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1488', '94', 'jxfw', '教学服务', '11-94-1488-', '50026627', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1489', '94', 'xxk', '学习卡', '11-94-1489-', '50019103', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1490', '94', 'xxmskc', '线下面授课程', '11-94-1490-', '50026625', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1491', '94', 'xsycjx', '线上远程教学', '11-94-1491-', '50050439', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1492', '95', 'cyqxyp qxgj', '车用清洗用品/清洗工具', '11-95-1492-', '50018772', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1493', '95', 'cz px qt', '出租/培训/其它', '11-95-1493-', '2618', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1494', '95', 'mtc qszb', '摩托车/骑士装备', '11-95-1494-', '50014648', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1495', '95', 'qcyp nsp', '汽车用品/内饰品', '11-95-1495-', '50014480', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1496', '95', 'qcwsp jzz fh', '汽车外饰品/加装装潢/防护', '11-95-1496-', '50014481', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1497', '95', 'qclpj', '汽车零配件', '11-95-1497-', '50018708', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1498', '95', 'qcyy cydz dq', '汽车影音/车用电子/电器', '11-95-1498-', '50014482', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1499', '95', 'qcgpsdhyjpj', '汽车GPS导航仪及配件', '11-95-1499-', '50018720', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1500', '95', 'qcmr by wx', '汽车美容/保养/维修', '11-95-1500-', '50014479', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1501', '95', 'stfw', '实体服务', '11-95-1501-', '50023950', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1502', '96', 'cwsy', '宠物摄影', '11-96-1502-', '50050478', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1503', '96', 'etsy', '儿童摄影', '11-96-1503-', '50050477', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1504', '96', 'ggsy', '广告摄影', '11-96-1504-', '50050482', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1505', '96', 'hysy', '会议摄影', '11-96-1505-', '50050474', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1506', '96', 'hssy', '婚纱摄影', '11-96-1506-', '50050480', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1507', '96', 'qlsy', '情侣摄影', '11-96-1507-', '50050484', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1508', '96', 'qjfsy', '全家福摄影', '11-96-1508-', '50050485', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1509', '96', 'qtsyfw', '其他摄影服务', '11-96-1509-', '50050572', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1510', '96', 'sysxfw', '摄影摄像服务', '11-96-1510-', '50025268', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1511', '96', 'sp zphqzz', '视频/照片后期制作', '11-96-1511-', '50050476', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1512', '96', 'spsyfw', '商品摄影服务', '11-96-1512-', '50006258', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1513', '96', 'spzsspps zz', '商品展示视频拍摄/制作', '11-96-1513-', '50012958', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1514', '96', 'xzsy', '写真摄影', '11-96-1514-', '50050481', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1515', '96', 'xk xczz', '相框/相册制作', '11-96-1515-', '50050486', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1516', '96', 'yf qzsy', '孕妇/亲子摄影', '11-96-1516-', '50050473', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1517', '96', 'zjz', '证件照', '11-96-1517-', '50050475', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1518', '97', 'cymnzw', '创意迷你植物', '11-97-1518-', '50024881', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1519', '97', 'diyfzhcl', 'DIY仿真花材料', '11-97-1519-', '290503', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1520', '97', 'fzh lz sgcp', '仿真花/绿植/蔬果成品', '11-97-1520-', '50015193', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1521', '97', 'hlxhbz', '婚礼鲜花布置', '11-97-1521-', '50009339', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1522', '97', 'hp hq hp hj', '花瓶/花器/花盆/花架', '11-97-1522-', '50009361', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1523', '97', 'hh lzpz', '花卉/绿植盆栽', '11-97-1523-', '50024878', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1524', '97', 'hh sg cpzz', '花卉/蔬果/草坪种子', '11-97-1524-', '50024879', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1525', '97', 'kth qklh', '卡通花/巧克力花', '11-97-1525-', '50003023', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1526', '97', 'swyh', '商务用花', '11-97-1526-', '50015210', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1527', '97', 'tyzw xdsm gs', '庭院植物/行道树木/果树', '11-97-1527-', '50024880', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1528', '97', 'xhsd(tc)', '鲜花速递(同城)', '11-97-1528-', '290501', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1529', '97', 'xgl(ydysd)', '鲜果篮(预定与速递)', '11-97-1529-', '50004417', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1530', '97', 'yyyp', '园艺用品', '11-97-1530-', '50007010', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1531', '97', 'zd dyyh', '追悼/奠仪用花', '11-97-1531-', '50015215', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1532', '98', 'bdshfw', '本地生活服务', '11-98-1532-', '50019666', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1533', '98', 'cyms', '餐饮美食', '11-98-1533-', '50018254', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1534', '98', 'csgw lpk', '城市购物/礼品卡', '11-98-1534-', '50024037', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1535', '98', 'dyp', '电影票', '11-98-1535-', '50019673', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1536', '98', 'jdmp', '景点门票', '11-98-1536-', '50019263', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1537', '98', 'jhstg', '聚划算团购', '11-98-1537-', '50023362', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1538', '98', 'jypx', '教育培训', '11-98-1538-', '50025951', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1539', '98', 'syxz', '摄影写真', '11-98-1539-', '50023712', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1540', '98', 'tslp', '特色礼品', '11-98-1540-', '50018627', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1541', '98', 'tyss yc', '体育赛事/演出', '11-98-1541-', '50023864', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1542', '98', 'wfdc', '午饭订餐', '11-98-1542-', '50022994', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1543', '98', 'xxyl', '休闲娱乐', '11-98-1543-', '50050399', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1544', '99', 'cx rjkf', '程序/软件开发', '11-99-1544-', '50014852', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1545', '99', 'czptrj jkk', '充值平台软件/加款卡', '11-99-1545-', '50019286', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1546', '99', 'cwzx', '财务咨询', '11-99-1546-', '50015059', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1547', '99', 'dmt sy', '多媒体/摄影', '11-99-1547-', '50014853', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1548', '99', 'dnrj', '电脑软件', '11-99-1548-', '50010686', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1549', '99', 'glzx', '管理咨询', '11-99-1549-', '50015307', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1550', '99', 'qtfw', '其它服务', '11-99-1550-', '50003853', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1551', '99', 'rjcd-key xlh', '软件cd-key/序列号', '11-99-1551-', '50003316', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1552', '99', 'slfw', '商旅服务', '11-99-1552-', '50015312', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1553', '99', 'sbzc zx', '商标注册/咨询', '11-99-1553-', '50007280', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1554', '99', 'wdfw', '网店服务', '11-99-1554-', '50014850', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1555', '99', 'wlfw', '网络服务', '11-99-1555-', '50014851', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1556', '99', 'wlfw', '物流服务', '11-99-1556-', '50014855', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1557', '99', 'wlhyk ffk', '网络会员卡/付费卡', '11-99-1557-', '50019287', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1558', '99', 'zxfw', '咨询服务', '11-99-1558-', '50015313', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1559', '100', 'esf cs mf', '二手房/出售/卖房', '11-100-1559-', '50023598', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1560', '100', 'qtfcfw', '其他房产服务', '11-100-1560-', '50023902', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1561', '100', 'wtfw zjfw', '委托服务/中介服务', '11-100-1561-', '50023579', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1562', '100', 'xf xlp（dscwf）', '新房/新楼盘（待删除勿发）', '11-100-1562-', '50023944', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1563', '100', 'zf cz zl rzdz', '租房/出租/租赁/日租短租', '11-100-1563-', '50023597', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1564', '101', 'lc xc', '冷菜/小菜', '11-101-1564-', '50024456', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1565', '101', 'mf cf gf z', '米饭/炒饭/盖饭/粥', '11-101-1565-', '50024468', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1566', '101', 'ms jz bz b', '面食/饺子/包子/饼', '11-101-1566-', '50024470', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1567', '101', 'mb dg tp', '面包/蛋糕/甜品', '11-101-1567-', '50024479', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1568', '101', 'nc kf yl', '奶茶/咖啡/饮料', '11-101-1568-', '50024478', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1569', '101', 'qt', '其他', '11-101-1569-', '50024484', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1570', '101', 'rc cc gz', '热菜/炒菜/锅仔', '11-101-1570-', '50024461', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1571', '101', 'rhll cs', '日韩料理/刺身', '11-101-1571-', '50024477', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1572', '101', 'sk kr kc', '烧烤/烤肉/烤串', '11-101-1572-', '50024467', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1573', '101', 'sg pp gl', '水果/拼盘/果篮', '11-101-1573-', '50024481', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1574', '101', 'sxsc', '生鲜蔬菜', '11-101-1574-', '50024482', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1575', '101', 't  sg hg', '汤/煲/砂锅/火锅', '11-101-1575-', '50024466', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1576', '101', 'tc jc', '套餐/简餐', '11-101-1576-', '50024504', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1577', '101', 'xc xskc', '西餐/西式快餐', '11-101-1577-', '50024476', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1578', '101', 'yb lw tsxc', '鸭脖/卤味/特色小吃', '11-101-1578-', '50024480', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1579', '102', 'eszc', '二手整车', '11-102-1579-', '50011555', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1580', '102', 'xcdj', '新车定金', '11-102-1580-', '50018718', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1581', '102', 'xcqk', '新车全款', '11-102-1581-', '50024973', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1582', '103', 'dyp', '电影票', '11-103-1582-', '50019077', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1583', '103', 'dyyczb', '电影演出周边', '11-103-1583-', '50082008', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1584', '103', 'tyss', '体育赛事', '11-103-1584-', '50019086', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1585', '103', 'ychj', '演出话剧', '11-103-1585-', '50019084', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1586', '104', 'bm hl bj', '保姆/护理/保洁', '11-104-1586-', '50025125', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1587', '104', 'bmfw', '便民服务', '11-104-1587-', '50050489', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1588', '104', 'ggzz ctys dy fy', '广告制作/传统印刷/打印/复印', '11-104-1588-', '50014923', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1589', '104', 'hqfw', '婚庆服务', '11-104-1589-', '50025132', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1590', '104', 'jjfw', '家居服务', '11-104-1590-', '50050464', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1591', '104', 'jyk jycz', '加油卡/加油充值', '11-104-1591-', '50025138', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1592', '104', 'qcfw', '汽车服务', '11-104-1592-', '50025133', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1593', '104', 'ylfw', '医疗服务', '11-104-1593-', '50026535', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1594', '105', 'mtczc', '摩托车整车', '11-105-1594-', '50003794', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1595', '105', 'mtcpj', '摩托车配件', '11-105-1595-', '50078001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1596', '105', 'mtcqszb', '摩托车骑士装备', '11-105-1596-', '50070004', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1597', '105', 'mtczsyh', '摩托车装饰养护', '11-105-1597-', '50078002', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1598', '105', 'qtmtcyp', '其他摩托车用品', '11-105-1598-', '261407', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1599', '106', 'tbdpyhq', '淘宝店铺优惠券', '11-106-1599-', '50160001', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1600', '106', 'tmdpyhq', '天猫店铺优惠券', '11-106-1600-', '50160002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1601', '106', 'wldpdjq', '网络店铺代金券', '11-106-1601-', '50020126', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1602', '107', 'dmtfw', '多媒体服务', '12-107-1602-', '50594001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1603', '107', 'kf jzfw', '开发/建站服务', '12-107-1603-', '50582002', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1604', '107', 'wzlfw', '文字类服务', '12-107-1604-', '50590001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1605', '107', 'wdzxfw', '网店装修服务', '12-107-1605-', '50592001', '0', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1606', '109', 'dj', '定金', '12-109-1606-', '50023727', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1607', '109', 'dd', '订单', '12-109-1607-', '50023729', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1608', '109', 'dpsp', '搭配商品', '12-109-1608-', '50025832', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1609', '109', 'qt', '其它', '12-109-1609-', '50011150', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1610', '109', 'xpyl', '新品预览', '12-109-1610-', '50023726', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1611', '109', 'yf', '邮费', '12-109-1611-', '50023725', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1612', '109', 'zp', '赠品', '12-109-1612-', '50023728', '1', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1613', '110', 'bx', '保修', '12-110-1613-', '50232002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1614', '110', 'dbb', '电保包', '12-110-1614-', '50242002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1615', '110', 'fwk', '服务卡', '12-110-1615-', '50234002', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1616', '110', 'qt', '其它', '12-110-1616-', '50246001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1617', '110', 'qglb', '全国联保', '12-110-1617-', '50558001', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');
INSERT INTO `admin_base_product_category` VALUES ('1618', '110', 'wlfw', '物流服务', '12-110-1618-', '50242003', '2', '0', '1', '2013-05-22 00:00:00', '2013-05-22 00:00:00');

-- ----------------------------
-- Table structure for `admin_site_access`
-- ----------------------------
DROP TABLE IF EXISTS `admin_site_access`;
CREATE TABLE `admin_site_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID，关联site_role表rid字段',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联site_node表nid字段',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`) USING BTREE,
  KEY `nid` (`nid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='访问权限管理';

-- ----------------------------
-- Records of admin_site_access
-- ----------------------------
INSERT INTO `admin_site_access` VALUES ('1', '1', '1', '4', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('2', '1', '1', '32', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('3', '1', '1', '5', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('4', '1', '1', '47', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('5', '1', '1', '6', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('6', '1', '1', '48', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('7', '1', '1', '7', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('8', '1', '1', '14', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('9', '1', '1', '13', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('10', '1', '1', '12', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('11', '1', '1', '9', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('12', '1', '1', '8', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('13', '1', '1', '30', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('14', '1', '1', '31', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `admin_site_access` VALUES ('15', '1', '1', '33', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');

-- ----------------------------
-- Table structure for `admin_site_config`
-- ----------------------------
DROP TABLE IF EXISTS `admin_site_config`;
CREATE TABLE `admin_site_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sids` varchar(255) NOT NULL DEFAULT '1,2,3,4' COMMENT '网站ID，关联site_web表sid字段',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `key` varchar(20) NOT NULL DEFAULT '' COMMENT '键名',
  `value` varchar(200) DEFAULT '' COMMENT '键值',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sids`) USING BTREE,
  KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='配置管理';

-- ----------------------------
-- Records of admin_site_config
-- ----------------------------
INSERT INTO `admin_site_config` VALUES ('1', '', '后台是否记录用户登录', 'adminIsRecordUserLog', '', '1', '2013-02-02 21:00:26', '2013-05-02 14:18:21');
INSERT INTO `admin_site_config` VALUES ('2', '1,2', '是否启用博文', 'isEnableBlog', '', '1', '2013-03-09 21:36:23', '2013-05-02 10:42:20');
INSERT INTO `admin_site_config` VALUES ('3', '1,2', '是否启用广告js', 'isEnableAdJs', '', '1', '2013-03-17 19:08:05', '2013-05-02 14:10:52');
INSERT INTO `admin_site_config` VALUES ('4', '', '是否启用小说', 'isEnableNovel', '', '1', '2013-03-21 14:09:28', '2013-05-02 10:46:59');
INSERT INTO `admin_site_config` VALUES ('5', '1,2', '是否启用商品', 'isEnableProduct', '', '1', '2013-05-02 15:57:39', '2013-05-02 16:00:58');
INSERT INTO `admin_site_config` VALUES ('6', '', '是否启用地区国家选择', 'isEnableAreaCountry', '', '1', '2013-05-23 10:42:17', '2013-05-23 13:41:42');
INSERT INTO `admin_site_config` VALUES ('7', '1', '是否启用多应用设备', 'isEnableAppDevice', '', '1', '2013-11-01 10:47:34', '2013-11-01 10:47:34');

-- ----------------------------
-- Table structure for `admin_site_cron`
-- ----------------------------
DROP TABLE IF EXISTS `admin_site_cron`;
CREATE TABLE `admin_site_cron` (
  `scid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `key` varchar(60) NOT NULL DEFAULT '' COMMENT '键名',
  `value` text COMMENT '键值',
  `cycle_type` tinyint(5) DEFAULT '1' COMMENT '循环类型：1为每分钟，2为每小时，3为每天，4为每周，5为每月，6为每年',
  `cycle` tinyint(5) DEFAULT '0' COMMENT '循环周期',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`scid`),
  KEY `sid` (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='计划任务管理';

-- ----------------------------
-- Records of admin_site_cron
-- ----------------------------
INSERT INTO `admin_site_cron` VALUES ('1', '1', '地区行政代码采集', 'Collect/Area/administrative', '', '1', '1', '0', '1', '2013-05-09 10:46:49', '2013-05-09 10:56:01');

-- ----------------------------
-- Table structure for `admin_site_database`
-- ----------------------------
DROP TABLE IF EXISTS `admin_site_database`;
CREATE TABLE `admin_site_database` (
  `sdid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `parent_id` int(6) NOT NULL DEFAULT '0' COMMENT '字段父级ID',
  `sids` varchar(255) NOT NULL DEFAULT '1,2,3,4' COMMENT '网站ID，关联site_web表sid字段',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '字段编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '字段名称',
  `crumb` varchar(100) NOT NULL DEFAULT '' COMMENT '面包屑，用横杠分割',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`sdid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='数据库字段管理';

-- ----------------------------
-- Records of admin_site_database
-- ----------------------------
INSERT INTO `admin_site_database` VALUES ('1', '0', '1,2,3,4', 'site_web', '站点管理', '1-', '0', '1', '2013-04-23 10:19:24', '2013-04-23 15:02:11');
INSERT INTO `admin_site_database` VALUES ('2', '1', '1,2', 'record_no', '网站备案号', '1-2-', '0', '1', '2013-04-23 10:57:31', '2013-10-29 21:37:09');

-- ----------------------------
-- Table structure for `admin_site_node`
-- ----------------------------
DROP TABLE IF EXISTS `admin_site_node`;
CREATE TABLE `admin_site_node` (
  `nid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `parent_id` int(6) NOT NULL DEFAULT '0' COMMENT '节点父级ID',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '节点编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '节点名称',
  `crumb` varchar(100) NOT NULL DEFAULT '' COMMENT '面包屑，用横杠分割',
  `type` tinyint(1) DEFAULT '1' COMMENT '节点类型：1为引导栏目(不能发布内容,只作显示)，2为列表制',
  `menu_show` tinyint(1) DEFAULT '1' COMMENT '导航中是否显示: 0为不显示，1为显示',
  `table_name` varchar(30) DEFAULT '' COMMENT '数据库名_表名',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`nid`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='节点管理';

-- ----------------------------
-- Records of admin_site_node
-- ----------------------------
INSERT INTO `admin_site_node` VALUES ('1', '0', 'Admin', '总后台管理', '1-', '1', '1', '', '5', '1', '2012-12-20 21:02:04', '2013-03-27 13:52:44');
INSERT INTO `admin_site_node` VALUES ('2', '34', 'Content', '内容管理', '34-2-', '1', '1', '', '1', '1', '2012-12-20 21:02:04', '2013-04-28 22:24:48');
INSERT INTO `admin_site_node` VALUES ('3', '23', 'SiteNode', '节点管理', '1-16-23-3-', '2', '1', '', '1', '1', '2012-12-20 21:02:04', '2013-03-27 13:58:58');
INSERT INTO `admin_site_node` VALUES ('4', '2', 'Web', '站点管理', '34-2-4-', '1', '1', '', '1', '1', '2012-12-20 21:02:04', '2013-03-27 13:53:04');
INSERT INTO `admin_site_node` VALUES ('5', '32', 'index', '列表', '34-2-4-32-5-', '1', '0', '', '1', '1', '2012-12-20 21:02:04', '2013-03-27 13:56:44');
INSERT INTO `admin_site_node` VALUES ('6', '32', '', '添加', '34-2-4-32-6-', '1', '0', '', '3', '1', '2012-12-20 21:02:04', '2013-03-27 14:10:07');
INSERT INTO `admin_site_node` VALUES ('7', '32', 'update', '更新', '34-2-4-32-7-', '1', '0', '', '5', '1', '2012-12-20 21:02:04', '2012-12-20 21:02:04');
INSERT INTO `admin_site_node` VALUES ('8', '32', 'delete', '删除', '34-2-4-32-8-', '1', '0', '', '10', '1', '2012-12-20 21:02:04', '2013-03-04 17:29:34');
INSERT INTO `admin_site_node` VALUES ('9', '32', 'recycle', '还原', '34-2-4-32-9-', '1', '0', '', '9', '1', '2012-12-29 17:25:52', '2013-03-04 17:28:15');
INSERT INTO `admin_site_node` VALUES ('10', '44', 'SiteWeb', '站点管理', '1-16-44-10-', '2', '1', '', '1', '1', '2012-12-30 21:02:51', '2013-03-27 13:58:05');
INSERT INTO `admin_site_node` VALUES ('11', '10', 'index', '列表', '1-16-44-10-11-', '1', '0', '', '0', '1', '2013-01-01 21:08:51', '2013-03-27 13:58:13');
INSERT INTO `admin_site_node` VALUES ('12', '32', 'forbid', '禁止', '34-2-4-32-12-', '1', '0', '', '8', '1', '2013-01-02 12:52:20', '2013-03-04 17:29:47');
INSERT INTO `admin_site_node` VALUES ('13', '32', 'checkPass', '批准', '34-2-4-32-13-', '1', '0', '', '7', '1', '2013-01-02 12:52:52', '2013-03-04 17:29:18');
INSERT INTO `admin_site_node` VALUES ('14', '32', 'resume', '恢复', '34-2-4-32-14-', '1', '0', '', '6', '1', '2013-01-02 13:02:19', '2013-03-04 16:55:45');
INSERT INTO `admin_site_node` VALUES ('15', '17', 'ArticleInfo', '文章管理', '34-2-17-15-', '2', '1', '', '1', '1', '2013-01-03 22:02:04', '2013-03-27 14:08:56');
INSERT INTO `admin_site_node` VALUES ('16', '1', 'Site', '设置管理', '1-16-', '1', '1', '', '1', '1', '2013-01-21 16:50:50', '2013-03-27 13:57:12');
INSERT INTO `admin_site_node` VALUES ('17', '2', 'Article', '文章管理', '34-2-17-', '1', '1', '', '3', '1', '2013-01-21 16:53:09', '2013-03-27 14:08:49');
INSERT INTO `admin_site_node` VALUES ('18', '2', 'Picture', '图片管理', '34-2-18-', '1', '1', '', '4', '1', '2013-01-23 21:37:46', '2013-03-27 14:09:03');
INSERT INTO `admin_site_node` VALUES ('19', '18', 'ArticleAlbum', '相册管理', '34-2-18-19-', '2', '1', '', '1', '1', '2013-01-23 21:39:45', '2013-03-27 14:09:10');
INSERT INTO `admin_site_node` VALUES ('20', '18', 'ArticleAlbumPhoto', '相片管理', '34-2-18-20-', '2', '1', '', '2', '1', '2013-01-23 21:40:33', '2013-03-27 14:09:17');
INSERT INTO `admin_site_node` VALUES ('21', '16', 'Base', '数据管理', '1-16-21-', '1', '1', '', '4', '1', '2013-01-27 13:17:31', '2013-03-27 13:58:48');
INSERT INTO `admin_site_node` VALUES ('22', '21', 'BaseLang', '语言管理', '1-16-21-22-', '2', '1', '', '1', '1', '2013-01-27 13:24:12', '2013-03-27 13:58:53');
INSERT INTO `admin_site_node` VALUES ('23', '16', 'Competence', '权限管理', '1-16-23-', '1', '1', '', '2', '1', '2013-01-29 16:46:00', '2013-03-27 13:58:42');
INSERT INTO `admin_site_node` VALUES ('24', '23', 'SiteRole', '角色管理', '1-16-23-24-', '2', '1', '', '2', '1', '2013-01-29 16:47:36', '2013-03-27 13:59:04');
INSERT INTO `admin_site_node` VALUES ('25', '23', 'SiteRoleUser', '角色用户管理', '1-16-23-25-', '2', '0', '', '3', '1', '2013-01-29 16:51:59', '2013-03-27 13:59:10');
INSERT INTO `admin_site_node` VALUES ('26', '23', 'SiteAccess', '访问管理', '1-16-23-26-', '2', '0', '', '4', '1', '2013-01-29 16:55:56', '2013-03-27 13:59:17');
INSERT INTO `admin_site_node` VALUES ('27', '44', 'SiteConfig', '配置管理', '1-16-44-27-', '2', '1', '', '2', '1', '2013-01-30 21:21:28', '2013-03-27 13:57:58');
INSERT INTO `admin_site_node` VALUES ('28', '0', 'AdminUser', '用户管理', '28-', '1', '1', '', '4', '1', '2013-02-04 17:00:51', '2013-03-27 13:52:37');
INSERT INTO `admin_site_node` VALUES ('29', '45', 'UserBase', '基础管理', '28-65-45-29-', '2', '1', '', '1', '1', '2013-02-04 17:05:09', '2013-03-27 14:03:02');
INSERT INTO `admin_site_node` VALUES ('30', '69', 'Index', '后台管理', '34-2-69-30-', '1', '1', '', '1', '1', '2013-02-04 17:05:09', '2013-03-27 15:01:54');
INSERT INTO `admin_site_node` VALUES ('31', '30', 'Index', '列表', '34-2-69-30-31-', '1', '0', '', '1', '1', '2013-02-04 17:05:09', '2013-03-27 15:02:08');
INSERT INTO `admin_site_node` VALUES ('32', '4', 'SiteMenu', '菜单管理', '34-2-4-32-', '2', '1', '', '2', '1', '2013-02-22 15:48:06', '2013-03-27 13:53:58');
INSERT INTO `admin_site_node` VALUES ('33', '30', 'leftMenu', '左侧导航', '34-2-69-30-33-', '1', '0', '', '2', '1', '2013-03-02 19:07:22', '2013-03-27 15:02:17');
INSERT INTO `admin_site_node` VALUES ('34', '0', 'AdminBase', '基础管理', '34-', '1', '1', '', '1', '1', '2013-03-02 19:18:14', '2013-03-27 13:51:59');
INSERT INTO `admin_site_node` VALUES ('35', '0', 'AdminBlog', '博文管理', '35-', '1', '1', '', '3', '1', '2013-03-02 19:21:26', '2013-03-27 14:03:13');
INSERT INTO `admin_site_node` VALUES ('36', '35', 'BlogContent', '内容管理', '35-36-', '1', '1', '', '1', '1', '2013-03-02 19:25:23', '2013-03-27 14:03:18');
INSERT INTO `admin_site_node` VALUES ('37', '36', 'BlogPicture', '图片管理', '35-36-37-', '1', '1', '', '2', '1', '2013-03-02 19:29:59', '2013-03-27 14:03:41');
INSERT INTO `admin_site_node` VALUES ('38', '37', 'BlogAlbum', '相册管理', '35-36-37-38-', '2', '1', '', '1', '1', '2013-03-02 19:33:03', '2013-03-27 14:03:47');
INSERT INTO `admin_site_node` VALUES ('39', '37', 'BlogAlbumPhoto', '相片管理', '35-36-37-39-', '2', '1', '', '2', '1', '2013-03-02 19:35:40', '2013-03-27 14:03:53');
INSERT INTO `admin_site_node` VALUES ('40', '36', 'Blog', '博文管理', '35-36-40-', '1', '1', '', '1', '1', '2013-03-02 19:39:20', '2013-03-27 14:03:23');
INSERT INTO `admin_site_node` VALUES ('41', '40', 'BlogInfo', '博文管理', '35-36-40-41-', '2', '1', '', '1', '1', '2013-03-02 19:40:14', '2013-03-27 14:03:28');
INSERT INTO `admin_site_node` VALUES ('42', '46', 'ProductContent', '内容管理', '46-42-', '2', '1', '', '1', '1', '2013-03-02 19:41:58', '2013-03-27 14:04:22');
INSERT INTO `admin_site_node` VALUES ('43', '40', 'BlogTag', '标签管理', '35-36-40-43-', '2', '1', '', '2', '1', '2013-03-02 19:43:06', '2013-03-27 14:03:35');
INSERT INTO `admin_site_node` VALUES ('44', '16', 'SiteBase', '基础管理', '1-16-44-', '1', '1', '', '1', '1', '2013-03-03 13:31:44', '2013-03-27 13:57:38');
INSERT INTO `admin_site_node` VALUES ('45', '65', 'User', '用户管理', '28-65-45-', '1', '1', '', '1', '1', '2013-03-03 16:12:26', '2013-03-27 14:02:41');
INSERT INTO `admin_site_node` VALUES ('46', '0', 'AdminProduct', '产品管理', '46-', '1', '1', '', '2', '1', '2013-03-03 18:07:12', '2013-03-27 14:04:18');
INSERT INTO `admin_site_node` VALUES ('47', '32', 'add', '新增', '34-2-4-32-47-', '1', '0', '', '2', '1', '2013-03-04 16:49:02', '2013-03-27 14:09:58');
INSERT INTO `admin_site_node` VALUES ('48', '32', 'edit', '修改', '34-2-4-32-48-', '1', '0', '', '4', '1', '2013-03-04 16:49:42', '2013-03-27 14:10:36');
INSERT INTO `admin_site_node` VALUES ('49', '34', 'AdminAd', '广告管理', '34-49-', '1', '1', '', '2', '1', '2013-03-08 21:16:01', '2013-03-27 14:05:08');
INSERT INTO `admin_site_node` VALUES ('50', '49', 'Ad', '广告管理', '34-49-50-', '1', '1', '', '1', '1', '2013-03-08 21:17:14', '2013-03-27 14:56:17');
INSERT INTO `admin_site_node` VALUES ('51', '50', 'AdInfo', '广告管理', '34-49-50-51-', '2', '1', '', '2', '1', '2013-03-08 21:19:02', '2013-03-27 14:05:26');
INSERT INTO `admin_site_node` VALUES ('52', '50', 'AdPosition', '广告位管理', '34-49-50-52-', '2', '1', '', '1', '1', '2013-03-08 21:19:49', '2013-03-27 14:05:18');
INSERT INTO `admin_site_node` VALUES ('53', '50', 'AdSchedule', '排期管理', '34-49-50-53-', '2', '1', '', '3', '1', '2013-03-08 21:20:26', '2013-03-27 14:05:33');
INSERT INTO `admin_site_node` VALUES ('54', '55', 'AdFunction', '方法管理', '34-49-55-54-', '2', '1', '', '1', '1', '2013-03-08 21:21:11', '2013-03-27 14:05:46');
INSERT INTO `admin_site_node` VALUES ('55', '49', 'AdSite', '广告配置', '34-49-55-', '1', '1', '', '2', '1', '2013-03-09 19:11:17', '2013-03-27 14:05:39');
INSERT INTO `admin_site_node` VALUES ('56', '4', 'SiteWeb', '站点管理', '34-2-4-56-', '2', '1', '', '1', '1', '2013-03-12 18:01:26', '2013-10-30 21:21:34');
INSERT INTO `admin_site_node` VALUES ('57', '2', 'Plate', '面板管理', '34-2-57-', '1', '1', '', '2', '1', '2013-03-24 14:30:17', '2013-03-27 14:07:56');
INSERT INTO `admin_site_node` VALUES ('58', '57', 'SitePlateGroup', '面板分组管理', '34-2-57-58-', '2', '1', '', '1', '1', '2013-03-24 14:32:44', '2013-03-27 14:08:13');
INSERT INTO `admin_site_node` VALUES ('59', '57', 'SitePlate', '面板管理', '34-2-57-59-', '2', '1', '', '2', '1', '2013-03-24 14:33:09', '2013-03-27 14:08:20');
INSERT INTO `admin_site_node` VALUES ('60', '57', 'SitePlateContent', '面板内容管理', '34-2-57-60-', '2', '0', '', '3', '1', '2013-03-24 14:33:34', '2013-03-27 14:08:26');
INSERT INTO `admin_site_node` VALUES ('61', '42', 'Product', '商品管理', '46-42-61-', '1', '1', '', '1', '1', '2013-03-27 13:32:47', '2013-03-27 14:04:27');
INSERT INTO `admin_site_node` VALUES ('62', '42', 'ProductPicture', '图片管理', '46-42-62-', '1', '1', '', '2', '1', '2013-03-27 13:36:25', '2013-03-27 14:04:33');
INSERT INTO `admin_site_node` VALUES ('63', '61', 'ProductGoods', '商品管理', '46-42-61-63-', '2', '1', '', '1', '1', '2013-03-27 13:37:20', '2013-03-27 14:04:45');
INSERT INTO `admin_site_node` VALUES ('64', '61', 'ProductChannel', '渠道管理', '46-42-61-64-', '2', '1', '', '2', '1', '2013-03-27 13:39:10', '2013-04-11 11:00:37');
INSERT INTO `admin_site_node` VALUES ('65', '28', 'Users', '基础管理', '28-65-', '1', '1', '', '1', '1', '2013-03-27 14:01:06', '2013-03-27 14:01:06');
INSERT INTO `admin_site_node` VALUES ('66', '62', 'ProductAlbum', '相册管理', '46-42-62-66-', '2', '1', '', '1', '1', '2013-03-27 14:24:21', '2013-03-27 14:24:21');
INSERT INTO `admin_site_node` VALUES ('67', '62', 'ProductAlbumPhoto', '相片管理', '46-42-62-67-', '2', '1', '', '2', '1', '2013-03-27 14:32:41', '2013-03-27 14:32:41');
INSERT INTO `admin_site_node` VALUES ('68', '70', 'ProductDescriptionCategory', '描述分类管理', '46-42-70-68-', '2', '1', '', '1', '1', '2013-03-27 14:52:52', '2013-03-27 15:03:34');
INSERT INTO `admin_site_node` VALUES ('69', '2', 'WebSite', '站点配置', '34-2-69-', '1', '0', '', '6', '1', '2013-03-27 14:57:36', '2013-04-22 14:42:32');
INSERT INTO `admin_site_node` VALUES ('70', '42', 'ProductSite', '商品配置', '46-42-70-', '1', '1', '', '3', '1', '2013-03-27 15:02:58', '2013-03-27 15:02:58');
INSERT INTO `admin_site_node` VALUES ('71', '61', 'ProductChannelGoods', '渠道商品管理', '46-42-61-71-', '2', '1', '', '3', '1', '2013-04-11 11:02:29', '2013-04-11 11:02:29');
INSERT INTO `admin_site_node` VALUES ('72', '21', 'BaseArea', '地区管理', '1-16-21-72-', '2', '1', '', '4', '1', '2013-04-17 21:13:15', '2013-04-17 21:13:15');
INSERT INTO `admin_site_node` VALUES ('73', '2', 'Job', '招聘管理', '34-2-73-', '1', '1', '', '5', '1', '2013-04-22 15:07:33', '2013-04-22 15:07:33');
INSERT INTO `admin_site_node` VALUES ('74', '73', 'JobInfo', '招聘管理', '34-2-73-74-', '2', '1', '', '1', '1', '2013-04-22 15:10:07', '2013-04-22 15:10:07');
INSERT INTO `admin_site_node` VALUES ('75', '16', 'Database', '字段管理', '1-16-75-', '1', '1', '', '3', '1', '2013-04-22 22:25:18', '2013-04-22 22:25:18');
INSERT INTO `admin_site_node` VALUES ('76', '75', 'SiteDatabase', '字段管理', '1-16-75-76-', '2', '1', '', '1', '1', '2013-04-22 22:26:18', '2013-04-22 22:26:18');
INSERT INTO `admin_site_node` VALUES ('77', '21', 'BaseLangField', '语言转换', '1-16-21-77-', '2', '1', '', '2', '1', '2013-04-23 17:44:28', '2013-10-31 20:05:33');
INSERT INTO `admin_site_node` VALUES ('78', '21', 'BaseBrand', '品牌管理', '1-16-21-78-', '2', '1', '', '5', '1', '2013-05-04 13:57:37', '2013-05-04 13:59:56');
INSERT INTO `admin_site_node` VALUES ('79', '44', 'SiteCron', '任务管理', '1-16-44-79-', '2', '1', '', '3', '1', '2013-05-09 09:53:08', '2013-05-09 09:53:08');
INSERT INTO `admin_site_node` VALUES ('80', '21', 'BaseProductCategory', '商品分类管理', '1-16-21-80-', '2', '1', '', '6', '1', '2013-05-22 17:04:49', '2013-05-22 17:04:49');
INSERT INTO `admin_site_node` VALUES ('81', '21', 'BaseAppDevice', '应用设备管理', '1-16-21-81-', '2', '1', '', '3', '1', '2013-10-31 20:30:28', '2013-10-31 20:30:28');

-- ----------------------------
-- Table structure for `admin_site_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_site_role`;
CREATE TABLE `admin_site_role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色父级ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '角色名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`rid`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='设置角色表';

-- ----------------------------
-- Records of admin_site_role
-- ----------------------------
INSERT INTO `admin_site_role` VALUES ('1', '1', '0', '超级管理员', '1', '1', '2013-02-03 16:08:22', '2013-02-03 16:08:22');
INSERT INTO `admin_site_role` VALUES ('2', '1', '0', '管理员', '2', '1', '2013-02-03 16:25:25', '2013-02-03 16:26:06');

-- ----------------------------
-- Table structure for `admin_site_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_site_role_user`;
CREATE TABLE `admin_site_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID，关联site_role表rid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设置角色关联用户表';

-- ----------------------------
-- Records of admin_site_role_user
-- ----------------------------
INSERT INTO `admin_site_role_user` VALUES ('1', '1', '1', '2', '1', '2013-02-07 14:58:48', '2013-02-07 14:58:48');

-- ----------------------------
-- Table structure for `admin_site_web`
-- ----------------------------
DROP TABLE IF EXISTS `admin_site_web`;
CREATE TABLE `admin_site_web` (
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
  KEY `domain` (`domain`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='站点管理';

-- ----------------------------
-- Records of admin_site_web
-- ----------------------------
INSERT INTO `admin_site_web` VALUES ('1', 'zh-cn', 'altila', 'altila网', 'altila,陈强,个人网站,IT,PHP,Jquery,JS', 'altila(陈强)个人网站,记录关于IT中PHP、JS、Jquer等技术方面咨询', 'default', '沪ICP备10000732号', '', '1', '1', '2012-12-11 13:58:09', '2013-04-24 10:19:54');
INSERT INTO `admin_site_web` VALUES ('2', 'en-us', 'altila', 'altilaWeb', 'altila', 'altila', 'default', '', '', '2', '1', '2012-12-11 13:58:09', '2013-04-28 21:40:12');
INSERT INTO `admin_site_web` VALUES ('3', 'en-us', 'altilacms', 'Altila Web', '', '', 'default', '', null, '0', '1', '2013-01-01 11:29:26', '2013-01-04 16:21:12');
INSERT INTO `admin_site_web` VALUES ('4', 'zh-cn', 'altilacms', 'Altila网', '', '', 'default', '', null, '0', '1', '2013-01-04 16:20:42', '2013-01-04 16:21:51');
INSERT INTO `admin_site_web` VALUES ('5', 'zh-cn', 'zhuoao', 'aaaa', '', '', 'default', '', null, '0', '2', '2013-01-04 16:22:27', '2013-01-04 17:27:41');

-- ----------------------------
-- Table structure for `base_ad_function`
-- ----------------------------
DROP TABLE IF EXISTS `base_ad_function`;
CREATE TABLE `base_ad_function` (
  `afid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '广告方法编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '广告方法名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`afid`),
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告方法表';

-- ----------------------------
-- Records of base_ad_function
-- ----------------------------
INSERT INTO `base_ad_function` VALUES ('1', 'adOriginal', '无效果', '1', '1', '2013-03-08 22:35:21', '2013-03-08 22:35:21');
INSERT INTO `base_ad_function` VALUES ('2', 'adCarousel', '轮播', '2', '1', '2013-03-08 22:35:34', '2013-03-08 22:36:43');

-- ----------------------------
-- Table structure for `base_ad_info`
-- ----------------------------
DROP TABLE IF EXISTS `base_ad_info`;
CREATE TABLE `base_ad_info` (
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `apid` (`apid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告信息表';

-- ----------------------------
-- Records of base_ad_info
-- ----------------------------
INSERT INTO `base_ad_info` VALUES ('1', '1', '1', 'Logo', '', '0', '/', 'http://s.mb-go.com/pub7/images/style/logo/logo_bg.jpg', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-09 17:11:48', '2013-03-16 16:42:23');
INSERT INTO `base_ad_info` VALUES ('2', '1', '4', '广告魔方', 'aaa', '3', '', '&lt;div class=&quot;magic_box&quot; style=&quot;height:392px&quot;&gt;&lt;input class=&quot;_sideLen&quot; name=&quot;_sideLen&quot; value=&quot;98&quot; type=&quot;hidden&quot;&gt;&lt;div class=&quot;magic_item&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.banggo.com/Theme/theme_MB-ZHUTI538.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down1.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:196px;top:0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_6-y-w35-ly-b6bm-f.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down2.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:196px;top:196px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_5q-s-n54mp5a-sn5oi-y5-y-o15b-c4.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down3.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index: 10; left: 392px; top: 0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_5r-w357u15a6d5a6d.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down4.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:588px;top:0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_576-o5b2x5-y6-c.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down5.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:588px;top:196px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_a.shtml?clickType=1&amp;amp;word=kitty&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down6.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:784px;top:0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_a.shtml?clickType=1&amp;amp;word=CHICALOCA&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down7.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;left:784px;top:196px;z-index:10;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_a.shtml?clickType=1&amp;amp;word=阿拉蕾&amp;amp;t=metersbonwe&amp;amp;&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20130114/mbnew-0111-980nv-alalei.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-09 20:22:06', '2013-03-16 16:56:36');
INSERT INTO `base_ad_info` VALUES ('3', '1', '3', '底部通栏广告', '', '2', '', '&lt;p&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/bgimages/bg/fotter_0217.jpg&quot; alt=&quot;14天退换货保障，139元起免费送货，100%正品保证！&quot; /&gt;&lt;/p&gt;', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-16 13:50:49', '2013-03-16 13:50:49');
INSERT INTO `base_ad_info` VALUES ('4', '1', '4', 'flash', '', '1', '', 'http://img.mbanggo.com/sources/bgimages/20120517/loaderswf01.swf', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-16 15:09:46', '2013-03-17 20:23:54');
INSERT INTO `base_ad_info` VALUES ('5', '1', '4', '图片广告', '', '0', '', 'http://img.mbanggo.com/sources/cms/20130315/sylb-0314-300-60.jpg', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 17:45:20', '2013-03-21 17:45:20');

-- ----------------------------
-- Table structure for `base_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `base_ad_position`;
CREATE TABLE `base_ad_position` (
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告位信息表';

-- ----------------------------
-- Records of base_ad_position
-- ----------------------------
INSERT INTO `base_ad_position` VALUES ('1', '1', '1', 'logo', 'Logo', '', '250', '80', '1', '1', '1', '0', '2013-03-09 10:33:43', '2013-03-17 19:22:32');
INSERT INTO `base_ad_position` VALUES ('2', '1', '1', 'topAd', '头部通栏广告', '', '980', '50', '1', '1', '2', '1', '2013-03-09 15:20:10', '2013-03-09 15:20:10');
INSERT INTO `base_ad_position` VALUES ('3', '1', '1', 'bottomAd', '底部通栏广告', '', '980', '50', '1', '1', '4', '1', '2013-03-09 15:21:08', '2013-03-09 15:21:08');
INSERT INTO `base_ad_position` VALUES ('4', '1', '2', 'Home_Index_index', '首页广告', 'aa', '980', '392', '1', '1', '3', '1', '2013-03-09 21:30:13', '2013-03-24 11:07:09');
INSERT INTO `base_ad_position` VALUES ('5', '1', '1', 'Home_ArticleCategory_index', '文章分类页通栏广告', '', '980', '80', '1', '1', '0', '1', '2013-03-16 13:52:30', '2013-03-24 11:07:26');

-- ----------------------------
-- Table structure for `base_ad_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `base_ad_schedule`;
CREATE TABLE `base_ad_schedule` (
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
  KEY `apid` (`apid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告排期表';

-- ----------------------------
-- Records of base_ad_schedule
-- ----------------------------
INSERT INTO `base_ad_schedule` VALUES ('1', '1', '2', '4', '1', '0', '2013-03-03 00:00:00', '2013-03-29 00:00:00', '2013-03-09 19:32:41', '2013-03-17 20:31:17');

-- ----------------------------
-- Table structure for `base_article_album`
-- ----------------------------
DROP TABLE IF EXISTS `base_article_album`;
CREATE TABLE `base_article_album` (
  `aaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `name` varchar(100) DEFAULT '' COMMENT '相册名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`aaid`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章相册表';

-- ----------------------------
-- Records of base_article_album
-- ----------------------------
INSERT INTO `base_article_album` VALUES ('1', '1', '1', '案例展示', '0', '1', '2013-01-27 11:25:02', '2013-01-27 19:03:48');
INSERT INTO `base_article_album` VALUES ('2', '2', '1', 'About Us', '0', '1', '2013-01-28 21:24:30', '2013-01-28 21:24:30');

-- ----------------------------
-- Table structure for `base_article_album_photo`
-- ----------------------------
DROP TABLE IF EXISTS `base_article_album_photo`;
CREATE TABLE `base_article_album_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `aaid` int(11) NOT NULL DEFAULT '0' COMMENT '相册ID，关联article_album表aaid字段；0为贴图相册',
  `name` varchar(250) DEFAULT '' COMMENT '相片名称',
  `url` varchar(250) DEFAULT '' COMMENT '相片地址',
  `size` int(11) DEFAULT '0' COMMENT '相片大小',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `aaid` (`aaid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章相片表';

-- ----------------------------
-- Records of base_article_album_photo
-- ----------------------------
INSERT INTO `base_article_album_photo` VALUES ('1', '1', '1', '0', 'large_clxm_62092h206091', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e07a69b07.jpg', '108211', '0', '1', '2013-01-28 10:20:42', '2013-01-28 10:20:42');
INSERT INTO `base_article_album_photo` VALUES ('2', '1', '1', '1', 'large_clxm_62092h206091', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg', '108211', '0', '1', '2013-01-28 10:22:53', '2013-01-28 10:22:53');
INSERT INTO `base_article_album_photo` VALUES ('3', '2', '1', '2', 'large_jt4L_61682a206091', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg', '104652', '0', '1', '2013-01-28 21:39:40', '2013-01-28 21:39:40');
INSERT INTO `base_article_album_photo` VALUES ('4', '1', '1', '0', '20090914081712350', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d1731ba56.jpg', '46697', '0', '1', '2013-01-28 22:39:40', '2013-01-28 22:39:40');
INSERT INTO `base_article_album_photo` VALUES ('5', '1', '1', '0', '中国矿产地图', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d17660c60.jpg', '180169', '0', '1', '2013-01-28 22:59:40', '2013-01-28 22:59:40');

-- ----------------------------
-- Table structure for `base_article_info`
-- ----------------------------
DROP TABLE IF EXISTS `base_article_info`;
CREATE TABLE `base_article_info` (
  `aiid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `smid` int(11) NOT NULL DEFAULT '0' COMMENT '文章分类ID，关联site_menu表smid字段',
  `appdcode` int(6) DEFAULT '1' COMMENT '设备编码，关联base_app_device表appdcode字段',
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `smid` (`smid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章信息表';

-- ----------------------------
-- Records of base_article_info
-- ----------------------------
INSERT INTO `base_article_info` VALUES ('1', '1', '1', '1', '3', '公司简介', '', '邦购官网CMS内容管理系统', '&lt;p&gt;公司简介&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg&quot; height=&quot;800&quot; width=&quot;600&quot; /&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg&quot; /&gt;&lt;/p&gt;', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg,', 'http://admin.altilacms.com/Index/indexContent.html', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-01-17 13:48:35', '2013-03-14 19:27:02');
INSERT INTO `base_article_info` VALUES ('2', '2', '1', '11', '1', 'about us', '', 'about us description', '&lt;p&gt;about us&lt;br /&gt;&lt;/p&gt;', '', '', '', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-01-21 20:37:20', '2013-01-21 21:57:41');
INSERT INTO `base_article_info` VALUES ('3', '1', '1', '1', '1', '联系我们', '', '联系我们简介', '&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d1731ba56.jpg&quot; style=&quot;float:none;&quot; title=&quot;20090914081712350&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d17660c60.jpg&quot; style=&quot;float:none;&quot; title=&quot;中国矿产地图&quot; /&gt;&lt;/p&gt;&lt;p&gt;联系我们&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg&quot; height=&quot;800&quot; width=&quot;600&quot; /&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg&quot; /&gt;&lt;/p&gt;', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d1731ba56.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d17660c60.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg,', '', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-10 20:40:54', '2013-03-15 15:50:06');
INSERT INTO `base_article_info` VALUES ('4', '1', '1', '1', '2', '企业文化', '', '企业文化简介', '&lt;p&gt;企业文化&lt;br /&gt;&lt;/p&gt;', '', '', '', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-10 20:41:48', '2013-03-10 20:41:48');
INSERT INTO `base_article_info` VALUES ('5', '1', '1', '9', '9', '企业站', '', '企业站简介', '&lt;p&gt;企业站&lt;br/&gt;&lt;/p&gt;', '', '', '', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-11 20:47:16', '2013-10-31 22:27:06');

-- ----------------------------
-- Table structure for `base_job_info`
-- ----------------------------
DROP TABLE IF EXISTS `base_job_info`;
CREATE TABLE `base_job_info` (
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
  KEY `sid` (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='招聘信息表';

-- ----------------------------
-- Records of base_job_info
-- ----------------------------
INSERT INTO `base_job_info` VALUES ('1', '1', 'php招聘', '3', '310000', '310100', '310101', '3', '7', '4', '&lt;p&gt;sdfsf点时间啊发渐叟&lt;br /&gt;&lt;/p&gt;', '0', '1', '2013-04-01 00:00:00', '2016-04-01 00:00:00', '2013-04-22 16:24:04', '2013-04-22 21:32:41');

-- ----------------------------
-- Table structure for `base_site_menu`
-- ----------------------------
DROP TABLE IF EXISTS `base_site_menu`;
CREATE TABLE `base_site_menu` (
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
  `is_highlight` tinyint(1) DEFAULT '0' COMMENT '是否高亮：0为否，1为是',
  `is_hide` tinyint(1) DEFAULT '0' COMMENT '是否隐藏：0为否，1为是',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '是否新开页：0为否，1为是',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`smid`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of base_site_menu
-- ----------------------------
INSERT INTO `base_site_menu` VALUES ('1', '1', '0', 'AboutUs', '关于我们', '1-', '1', '0', '', '6', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:20:59', '2013-03-31 13:58:28');
INSERT INTO `base_site_menu` VALUES ('2', '1', '0', 'Blog', '博文', '2-', '4', '1', '', '3', '0', '0', '1', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:21:56', '2013-03-21 20:36:02');
INSERT INTO `base_site_menu` VALUES ('3', '1', '2', 'IT', 'IT', '2-3-', '4', '1', '', '2', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:22:37', '2013-03-21 14:43:12');
INSERT INTO `base_site_menu` VALUES ('4', '1', '2', 'ManageFinances', '理财', '2-4-', '4', '1', '', '2', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:24:22', '2013-03-23 11:03:51');
INSERT INTO `base_site_menu` VALUES ('5', '1', '3', 'Web', 'Web前端', '2-3-5-', '4', '1', '', '0', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:26:44', '2013-04-09 14:21:47');
INSERT INTO `base_site_menu` VALUES ('6', '1', '3', 'Language', '编程语言', '2-3-6-', '4', '1', '', '0', '0', '0', '0', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:27:49', '2013-04-09 14:23:47');
INSERT INTO `base_site_menu` VALUES ('7', '1', '3', 'Database', '数据库', '2-3-7-', '4', '1', '', '2', '0', '0', '0', '4', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:28:14', '2013-04-09 14:23:27');
INSERT INTO `base_site_menu` VALUES ('8', '1', '0', 'Project', '项目案例', '8-', '1', '1', '', '2', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:30:36', '2013-03-31 13:48:46');
INSERT INTO `base_site_menu` VALUES ('9', '1', '8', 'EnterpriseSite', '企业网站', '8-9-', '1', '0', '', '2', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:31:14', '2013-03-21 14:43:01');
INSERT INTO `base_site_menu` VALUES ('10', '1', '8', 'LargeSite', '大型网站', '8-10-', '1', '0', '', '2', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:32:27', '2013-03-21 14:42:54');
INSERT INTO `base_site_menu` VALUES ('11', '2', '0', 'AboutUs', 'About Us', '11-', '1', '0', '', '2', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 15:39:38', '2013-03-21 15:39:38');
INSERT INTO `base_site_menu` VALUES ('12', '1', '0', 'Product', '产品', '12-', '3', '1', '', '2', '0', '0', '0', '4', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:36:58', '2013-04-03 16:36:58');
INSERT INTO `base_site_menu` VALUES ('13', '1', '12', 'LightingProduct', '照明产品', '12-13-', '3', '1', '', '2', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:43:27', '2013-04-03 16:43:27');
INSERT INTO `base_site_menu` VALUES ('14', '1', '13', 'Spotlights', '射灯', '12-13-14-', '3', '0', '', '0', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:46:41', '2013-04-03 16:46:41');
INSERT INTO `base_site_menu` VALUES ('15', '1', '13', 'Downlight', '筒灯', '12-13-15-', '3', '0', '', '0', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:47:22', '2013-04-03 16:47:22');
INSERT INTO `base_site_menu` VALUES ('16', '1', '12', 'ChemicalProducts', '化工产品', '12-16-', '3', '1', '', '2', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:51:02', '2013-04-03 16:51:02');
INSERT INTO `base_site_menu` VALUES ('17', '1', '16', 'FadingAgent', '褪色剂', '12-16-17-', '3', '0', '', '0', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:52:04', '2013-04-03 16:52:04');
INSERT INTO `base_site_menu` VALUES ('18', '1', '3', 'BasicComputer', '计算机基础', '2-3-18-', '4', '1', '', '2', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:19:08', '2013-04-09 14:26:30');
INSERT INTO `base_site_menu` VALUES ('19', '1', '18', 'DataStructure', '数据结构', '2-3-18-19-', '4', '0', '', '2', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 13:54:02', '2013-04-09 14:26:23');
INSERT INTO `base_site_menu` VALUES ('20', '1', '18', 'Algorithm', '算法', '2-3-18-20-', '4', '0', '', '2', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:07:29', '2013-04-09 15:29:40');
INSERT INTO `base_site_menu` VALUES ('21', '1', '6', 'PHP', 'PHP', '2-3-6-21-', '4', '0', '', '0', '0', '0', '0', '4', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:27:18', '2013-04-09 14:27:18');
INSERT INTO `base_site_menu` VALUES ('22', '1', '6', 'JAVA', 'JAVA', '2-3-6-22-', '4', '0', '', '0', '0', '0', '0', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:34:36', '2013-04-09 14:34:36');
INSERT INTO `base_site_menu` VALUES ('23', '1', '6', 'C', 'C', '2-3-6-23-', '4', '0', '', '0', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:34:52', '2013-04-09 14:34:52');
INSERT INTO `base_site_menu` VALUES ('24', '1', '6', 'C++', 'C++', '2-3-6-24-', '4', '0', '', '0', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:36:41', '2013-04-09 14:36:41');
INSERT INTO `base_site_menu` VALUES ('25', '1', '7', 'MySql', 'MySql', '2-3-7-25-', '4', '0', '', '0', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:42:17', '2013-04-09 14:42:17');
INSERT INTO `base_site_menu` VALUES ('26', '1', '5', 'HTML', 'HTML', '2-3-5-26-', '4', '0', '', '0', '0', '0', '0', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:43:44', '2013-04-09 14:43:44');
INSERT INTO `base_site_menu` VALUES ('27', '1', '5', 'CSS', 'CSS', '2-3-5-27-', '4', '0', '', '0', '0', '0', '0', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:43:57', '2013-04-09 14:43:57');
INSERT INTO `base_site_menu` VALUES ('28', '1', '5', 'JavaScript', 'JavaScript', '2-3-5-28-', '4', '0', '', '0', '0', '0', '0', '5', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:47:48', '2013-04-09 14:47:48');
INSERT INTO `base_site_menu` VALUES ('29', '1', '5', 'jQuery', 'jQuery', '2-3-5-29-', '4', '0', '', '0', '0', '0', '0', '6', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:48:05', '2013-04-09 14:48:05');
INSERT INTO `base_site_menu` VALUES ('30', '1', '6', 'Ruby', 'Ruby', '2-3-6-30-', '4', '0', '', '0', '0', '0', '0', '8', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:08:34', '2013-04-09 15:08:34');
INSERT INTO `base_site_menu` VALUES ('31', '1', '6', 'Python', 'Python', '2-3-6-31-', '4', '0', '', '0', '0', '0', '0', '9', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:08:52', '2013-04-09 15:08:52');
INSERT INTO `base_site_menu` VALUES ('32', '1', '6', '.net', '.net', '2-3-6-32-', '4', '0', '', '0', '0', '0', '0', '10', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:09:07', '2013-04-09 15:09:07');
INSERT INTO `base_site_menu` VALUES ('33', '1', '6', 'iOS', 'iOS', '2-3-6-33-', '4', '0', '', '0', '0', '0', '0', '5', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:13:48', '2013-04-09 15:13:48');
INSERT INTO `base_site_menu` VALUES ('34', '1', '6', 'Android', 'Android', '2-3-6-34-', '4', '0', '', '0', '0', '0', '0', '6', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:14:02', '2013-04-09 15:14:02');
INSERT INTO `base_site_menu` VALUES ('35', '1', '6', 'WindowsPhone', 'WindowsPhone', '2-3-6-35-', '4', '0', '', '0', '0', '0', '0', '7', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:14:49', '2013-04-09 15:14:49');
INSERT INTO `base_site_menu` VALUES ('36', '1', '5', 'EXT', 'EXT', '2-3-5-36-', '4', '0', '', '0', '0', '0', '0', '7', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:16:47', '2013-04-09 15:16:47');
INSERT INTO `base_site_menu` VALUES ('37', '1', '5', 'HTML5', 'HTML5', '2-3-5-37-', '4', '0', '', '0', '0', '0', '0', '4', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:17:02', '2013-04-09 15:17:02');
INSERT INTO `base_site_menu` VALUES ('38', '1', '5', 'CSS3', 'CSS3', '2-3-5-38-', '4', '0', '', '0', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:19:51', '2013-04-09 15:19:51');
INSERT INTO `base_site_menu` VALUES ('39', '1', '7', 'Mongo', 'Mongo', '2-3-7-39-', '4', '0', '', '0', '0', '0', '0', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-10 09:52:17', '2013-04-10 09:52:17');
INSERT INTO `base_site_menu` VALUES ('40', '1', '0', 'Job', '招聘', '40-', '6', '0', '', '4', '0', '0', '0', '5', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-22 15:01:04', '2013-04-22 15:01:04');

-- ----------------------------
-- Table structure for `base_site_plate`
-- ----------------------------
DROP TABLE IF EXISTS `base_site_plate`;
CREATE TABLE `base_site_plate` (
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='面板管理';

-- ----------------------------
-- Records of base_site_plate
-- ----------------------------
INSERT INTO `base_site_plate` VALUES ('1', '1', '1', '默认面板', '2', 'panel-1,panel-2', '1', '1', '2013-03-24 15:51:46', '2013-05-01 21:17:19');
INSERT INTO `base_site_plate` VALUES ('2', '1', '2', '默认面板', '3', '', '0', '1', '2013-03-24 15:56:22', '2013-03-24 15:56:22');
INSERT INTO `base_site_plate` VALUES ('3', '1', '1', '广告', '1', '', '2', '1', '2013-03-25 14:45:03', '2013-03-25 14:45:03');
INSERT INTO `base_site_plate` VALUES ('4', '1', '3', '默认面板', '2', '', '2', '1', '2013-11-06 13:59:04', '2013-11-06 13:59:04');
INSERT INTO `base_site_plate` VALUES ('5', '1', '4', '默认面板', '2', 'span9,span3', '2', '1', '2013-11-06 14:52:45', '2013-11-07 16:29:15');
INSERT INTO `base_site_plate` VALUES ('6', '1', '3', '面包屑', '1', '', '1', '1', '2013-11-06 17:14:25', '2013-11-06 17:14:25');
INSERT INTO `base_site_plate` VALUES ('7', '1', '4', '面包屑', '1', 'span12', '1', '1', '2013-11-06 17:23:18', '2013-11-07 16:32:07');
INSERT INTO `base_site_plate` VALUES ('8', '1', '5', '面包屑', '1', '', '1', '1', '2013-11-06 20:23:01', '2013-11-06 20:23:01');
INSERT INTO `base_site_plate` VALUES ('9', '1', '5', '默认面板', '2', '', '2', '1', '2013-11-06 20:23:44', '2013-11-06 20:23:44');
INSERT INTO `base_site_plate` VALUES ('10', '1', '6', '面包屑', '1', 'span12', '1', '1', '2013-11-06 20:24:12', '2013-11-07 16:50:43');
INSERT INTO `base_site_plate` VALUES ('11', '1', '6', '默认面板', '2', 'span9,span3', '2', '1', '2013-11-06 20:24:21', '2013-11-07 16:50:50');

-- ----------------------------
-- Table structure for `base_site_plate_content`
-- ----------------------------
DROP TABLE IF EXISTS `base_site_plate_content`;
CREATE TABLE `base_site_plate_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `spid` int(11) NOT NULL DEFAULT '0' COMMENT '面板ID，关联site_plate表spid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '面板内容名称',
  `class` varchar(100) DEFAULT '' COMMENT '面板内容样式',
  `row_position` tinyint(5) DEFAULT '1' COMMENT '面板内容列位置',
  `type` tinyint(1) DEFAULT '1' COMMENT '面板内容类型：1为列表，2为分类，3为单篇内容',
  `model` tinyint(1) DEFAULT '1' COMMENT '面板内容模型：0为广告，后同site_menu表model字段',
  `model_value` varchar(255) DEFAULT '' COMMENT '面板内容',
  `list_opt` int(11) DEFAULT '3' COMMENT '列表显示项：1为名称，2为添加时间，4为用户名，8为分页，16为更多，32为缩略图，64为简介，128为图片，256为标签，512为全文',
  `list_num` tinyint(3) DEFAULT '10' COMMENT '每页显示数量',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='面板内容管理';

-- ----------------------------
-- Records of base_site_plate_content
-- ----------------------------
INSERT INTO `base_site_plate_content` VALUES ('1', '1', '1', '公司简介', '', '1', '3', '1', '1', '3', '10', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-24 20:41:15', '2013-03-25 15:05:39');
INSERT INTO `base_site_plate_content` VALUES ('2', '1', '1', '关于我们', '', '2', '1', '1', '1', '19', '10', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-24 20:42:09', '2013-03-31 14:49:20');
INSERT INTO `base_site_plate_content` VALUES ('3', '1', '3', '广告', '', '1', '3', '0', 'logo', '3', '10', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-25 14:45:20', '2013-03-25 14:45:20');
INSERT INTO `base_site_plate_content` VALUES ('4', '1', '1', '项目案例', '', '2', '2', '1', '8', '3', '10', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-25 15:06:14', '2013-03-25 15:06:14');
INSERT INTO `base_site_plate_content` VALUES ('5', '1', '4', '列表', '', '1', '1', '1', '0', '107', '1', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-06 13:59:32', '2013-11-06 17:05:48');
INSERT INTO `base_site_plate_content` VALUES ('6', '1', '4', '侧栏导航', '', '2', '5', '1', '', '3', '10', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-06 14:10:59', '2013-11-06 18:05:48');
INSERT INTO `base_site_plate_content` VALUES ('7', '1', '5', '列表', '', '1', '1', '4', '0', '363', '10', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-06 14:53:13', '2013-11-06 17:06:05');
INSERT INTO `base_site_plate_content` VALUES ('8', '1', '5', '侧栏导航', '', '2', '5', '4', '', '3', '10', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-06 17:06:19', '2013-11-06 18:05:34');
INSERT INTO `base_site_plate_content` VALUES ('9', '1', '6', '面包屑', '', '1', '4', '1', '', '3', '10', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-06 17:14:46', '2013-11-06 17:14:46');
INSERT INTO `base_site_plate_content` VALUES ('10', '1', '7', '面包屑', '', '1', '4', '4', '', '3', '10', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-06 17:51:32', '2013-11-06 20:53:52');
INSERT INTO `base_site_plate_content` VALUES ('11', '1', '8', '面包屑', '', '1', '4', '1', '', '3', '10', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-06 20:25:21', '2013-11-06 22:22:37');
INSERT INTO `base_site_plate_content` VALUES ('12', '1', '10', '面包屑', '', '1', '4', '4', '', '3', '10', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-06 22:53:14', '2013-11-06 22:53:14');
INSERT INTO `base_site_plate_content` VALUES ('13', '1', '9', '列表', '', '1', '3', '1', '', '515', '10', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-07 00:10:44', '2013-11-07 00:45:02');
INSERT INTO `base_site_plate_content` VALUES ('14', '1', '9', '侧栏列表', '', '2', '6', '1', '', '3', '10', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-07 00:11:12', '2013-11-07 00:11:12');
INSERT INTO `base_site_plate_content` VALUES ('15', '1', '11', '列表', '', '1', '3', '4', '', '515', '10', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-07 00:12:11', '2013-11-07 00:45:22');
INSERT INTO `base_site_plate_content` VALUES ('16', '1', '11', '侧栏列表', '', '2', '6', '4', '', '3', '10', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-11-07 00:12:42', '2013-11-07 00:12:42');

-- ----------------------------
-- Table structure for `base_site_plate_group`
-- ----------------------------
DROP TABLE IF EXISTS `base_site_plate_group`;
CREATE TABLE `base_site_plate_group` (
  `spgid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '面板分组编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '面板分组名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`spgid`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='面板分组管理';

-- ----------------------------
-- Records of base_site_plate_group
-- ----------------------------
INSERT INTO `base_site_plate_group` VALUES ('1', '1', 'Home_Index_index', '首页', '1', '1', '2013-03-24 15:19:22', '2013-11-06 13:37:26');
INSERT INTO `base_site_plate_group` VALUES ('2', '1', 'Blog_Index_index', '博客首页', '2', '1', '2013-03-24 15:19:41', '2013-11-06 13:37:33');
INSERT INTO `base_site_plate_group` VALUES ('3', '1', 'Home_ArticleCategory_index', '文章分类页', '3', '1', '2013-11-06 13:34:12', '2013-11-06 13:35:49');
INSERT INTO `base_site_plate_group` VALUES ('4', '1', 'Blog_BlogCategory_index', '博文分类页', '4', '1', '2013-11-06 13:36:53', '2013-11-06 13:36:53');
INSERT INTO `base_site_plate_group` VALUES ('5', '1', 'Home_ArticleInfo_index', '文章详情页', '5', '1', '2013-11-06 13:37:39', '2013-11-06 13:37:39');
INSERT INTO `base_site_plate_group` VALUES ('6', '1', 'Blog_BlogInfo_index', '博文详情页', '6', '1', '2013-11-06 13:38:17', '2013-11-06 13:38:17');

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
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
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
  `name` varchar(250) DEFAULT '' COMMENT '相片名称',
  `url` varchar(250) DEFAULT '' COMMENT '相片地址',
  `size` int(11) DEFAULT '0' COMMENT '相片大小',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `baid` (`baid`) USING BTREE
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
  KEY `biid` (`biid`) USING BTREE
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
  KEY `bctid` (`bctid`) USING BTREE,
  KEY `type` (`type`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
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
  `appdcode` int(6) unsigned DEFAULT '1' COMMENT '设备编码，关联base_app_device表appdcode字段',
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `smid` (`smid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='博文信息表';

-- ----------------------------
-- Records of blog_info
-- ----------------------------
INSERT INTO `blog_info` VALUES ('1', '1', '1', '20', '7', '双堆求中位数', '堆,中位数', '求数组中位数的方法：1、排序2、双堆3、findk效率分别是nlog(n)、nlog(n)、log(n)用堆维护中位数的意思是说，设计两个堆，第一个堆存放小于中位数的元素，第二个堆存放大于中位数的元素', '&lt;p&gt;求数组中位数的方法：&lt;br/&gt;&lt;br/&gt;1、排序&lt;br/&gt;&lt;br/&gt;2、双堆&lt;br/&gt;&lt;br/&gt;3、findk&lt;br/&gt;&lt;br/&gt;效率分别是nlog(n)、nlog(n)、log(n)&lt;br/&gt;&lt;br/&gt;用堆维护中位数的意思是说，设计两个堆，第一个堆存放小于中位数的元素，第二个堆存放大于中位数的元素。&lt;br/&gt;&lt;br/&gt;下面是双堆维护中位数的语言描述：&lt;br/&gt;&lt;br/&gt;1、初始化的时候设置两个变量分别记录两个堆【左堆和右堆】的元素的个数&lt;br/&gt;&lt;br/&gt;2、取第一个元素【d[0]】作为初始中位数m&lt;br/&gt;&lt;br/&gt;3、循环后面的每一个元素，如果比m大，则插入到右堆，如果比m小，则插入到左堆&lt;br/&gt;&lt;br/&gt;4、此时如果左堆和右堆的元素数目之差的绝对值等于2，说明左右两侧的元素不平衡了。需要把m插入到元素少的那个数组中，然后取下一个数组元素作为中位数，重复3和4。&lt;br/&gt;&lt;br/&gt;5、经过上述步骤，数组的所有元素都已经在堆中了。如果两个堆的数据元素个数相等那么有两个中位数，即两个堆的堆顶。如果两个堆的数据数目不相等，则元素多的那个堆的堆顶是数组中位数。 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br/&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 'http://blog.csdn.net/maohaiyan/article/details/8059483', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-08 14:48:54', '2013-11-01 11:33:56');
INSERT INTO `blog_info` VALUES ('2', '1', '1', '20', '9', '大数据及海量数据处理算法总结', '大数据,海量数据', '大数据量的问题是很多面试笔试中经常出现的问题，比如baidu google 腾讯 这样的一些涉及到海量数据的公司经常会问到 下面的方法是我对海量数据的处理方法进行了一个一般性的总结，当然这些方法可能并', '&lt;p&gt;大数据量的问题是很多面试笔试中经常出现的问题，比如baidu google 腾讯 这样的一些涉及到海量数据的公司经常会问到&lt;br/&gt;&lt;br/&gt; &lt;br/&gt;下面的方法是我对海量数据的处理方法进行了一个一般性的总结，当然这些方法可能并不能完全覆盖所有的问题，但是这样的一些方法也基本可以处理绝大多数遇到的问题。下面的一些问题基本直接来源于公司的面试笔试题目，方法不一定最优，如果你有更好的处理方法，欢迎与我讨论。 &lt;br/&gt;&lt;br/&gt;1.Bloom filter &lt;br/&gt;&lt;br/&gt;适用范围：可以用来实现数据字典，进行数据的判重，或者集合求交集 &lt;br/&gt;&lt;br/&gt;基本原理及要点： &lt;br/&gt;对于原理来说很简单，位数组 k个独立hash函数。将hash函数对应的值的位数组置1，查找时如果发现所有hash函数对应位都是1说明存在，很明显这个过程并不保证查找的结果是100%正确的。同时也不支持删除一个已经插入的关键字，因为该关键字对应的位会牵动到其他的关键字。所以一个简单的改进就是 ing Bloom filter，用一个er数组代替位数组，就可以支持删除了。 &lt;br/&gt;&lt;br/&gt;还有一个比较重要的问题，如何根据输入元素个数n，确定位数组m的大小及hash函数个数。当hash函数个数k=(ln2)(m/n)时错误率最小。在错误率不大于E的情况下，m至少要等于nlg(1/E)才能表示任意n个元素的集合。但m还应该更大些，因为还要保证bit数组里至少一半为 0，则m 应该&amp;gt;=nlg(1/E)lge 大概就是nlg(1/E)1.44倍(lg表示以2为底的对数)。 &lt;br/&gt;&lt;br/&gt;举个例子我们假设错误率为0.01，则此时m应大概是n的13倍。这样k大概是8个。 &lt;br/&gt;&lt;br/&gt;注意这里m与n的单位不同，m是bit为单位，而n则是以元素个数为单位(准确的说是不同元素的个数)。通常单个元素的长度都是有很多bit的。所以使用bloom filter内存上通常都是节省的。 &lt;br/&gt;&lt;br/&gt;扩展： &lt;br/&gt;Bloom filter将集合中的元素映射到位数组中，用k（k为哈希函数个数）个映射位是否全1表示元素在不在这个集合中。ing bloom filter（CBF）将位数组中的每一位扩展为一个er，从而支持了元素的删除操作。Spectral Bloom Filter（SBF）将其与集合元素的出现次数关联。SBF采用er中的最小值来近似表示元素的出现频率。 &lt;br/&gt;&lt;br/&gt;问题实例：给你A,B两个文件，各存放50亿条URL，每条URL占用64字节，内存限制是4G，让你找出A,B文件共同的URL。如果是三个乃至n个文件呢？ &lt;br/&gt;&lt;br/&gt;根据这个问题我们来计算下内存的占用，4G=2^32大概是40亿8大概是340亿，n=50亿，如果按出错率0.01算需要的大概是650亿个 bit。现在可用的是340亿，相差并不多，这样可能会使出错率上升些。另外如果这些urlip是一一对应的，就可以转换成ip，则大大简单了。 &lt;br/&gt;&lt;br/&gt;2.Hashing &lt;br/&gt;&lt;br/&gt;适用范围：快速查找，删除的基本数据结构，通常需要总数据量可以放入内存 &lt;br/&gt;&lt;br/&gt;基本原理及要点： &lt;br/&gt;hash函数选择，针对字符串，整数，排列，具体相应的hash方法。 &lt;br/&gt;碰撞处理，一种是open hashing，也称为拉链法；另一种就是closed hashing，也称开地址法，opened addressing。 (http://www.my400800.cn) &lt;br/&gt;&lt;br/&gt;扩展： &lt;br/&gt;d-left hashing中的d是多个的意思，我们先简化这个问题，看一看2-left hashing。2-left hashing指的是将一个哈希表分成长度相等的两半，分别叫做T1和T2，给T1和T2分别配备一个哈希函数，h1和h2。在存储一个新的key时，同时用两个哈希函数进行计算，得出两个地址h1[key]和h2[key]。这时需要检查T1中的h1[key]位置和T2中的h2[key]位置，哪一个位置已经存储的（有碰撞的）key比较多，然后将新key存储在负载少的位置。如果两边一样多，比如两个位置都为空或者都存储了一个key，就把新key 存储在左边的T1子表中，2-left也由此而来。在查找一个key时，必须进行两次hash，同时查找两个位置。 &lt;br/&gt;&lt;br/&gt;问题实例： &lt;br/&gt;1).海量日志数据，提取出某日访问百度次数最多的那个IP。 &lt;br/&gt;&lt;br/&gt;IP的数目还是有限的，最多2^32个，所以可以考虑使用hash将ip直接存入内存，然后进行统计。 &lt;br/&gt;&lt;br/&gt;3.bit-map &lt;br/&gt;&lt;br/&gt;适用范围：可进行数据的快速查找，判重，删除，一般来说数据范围是int的10倍以下 &lt;br/&gt;&lt;br/&gt;基本原理及要点：使用bit数组来表示某些元素是否存在，比如8位电话号码 &lt;br/&gt;&lt;br/&gt;扩展：bloom filter可以看做是对bit-map的扩展 &lt;br/&gt;&lt;br/&gt;问题实例： &lt;br/&gt;&lt;br/&gt;1)已知某个文件内包含一些电话号码，每个号码为8位数字，统计不同号码的个数。 &lt;br/&gt;&lt;br/&gt;8位最多99 999 999，大概需要99m个bit，大概10几m字节的内存即可。 &lt;br/&gt;&lt;br/&gt;2)2.5亿个整数中找出不重复的整数的个数，内存空间不足以容纳这2.5亿个整数。 &lt;br/&gt;&lt;br/&gt;将bit-map扩展一下，用2bit表示一个数即可，0表示未出现，1表示出现一次，2表示出现2次及以上。或者我们不用2bit来进行表示，我们用两个bit-map即可模拟实现这个2bit-map。 &lt;br/&gt;&lt;br/&gt;4.堆 &lt;br/&gt;&lt;br/&gt;适用范围：海量数据前n大，并且n比较小，堆可以放入内存 &lt;br/&gt;&lt;br/&gt;基本原理及要点：最大堆求前n小，最小堆求前n大。方法，比如求前n小，我们比较当前元素与最大堆里的最大元素，如果它小于最大元素，则应该替换那个最大元素。这样最后得到的n个元素就是最小的n个。适合大数据量，求前n小，n的大小比较小的情况，这样可以扫描一遍即可得到所有的前n元素，效率很高。 &lt;br/&gt;&lt;br/&gt;扩展：双堆，一个最大堆与一个最小堆结合，可以用来维护中位数。 &lt;br/&gt;&lt;br/&gt;问题实例： &lt;br/&gt;1)100w个数中找最大的前100个数。 &lt;br/&gt;&lt;br/&gt;用一个100个元素大小的最小堆即可。 &lt;br/&gt;&lt;br/&gt;5.双层桶划分 其实本质上就是【分而治之】的思想，重在“分”的技巧上！ &lt;br/&gt;&lt;br/&gt;适用范围：第k大，中位数，不重复或重复的数字 &lt;br/&gt;&lt;br/&gt;基本原理及要点：因为元素范围很大，不能利用直接寻址表，所以通过多次划分，逐步确定范围，然后最后在一个可以接受的范围内进行。可以通过多次缩小，双层只是一个例子。 &lt;br/&gt;&lt;br/&gt;扩展： &lt;br/&gt;&lt;br/&gt;问题实例： &lt;br/&gt;1).2.5亿个整数中找出不重复的整数的个数，内存空间不足以容纳这2.5亿个整数。 &lt;br/&gt;&lt;br/&gt;有点像鸽巢原理，整数个数为2^32,也就是，我们可以将这2^32个数，划分为2^8个区域(比如用单个文件代表一个区域)，然后将数据分离到不同的区域，然后不同的区域在利用bitmap就可以直接解决了。也就是说只要有足够的磁盘空间，就可以很方便的解决。 &lt;br/&gt;&lt;br/&gt;2).5亿个int找它们的中位数。 &lt;br/&gt;&lt;br/&gt;这个例子比上面那个更明显。首先我们将int划分为2^16个区域，然后读取数据统计落到各个区域里的数的个数，之后我们根据统计结果就可以判断中位数落到那个区域，同时知道这个区域中的第几大数刚好是中位数。然后第二次扫描我们只统计落在这个区域中的那些数就可以了。 &lt;br/&gt;&lt;br/&gt;实际上，如果不是int是int64，我们可以经过3次这样的划分即可降低到可以接受的程度。即可以先将int64分成2^24个区域，然后确定区域的第几大数，在将该区域分成2^20个子区域，然后确定是子区域的第几大数，然后子区域里的数的个数只有2^20，就可以直接利用direct addr table进行统计了。 &lt;br/&gt;&lt;br/&gt;6.数据库索引 &lt;br/&gt;&lt;br/&gt;适用范围：大数据量的增删改查 &lt;br/&gt;&lt;br/&gt;基本原理及要点：利用数据的设计实现方法，对海量数据的增删改查进行处理。 &lt;br/&gt;扩展： &lt;br/&gt;问题实例： &lt;br/&gt;&lt;br/&gt;&lt;br/&gt;7.倒排索引(Inverted index) &lt;br/&gt;&lt;br/&gt;适用范围：搜索引擎，关键字查询 &lt;br/&gt;&lt;br/&gt;基本原理及要点：为何叫倒排索引？一种索引方法，被用来存储在全文搜索下某个单词在一个文档或者一组文档中的存储位置的映射。 &lt;br/&gt;&lt;br/&gt;以英文为例，下面是要被索引的文本： &lt;br/&gt;T0 = &amp;quot;it is what it is&amp;quot; &lt;br/&gt;T1 = &amp;quot;what is it&amp;quot; &lt;br/&gt;T2 = &amp;quot;it is a banana&amp;quot; &lt;br/&gt;我们就能得到下面的反向文件索引： &lt;br/&gt;&amp;quot;a&amp;quot;: {2} &lt;br/&gt;&amp;quot;banana&amp;quot;: {2} &lt;br/&gt;&amp;quot;is&amp;quot;: {0, 1, 2} &lt;br/&gt;&amp;quot;it&amp;quot;: {0, 1, 2} &lt;br/&gt;&amp;quot;what&amp;quot;: {0, 1} &lt;br/&gt;检索的条件&amp;quot;what&amp;quot;, &amp;quot;is&amp;quot; 和 &amp;quot;it&amp;quot; 将对应集合的交集。 &lt;br/&gt;&lt;br/&gt;正向索引开发出来用来存储每个文档的单词的列表。正向索引的查询往往满足每个文档有序频繁的全文查询和每个单词在校验文档中的验证这样的查询。在正向索引中，文档占据了中心的位置，每个文档指向了一个它所包含的索引项的序列。也就是说文档指向了它包含的那些单词，而反向索引则是单词指向了包含它的文档，很容易看到这个反向的关系。 &lt;br/&gt;&lt;br/&gt;扩展： &lt;br/&gt;&lt;br/&gt;问题实例：文档检索系统，查询那些文件包含了某单词，比如常见的学术论文的关键字搜索。 &lt;br/&gt;&lt;br/&gt;8.外排序 &lt;br/&gt;&lt;br/&gt;适用范围：大数据的排序，去重 &lt;br/&gt;&lt;br/&gt;基本原理及要点：外排序的归并方法，置换选择 败者树原理，最优归并树 &lt;br/&gt;&lt;br/&gt;扩展： &lt;br/&gt;&lt;br/&gt;问题实例： &lt;br/&gt;1).有一个1G大小的一个文件，里面每一行是一个词，词的大小不超过16个字节，内存限制大小是1M。返回频数最高的100个词。 &lt;br/&gt;&lt;br/&gt;这个数据具有很明显的特点，词的大小为16个字节，但是内存只有1m做hash有些不够，所以可以用来排序。内存可以当输入缓冲区使用。 &lt;br/&gt;&lt;br/&gt;9.trie树 &lt;br/&gt;&lt;br/&gt;适用范围：数据量大，重复多，但是数据种类小可以放入内存 &lt;br/&gt;&lt;br/&gt;基本原理及要点：实现方式，节点孩子的表示方式 &lt;br/&gt;&lt;br/&gt;扩展：压缩实现。 &lt;br/&gt;&lt;br/&gt;问题实例： &lt;br/&gt;1).有10个文件，每个文件1G， 每个文件的每一行都存放的是用户的query，每个文件的query都可能重复。要你按照query的频度排序 。 &lt;br/&gt;&lt;br/&gt;2).1000万字符串，其中有些是相同的(重复),需要把重复的全部去掉，保留没有重复的字符串。请问怎么设计和实现？ &lt;br/&gt;&lt;br/&gt;3).寻找热门查询：查询串的重复度比较高，虽然总数是1千万，但如果除去重复后，不超过3百万个，每个不超过255字节。 &lt;br/&gt;&lt;br/&gt;10.分布式处理 mapreduce &lt;br/&gt;&lt;br/&gt;适用范围：数据量大，但是数据种类小可以放入内存 &lt;br/&gt;&lt;br/&gt;基本原理及要点：将数据交给不同的机器去处理，数据划分，结果归约。 &lt;br/&gt;&lt;br/&gt;扩展： &lt;br/&gt;&lt;br/&gt;问题实例： &lt;br/&gt;&lt;br/&gt;1).The canonical example application of MapReduce is a process to &amp;nbsp;the appearances of &lt;br/&gt;&lt;br/&gt;each different word in a set of documents: &lt;br/&gt;void map(String name, String document): &lt;br/&gt;// name: document name &lt;br/&gt;// document: document contents &lt;br/&gt;for each word w in document: &lt;br/&gt;EmitIntermediate(w, 1); &lt;br/&gt;&lt;br/&gt;void reduce(String word, Iterator partials): &lt;br/&gt;// key: a word &lt;br/&gt;// values: a list of aggregated partial s &lt;br/&gt;int result = 0; &lt;br/&gt;for each v in partials: &lt;br/&gt;result &amp;nbsp;= ParseInt(v); &lt;br/&gt;Emit(result); &lt;br/&gt;Here, each document is split in words, &amp;nbsp;each word is ed initially with a &amp;quot;1&amp;quot; value by &lt;br/&gt;&lt;br/&gt;the Map function, using the word as the result key. The framework puts together all the pairs &lt;br/&gt;&lt;br/&gt;with the same key &amp;nbsp;feeds them to the same call to Reduce, thus this function just needs to &lt;br/&gt;&lt;br/&gt;sum all of its input values to find the total appearances of that word. &lt;br/&gt;&lt;br/&gt;2).海量数据分布在100台电脑中，想个办法高效统计出这批数据的TOP10。 &lt;br/&gt;&lt;br/&gt;3).一共有N个机器，每个机器上有N个数。每个机器最多存O(N)个数并对它们操作。如何找到N^2个数的中数(median)？ &lt;br/&gt;&lt;br/&gt;&lt;br/&gt;经典问题分析 &lt;br/&gt;&lt;br/&gt;上千万or亿数据（有重复），统计其中出现次数最多的前N个数据,分两种情况：可一次读入内存，不可一次读入。 &lt;br/&gt;&lt;br/&gt;可用思路：trie树 堆，数据库索引，划分子集分别统计，hash，分布式计算，近似统计，外排序 &lt;br/&gt;&lt;br/&gt;所谓的是否能一次读入内存，实际上应该指去除重复后的数据量。如果去重后数据可以放入内存，我们可以为数据建立字典，比如通过 map，hashmap，trie，然后直接进行统计即可。当然在更新每条数据的出现次数的时候，我们可以利用一个堆来维护出现次数最多的前N个数据，当然这样导致维护次数增加，不如完全统计后在求前N大效率高。 &lt;br/&gt;&lt;br/&gt;如果数据无法放入内存。一方面我们可以考虑上面的字典方法能否被改进以适应这种情形，可以做的改变就是将字典存放到硬盘上，而不是内存，这可以参考数据库的存储方法。 &lt;br/&gt;&lt;br/&gt;当然还有更好的方法，就是可以采用分布式计算，基本上就是map-reduce过程，首先可以根据数据值或者把数据hash(md5)后的值，将数据按照范围划分到不同的机子，最好可以让数据划分后可以一次读入内存，这样不同的机子负责处理各种的数值范围，实际上就是map。得到结果后，各个机子只需拿出各自的出现次数最多的前N个数据，然后汇总，选出所有的数据中出现次数最多的前N个数据，这实际上就是reduce过程。 &lt;br/&gt;&lt;br/&gt;实际上可能想直接将数据均分到不同的机子上进行处理，这样是无法得到正确的解的。因为一个数据可能被均分到不同的机子上，而另一个则可能完全聚集到一个机子上，同时还可能存在具有相同数目的数据。比如我们要找出现次数最多的前100个，我们将1000万的数据分布到10台机器上，找到每台出现次数最多的前 100个，归并之后这样不能保证找到真正的第100个，因为比如出现次数最多的第100个可能有1万个，但是它被分到了10台机子，这样在每台上只有1千个，假设这些机子排名在1000个之前的那些都是单独分布在一台机子上的，比如有1001个，这样本来具有1万个的这个就会被淘汰，即使我们让每台机子选出出现次数最多的1000个再归并，仍然会出错，因为可能存在大量个数为1001个的发生聚集。因此不能将数据随便均分到不同机子上，而是要根据hash 后的值将它们映射到不同的机子上处理，让不同的机器处理一个数值范围。 &lt;br/&gt;&lt;br/&gt;而外排序的方法会消耗大量的IO，效率不会很高。而上面的分布式方法，也可以用于单机版本，也就是将总的数据根据值的范围，划分成多个不同的子文件，然后逐个处理。处理完毕之后再对这些单词的及其出现频率进行一个归并。实际上就可以利用一个外排序的归并过程。 &lt;br/&gt;&lt;br/&gt;另外还可以考虑近似计算，也就是我们可以通过结合自然语言属性，只将那些真正实际中出现最多的那些词作为一个字典，使得这个规模可以放入内存。&lt;br/&gt;&lt;/p&gt;', '', '', 'http://www.jb51.net/article/27064.htm', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 17:25:13', '2013-11-01 11:34:08');
INSERT INTO `blog_info` VALUES ('3', '1', '1', '20', '1', '从海量数据中找出中位数', '大数据,海量数据,中位数', '题目：在一个文件中有 10G 个整数，乱序排列，要求找出中位数。内存限制为 2G。只写出思路即可（内存限制为 2G的意思就是，可以使用2G的空间来运行程序，而不考虑这台机器上的其他软件的占用内存）', '&lt;p&gt;题目：在一个文件中有 10G 个整数，乱序排列，要求找出中位数。内存限制为 2G。只写出思路即可（内存限制为 2G的意思就是，可以使用2G的空间来运行程序，而不考虑这台机器上的其他软件的占用内存）。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;关于中位数：数据排序后，位置在最中间的数值。即将数据分成两部分，一部分大于该数值，一部分小于该数值。中位数的位置：当样本数为奇数时，中位数=(N 1)/2 ; 当样本数为偶数时，中位数为N/2与1 N/2的均值（那么10G个数的中位数，就第5G大的数与第5G 1大的数的均值了）。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;分析：明显是一道工程性很强的题目，和一般的查找中位数的题目有几点不同。&lt;br /&gt;1. 原数据不能读进内存，不然可以用快速选择，如果数的范围合适的话还可以考虑桶排序或者计数排序，但这里假设是32位整数，仍有4G种取值，需要一个16G大小的数组来计数。&lt;br /&gt;2. 若看成从N个数中找出第K大的数，如果K个数可以读进内存，可以利用最小或最大堆，但这里K=N/2,有5G个数，仍然不能读进内存。&lt;br /&gt;3. 接上，对于N个数和K个数都不能一次读进内存的情况，《编程之美》里给出一个方案：设k&amp;lt;K,且k个数可以完全读进内存，那么先构建k个数的堆，先找出第0到k大的数，再扫描一遍数组找出第k 1到2k的数，再扫描直到找出第K个数。虽然每次时间大约是nlog(k)，但需要扫描ceil(K/k)次，这里要扫描5次。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;解法：首先假设是32位无符号整数。&lt;br /&gt;1. 读一遍10G个整数，把整数映射到256M个区段中，用一个64位无符号整数给每个相应区段记数。&lt;br /&gt;说明：整数范围是0 - 2^32 - 1，一共有4G种取值，映射到256M个区段，则每个区段有16（4G/256M = 16）种值，每16个值算一段， 0～15是第1段，16～31是第2段，……2^32-16 ～2^32-1是第256M段。一个64位无符号整数最大值是0～8G-1，这里先不考虑溢出的情况。总共占用内存256M×8B=2GB。&lt;br /&gt;2. 从前到后对每一段的计数累加，当累加的和超过5G时停止，找出这个区段（即累加停止时达到的区段，也是中位数所在的区段）的数值范围，设为[a，a 15]，同时记录累加到前一个区段的总数，设为m。然后，释放除这个区段占用的内存。&lt;br /&gt;3. 再读一遍10G个整数，把在[a，a 15]内的每个值计数，即有16个计数。&lt;br /&gt;4. 对新的计数依次累加，每次的和设为n，当m n的值超过5G时停止，此时的这个计数所对应的数就是中位数。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;总结：&lt;br /&gt;1.以上方法只要读两遍整数，对每个整数也只是常数时间的操作，总体来说是线性时间。&lt;br /&gt;2. 考虑其他情况。若是有符号的整数，只需改变映射即可。若是64为整数，则增加每个区段的范围，那么在第二次读数时，要考虑更多的计数。若过某个计数溢出，那么可认定所在的区段或代表整数为所求，这里只需做好相应的处理。噢，忘了还要找第5G 1大的数了，相信有了以上的成果，找到这个数也不难了吧。&lt;br /&gt;3. 时空权衡。花费256个区段也许只是恰好配合2GB的内存（其实也不是，呵呵）。可以增大区段范围，减少区段数目，节省一些内存，虽然增加第二部分的对单个数值的计数，但第一部分对每个区段的计数加快了（总体改变？？待测）。&lt;br /&gt;4. 映射时尽量用位操作，由于每个区段的起点都是2的整数幂，映射起来也很方便。&lt;br /&gt;&lt;/p&gt;', '', '', 'http://blog.csdn.net/maohaiyan/article/details/8059931', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 17:49:23', '2013-04-10 22:06:00');
INSERT INTO `blog_info` VALUES ('4', '1', '1', '20', '1', 'B树', 'BTree,B树', 'B 树又叫平衡多路查找树。一棵m阶的B 树 (m叉树)的特性如下：1、树中每个结点最多含有m个孩子（m>=2）；2、除根结点和叶子结点外，其它每个结点至少有[ceil(m / 2)]个孩子（其中', '&lt;p&gt;B 树又叫平衡多路查找树。一棵m阶的B 树 (m叉树)的特性如下：&lt;br /&gt;&lt;br /&gt;1、树中每个结点最多含有m个孩子（m&amp;gt;=2）；&lt;br /&gt;&lt;/p&gt;&lt;p&gt;2、除根结点和叶子结点外，其它每个结点至少有[ceil(m / 2)]个孩子（其中ceil(x)是一个取上限的函数）；&lt;br /&gt;&lt;/p&gt;&lt;p&gt;3、若根结点不是叶子结点，则至少有2个孩子（特殊情况：没有孩子的根结点，即根结点为叶子结点，整棵树只有一个根节点）；&lt;br /&gt;&lt;/p&gt;&lt;p&gt;4、所有叶子结点都出现在同一层，叶子结点不包含任何关键字信息，也可以认为，叶子节点只是没有孩子和指向孩子的指针，这些节点也存在，也有元素。其实，关键是把什么当做叶子结点，因为如红黑树中，每一个NULL指针即当做叶子结点，只是没画出来而已）。&lt;/p&gt;&lt;p&gt;5、每个非终端结点中包含有n个关键字信息： (n，P0，K1，P1，K2，P2，......，Kn，Pn)。其中：&lt;br /&gt; &amp;nbsp; a) &amp;nbsp; Ki (i=1...n)为关键字，且关键字按顺序升序排序K(i-1)&amp;lt; Ki。 &lt;br /&gt; &amp;nbsp; b) &amp;nbsp; Pi为指向子树根的接点，且指针P(i-1)指向子树种所有结点的关键字均小于Ki，但都大于K(i-1)。 &lt;br /&gt; &amp;nbsp; c) &amp;nbsp; 关键字的个数n必须满足： [ceil(m / 2)-1]&amp;lt;= n &amp;lt;= m-1。 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;', '', '', 'http://blog.csdn.net/maohaiyan/article/details/7407719', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 22:04:40', '2013-04-10 22:06:57');
INSERT INTO `blog_info` VALUES ('5', '1', '1', '21', '1', '让你的PHP更安全之PHP.ini', '', 'php用越来越多！安全问题更为重要！这里讲解如果安全配置php.ini 安全配置一 (1) 打开php的安全模式　　php的安全模式是个非常重要的内嵌的安全机制，能够控制一些php中的函数，比如sys...', '&lt;p&gt;php用越来越多！安全问题更为重要！这里讲解如果安全配置php.ini&lt;br /&gt; &lt;br /&gt;安全配置一&lt;br /&gt; &lt;br /&gt;(1) 打开php的安全模式&lt;br /&gt;　　php的安全模式是个非常重要的内嵌的安全机制，能够控制一些php中的函数，比如system()，&lt;br /&gt;　　同时把很多文件操作函数进行了权限控制，也不允许对某些关键文件的文件，比如/etc/passwd，&lt;br /&gt;　　但是默认的php.ini是没有打开安全模式的，我们把它打开：&lt;br /&gt;　　safe_mode = on&lt;br /&gt; &lt;br /&gt;(2) 用户组安全&lt;br /&gt;　　当safe_mode打开时，safe_mode_gid被关闭，那么php脚本能够对文件进行访问，而且相同&lt;br /&gt;　　组的用户也能够对文件进行访问。&lt;br /&gt;　　建议设置为：&lt;br /&gt;　　safe_mode_gid = off&lt;br /&gt;　　如果不进行设置，可能我们无法对我们服务器网站目录下的文件进行操作了，比如我们需要&lt;br /&gt;　　对文件进行操作的时候。&lt;br /&gt; &lt;br /&gt;(3) 安全模式下执行程序主目录&lt;br /&gt;　　如果安全模式打开了，但是却是要执行某些程序的时候，可以指定要执行程序的主目录：&lt;br /&gt;　　safe_mode_exec_dir = D:/usr/bin&lt;br /&gt;　　一般情况下是不需要执行什么程序的，所以推荐不要执行系统程序目录，可以指向一个目录，&lt;br /&gt;　　然后把需要执行的程序拷贝过去，比如：&lt;br /&gt;　　safe_mode_exec_dir = D:/tmp/cmd&lt;br /&gt;　　但是，我更推荐不要执行任何程序，那么就可以指向我们网页目录：&lt;br /&gt;　　safe_mode_exec_dir = D:/usr/www&lt;br /&gt; &lt;br /&gt;(4) 安全模式下包含文件&lt;br /&gt;　　如果要在安全模式下包含某些公共文件，那么就修改一下选项：&lt;br /&gt;　　safe_mode_include_dir = D:/usr/www/include/&lt;br /&gt;　　其实一般php脚本中包含文件都是在程序自己已经写好了，这个可以根据具体需要设置。&lt;br /&gt; &lt;br /&gt;(5) 控制php脚本能访问的目录&lt;br /&gt;　　使用open_basedir选项能够控制PHP脚本只能访问指定的目录，这样能够避免PHP脚本访问&lt;br /&gt;　　不应该访问的文件，一定程度上限制了phpshell的危害，我们一般可以设置为只能访问网站目录：&lt;br /&gt;　　open_basedir = D:/usr/www&lt;br /&gt; &lt;br /&gt;(6) 关闭危险函数&lt;br /&gt;　　如果打开了安全模式，那么函数禁止是可以不需要的，但是我们为了安全还是考虑进去。比如，&lt;br /&gt;　　我们觉得不希望执行包括system()等在那的能够执行命令的php函数，或者能够查看php信息的&lt;br /&gt;　　phpinfo()等函数，那么我们就可以禁止它们：&lt;br /&gt;　　disable_functions = system,passthru,exec,shell_exec,popen,phpinfo&lt;br /&gt;　　如果你要禁止任何文件和目录的操作，那么可以关闭很多文件操作&lt;br /&gt;　　disable_functions = chdir,chroot,dir,getcwd,opendir,readdir,scandir,fopen,unlink,delete,copy,mkdir, 　　rmdir,rename,file,file_get_contents,fputs,fwrite,chgrp,chmod,chown&lt;br /&gt;　　以上只是列了部分不叫常用的文件处理函数，你也可以把上面执行命令函数和这个函数结合，&lt;br /&gt;　　就能够抵制大部分的phpshell了。&lt;br /&gt; &lt;br /&gt;(7) 关闭PHP版本信息在http头中的泄漏&lt;br /&gt;　　我们为了防止黑客获取服务器中php版本的信息，可以关闭该信息斜路在http头中：&lt;br /&gt;　　expose_php = Off&lt;br /&gt;　　比如黑客在 telnet www.12345.com 80 的时候，那么将无法看到PHP的信息。&lt;br /&gt; &lt;br /&gt;(8) 关闭注册全局变量&lt;br /&gt;　　在PHP中提交的变量，包括使用POST或者GET提交的变量，都将自动注册为全局变量，能够直接访问，&lt;br /&gt;　　这是对服务器非常不安全的，所以我们不能让它注册为全局变量，就把注册全局变量选项关闭：&lt;br /&gt;　　register_globals = Off&lt;br /&gt;　　当然，如果这样设置了，那么获取对应变量的时候就要采用合理方式，比如获取GET提交的变量var，&lt;br /&gt;　　那么就要用$_GET[&amp;39;var&amp;39;]来进行获取，这个php程序员要注意。&lt;br /&gt; &lt;br /&gt;(9) 打开magic_quotes_gpc来防止SQL注入&lt;br /&gt;　　SQL注入是非常危险的问题，小则网站后台被入侵，重则整个服务器沦陷，&lt;br /&gt;　　所以一定要小心。php.ini中有一个设置：&lt;br /&gt;　　magic_quotes_gpc = Off&lt;br /&gt;　　这个默认是关闭的，如果它打开后将自动把用户提交对sql的查询进行转换，&lt;br /&gt;　　比如把 &amp;39; 转为 &amp;39;等，这对防止sql注射有重大作用。所以我们推荐设置为：&lt;br /&gt;　　magic_quotes_gpc = On&lt;br /&gt; &lt;br /&gt;(10) 错误信息控制&lt;br /&gt;　　一般php在没有连接到数据库或者其他情况下会有提示错误，一般错误信息中会包含php脚本当&lt;br /&gt;　　前的路径信息或者查询的SQL语句等信息，这类信息提供给黑客后，是不安全的，所以一般服务器建议禁止错误提示：&lt;br /&gt;　　display_errors = Off&lt;br /&gt;　　如果你却是是要显示错误信息，一定要设置显示错误的级别，比如只显示警告以上的信息：&lt;br /&gt;　　error_reporting = E_WARNING &amp;amp; E_ERROR&lt;br /&gt;　　当然，我还是建议关闭错误提示。&lt;br /&gt; &lt;br /&gt;(11) 错误日志&lt;br /&gt;　　建议在关闭display_errors后能够把错误信息记录下来，便于查找服务器运行的原因：&lt;br /&gt;　　log_errors = On&lt;br /&gt;　　同时也要设置错误日志存放的目录，建议根apache的日志存在一起：&lt;br /&gt;　　error_log = D:/usr/local/apache2/logs/php_error.log&lt;br /&gt;　　注意：给文件必须允许apache用户的和组具有写的权限。&lt;br /&gt; &lt;br /&gt;　　MYSQL的降权运行&lt;br /&gt;　　新建立一个用户比如mysqlstart&lt;br /&gt;　　net user mysqlstart microsoft /add&lt;br /&gt;　　net localgroup users mysqlstart /del&lt;br /&gt; &lt;br /&gt;　　不属于任何组&lt;br /&gt;　　如果MYSQL装在d:mysql ，那么，给 mysqlstart 完全控制 的权限&lt;br /&gt;　　然后在系统服务中设置，MYSQL的服务属性，在登录属性当中，选择此用户 mysqlstart 然后输入密码，确定。&lt;br /&gt;　　重新启动 MYSQL服务，然后MYSQL就运行在低权限下了。&lt;br /&gt;　　如果是在windos平台下搭建的apache我们还需要注意一点，apache默认运行是system权限，&lt;br /&gt;　　这很恐怖，这让人感觉很不爽.那我们就给apache降降权限吧。&lt;br /&gt; &lt;br /&gt;　　net user apache microsoft /add&lt;br /&gt;　　net localgroup users apache /del&lt;br /&gt; &lt;br /&gt;　　ok.我们建立了一个不属于任何组的用户apche。&lt;br /&gt;　　我们打开计算机管理器，选服务，点apache服务的属性，我们选择log on，选择this account，我们填入上面所建立的账户和密码，&lt;br /&gt;　　重启apache服务，ok，apache运行在低权限下了。&lt;br /&gt;　　实际上我们还可以通过设置各个文件夹的权限，来让apache用户只能执行我们想让它能干的事情，给每一个目录建立一个单独能读写的用户。&lt;br /&gt;　　这也是当前很多虚拟主机提供商的流行配置方法哦，不过这种方法用于防止这里就显的有点大材小用了。&lt;br /&gt; &lt;br /&gt;安全配置二&lt;br /&gt; &lt;br /&gt;　　前面介绍了IIS MySQL PHP的基本配置过程和Windows的基本权限设置。这一部分我们需要讨论php的安全配置还有Web目录的安全配置，当然也必须有IIS的变态安全配置了。我这里先废话几句。&lt;br /&gt;　　我们最终的目标是Web站点只运行php，不支持asp不支持asp.net，让特定的目录或者子网站不能执行php脚本，例如图片目录，我们对它设置成不能运行php，这样就算您的网站被“黑客”登录了后台，能上传文件。但是最终他也不能执行webshell。&lt;br /&gt;　　就算拿到了webshell，他也不能读目录或者文件，不能执行命令。换句大话就是说强大的webshell在黑客手上没有任何的利用价值，让黑客最终直接抓狂而死。呵呵!其实做到这一点不是非常的难，跟随我的脚步来吧。学完本文章你就能独立的完成这样的变态的服务器配置了。&lt;br /&gt; &lt;br /&gt;一、php.ini文件变态配置&lt;br /&gt; &lt;br /&gt;　　我们为什么把php.ini放在最前面写呢，因为我们的Web网站是php的，所以很多默认的选项是不安全的。给黑客留下了非常多的可利用机会，所以第一步我们必须要把php.ini设置的变态些，这样就能阻止一般脚本黑客的攻击了。&lt;br /&gt;　　我们首先来了解一些php.ini的基本概念性。空白字符和以分号开始的行被简单地忽略。设置指令的格式如下：directive = value 指令名(directive)是大小写敏感的!所以&amp;quot;foo=bar&amp;quot;不同于&amp;quot;FOO=bar&amp;quot;。值(value)可以是：&lt;br /&gt; &lt;br /&gt;　　1. 用引号界定的字符串(如：&amp;quot;foo&amp;quot;)&lt;br /&gt;　　2. 一个数字(整数或浮点数，如：0，1，34，-1，33.55)&lt;br /&gt;　　3. 一个PHP常量(如：E_ALL，M_PI)&lt;br /&gt;　　4. 一个INI常量(On，Off，none)&lt;br /&gt;　　5. 一个表达式(如：E_ALL &amp;amp; ~E_NOTICE)&lt;br /&gt; &lt;br /&gt;　　还有另外一个是设置布尔值，1为On就是开启，0为Off就是关闭。php.ini分了很多部分，例如：模块部分，php全局配置，数据库配置，等等。如图1所示是一个基本的php.ini的例子。了解了基本的概念以后我们就可以开始变态配置之旅。&lt;br /&gt;&lt;/p&gt;', '', '', 'http://www.php100.com/html/webkaifa/PHP/PHPyingyong/2013/0502/13423.html', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-05-04 23:11:16', '2013-05-04 23:11:16');

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
  KEY `sid` (`sid`) USING BTREE,
  KEY `aiid` (`biid`) USING BTREE,
  KEY `agid` (`bgid`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `biid` (`biid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `biid` (`biid`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `smid` (`smid`) USING BTREE,
  KEY `biid` (`biid`) USING BTREE,
  KEY `tag_name` (`tag_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='博文标签表';

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('1', '1', '20', '1', '堆');
INSERT INTO `blog_tag` VALUES ('2', '1', '20', '1', '中位数');
INSERT INTO `blog_tag` VALUES ('3', '1', '20', '3', '大数据');
INSERT INTO `blog_tag` VALUES ('4', '1', '20', '3', '海量数据');
INSERT INTO `blog_tag` VALUES ('5', '1', '20', '3', '中位数');
INSERT INTO `blog_tag` VALUES ('6', '1', '20', '2', '大数据');
INSERT INTO `blog_tag` VALUES ('7', '1', '20', '2', '海量数据');
INSERT INTO `blog_tag` VALUES ('8', '1', '20', '4', 'BTree');
INSERT INTO `blog_tag` VALUES ('9', '1', '20', '4', 'B树');

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
  KEY `sid` (`sid`) USING BTREE,
  KEY `smid` (`smid`) USING BTREE,
  KEY `tag_name` (`tag_name`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `smid` (`smid`) USING BTREE,
  KEY `pcid` (`pcid`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of product_goods
-- ----------------------------
INSERT INTO `product_goods` VALUES ('1', '1', '1', '商品1', '0.00', '0.00', '0.00', 'http://img5.ibanggo.com/sources/images/goods/MB/213813/213813_00.jpg', '0', '1', '2013-04-12 10:52:27', '2013-04-12 10:53:47');

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
  KEY `sid` (`sid`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `source_code` (`source_code`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户基础信息表';

-- ----------------------------
-- Records of user_base
-- ----------------------------
INSERT INTO `user_base` VALUES ('1', '1', 'altila', 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '0', '', '1', '0', '1970-01-01 08:00:00', '1', '', '2012-12-11 14:00:03', '2012-12-11 14:00:06');
INSERT INTO `user_base` VALUES ('2', '1', 'altila1', 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '0', '', '1', '0', '1970-01-01 08:00:00', '1', '', '2012-12-11 14:00:03', '2013-04-28 15:11:40');

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
  KEY `uid` (`uid`) USING BTREE
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
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `log_ip` (`log_ip`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户登陆明细表';

-- ----------------------------
-- Records of user_log_stat
-- ----------------------------
INSERT INTO `user_log_stat` VALUES ('1', '1', '1', '127.0.0.1', '2013-02-02 22:39:00', '2013-02-02 22:39:00');
