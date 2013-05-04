/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : altila_blog

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2013-05-04 12:49:00
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `name` varchar(100) DEFAULT '' COMMENT '相片名称',
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='博文信息表';

-- ----------------------------
-- Records of blog_info
-- ----------------------------
INSERT INTO `blog_info` VALUES ('1', '1', '1', '20', '双堆求中位数', '堆,中位数', '求数组中位数的方法：1、排序2、双堆3、findk效率分别是nlog(n)、nlog(n)、log(n)用堆维护中位数的意思是说，设计两个堆，第一个堆存放小于中位数的元素，第二个堆存放大于中位数的元素', '&lt;p&gt;求数组中位数的方法：&lt;br /&gt;&lt;br /&gt;1、排序&lt;br /&gt;&lt;br /&gt;2、双堆&lt;br /&gt;&lt;br /&gt;3、findk&lt;br /&gt;&lt;br /&gt;效率分别是nlog(n)、nlog(n)、log(n)&lt;br /&gt;&lt;br /&gt;用堆维护中位数的意思是说，设计两个堆，第一个堆存放小于中位数的元素，第二个堆存放大于中位数的元素。&lt;br /&gt;&lt;br /&gt;下面是双堆维护中位数的语言描述：&lt;br /&gt;&lt;br /&gt;1、初始化的时候设置两个变量分别记录两个堆【左堆和右堆】的元素的个数&lt;br /&gt;&lt;br /&gt;2、取第一个元素【d[0]】作为初始中位数m&lt;br /&gt;&lt;br /&gt;3、循环后面的每一个元素，如果比m大，则插入到右堆，如果比m小，则插入到左堆&lt;br /&gt;&lt;br /&gt;4、此时如果左堆和右堆的元素数目之差的绝对值等于2，说明左右两侧的元素不平衡了。需要把m插入到元素少的那个数组中，然后取下一个数组元素作为中位数，重复3和4。&lt;br /&gt;&lt;br /&gt;5、经过上述步骤，数组的所有元素都已经在堆中了。如果两个堆的数据元素个数相等那么有两个中位数，即两个堆的堆顶。如果两个堆的数据数目不相等，则元素多的那个堆的堆顶是数组中位数。 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;', '', '', 'http://blog.csdn.net/maohaiyan/article/details/8059483', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-08 14:48:54', '2013-04-10 15:29:31');
INSERT INTO `blog_info` VALUES ('2', '1', '1', '20', '大数据及海量数据处理算法总结', '大数据,海量数据', '大数据量的问题是很多面试笔试中经常出现的问题，比如baidu google 腾讯 这样的一些涉及到海量数据的公司经常会问到 下面的方法是我对海量数据的处理方法进行了一个一般性的总结，当然这些方法可能并', '&lt;p&gt;大数据量的问题是很多面试笔试中经常出现的问题，比如baidu google 腾讯 这样的一些涉及到海量数据的公司经常会问到&lt;br /&gt;&lt;br /&gt; &lt;br /&gt;下面的方法是我对海量数据的处理方法进行了一个一般性的总结，当然这些方法可能并不能完全覆盖所有的问题，但是这样的一些方法也基本可以处理绝大多数遇到的问题。下面的一些问题基本直接来源于公司的面试笔试题目，方法不一定最优，如果你有更好的处理方法，欢迎与我讨论。 &lt;br /&gt;&lt;br /&gt;1.Bloom filter &lt;br /&gt;&lt;br /&gt;适用范围：可以用来实现数据字典，进行数据的判重，或者集合求交集 &lt;br /&gt;&lt;br /&gt;基本原理及要点： &lt;br /&gt;对于原理来说很简单，位数组 k个独立hash函数。将hash函数对应的值的位数组置1，查找时如果发现所有hash函数对应位都是1说明存在，很明显这个过程并不保证查找的结果是100%正确的。同时也不支持删除一个已经插入的关键字，因为该关键字对应的位会牵动到其他的关键字。所以一个简单的改进就是 ing Bloom filter，用一个er数组代替位数组，就可以支持删除了。 &lt;br /&gt;&lt;br /&gt;还有一个比较重要的问题，如何根据输入元素个数n，确定位数组m的大小及hash函数个数。当hash函数个数k=(ln2)(m/n)时错误率最小。在错误率不大于E的情况下，m至少要等于nlg(1/E)才能表示任意n个元素的集合。但m还应该更大些，因为还要保证bit数组里至少一半为 0，则m 应该&amp;gt;=nlg(1/E)lge 大概就是nlg(1/E)1.44倍(lg表示以2为底的对数)。 &lt;br /&gt;&lt;br /&gt;举个例子我们假设错误率为0.01，则此时m应大概是n的13倍。这样k大概是8个。 &lt;br /&gt;&lt;br /&gt;注意这里m与n的单位不同，m是bit为单位，而n则是以元素个数为单位(准确的说是不同元素的个数)。通常单个元素的长度都是有很多bit的。所以使用bloom filter内存上通常都是节省的。 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;Bloom filter将集合中的元素映射到位数组中，用k（k为哈希函数个数）个映射位是否全1表示元素在不在这个集合中。ing bloom filter（CBF）将位数组中的每一位扩展为一个er，从而支持了元素的删除操作。Spectral Bloom Filter（SBF）将其与集合元素的出现次数关联。SBF采用er中的最小值来近似表示元素的出现频率。 &lt;br /&gt;&lt;br /&gt;问题实例：给你A,B两个文件，各存放50亿条URL，每条URL占用64字节，内存限制是4G，让你找出A,B文件共同的URL。如果是三个乃至n个文件呢？ &lt;br /&gt;&lt;br /&gt;根据这个问题我们来计算下内存的占用，4G=2^32大概是40亿8大概是340亿，n=50亿，如果按出错率0.01算需要的大概是650亿个 bit。现在可用的是340亿，相差并不多，这样可能会使出错率上升些。另外如果这些urlip是一一对应的，就可以转换成ip，则大大简单了。 &lt;br /&gt;&lt;br /&gt;2.Hashing &lt;br /&gt;&lt;br /&gt;适用范围：快速查找，删除的基本数据结构，通常需要总数据量可以放入内存 &lt;br /&gt;&lt;br /&gt;基本原理及要点： &lt;br /&gt;hash函数选择，针对字符串，整数，排列，具体相应的hash方法。 &lt;br /&gt;碰撞处理，一种是open hashing，也称为拉链法；另一种就是closed hashing，也称开地址法，opened addressing。 (http://www.my400800.cn) &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;d-left hashing中的d是多个的意思，我们先简化这个问题，看一看2-left hashing。2-left hashing指的是将一个哈希表分成长度相等的两半，分别叫做T1和T2，给T1和T2分别配备一个哈希函数，h1和h2。在存储一个新的key时，同时用两个哈希函数进行计算，得出两个地址h1[key]和h2[key]。这时需要检查T1中的h1[key]位置和T2中的h2[key]位置，哪一个位置已经存储的（有碰撞的）key比较多，然后将新key存储在负载少的位置。如果两边一样多，比如两个位置都为空或者都存储了一个key，就把新key 存储在左边的T1子表中，2-left也由此而来。在查找一个key时，必须进行两次hash，同时查找两个位置。 &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1).海量日志数据，提取出某日访问百度次数最多的那个IP。 &lt;br /&gt;&lt;br /&gt;IP的数目还是有限的，最多2^32个，所以可以考虑使用hash将ip直接存入内存，然后进行统计。 &lt;br /&gt;&lt;br /&gt;3.bit-map &lt;br /&gt;&lt;br /&gt;适用范围：可进行数据的快速查找，判重，删除，一般来说数据范围是int的10倍以下 &lt;br /&gt;&lt;br /&gt;基本原理及要点：使用bit数组来表示某些元素是否存在，比如8位电话号码 &lt;br /&gt;&lt;br /&gt;扩展：bloom filter可以看做是对bit-map的扩展 &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;&lt;br /&gt;1)已知某个文件内包含一些电话号码，每个号码为8位数字，统计不同号码的个数。 &lt;br /&gt;&lt;br /&gt;8位最多99 999 999，大概需要99m个bit，大概10几m字节的内存即可。 &lt;br /&gt;&lt;br /&gt;2)2.5亿个整数中找出不重复的整数的个数，内存空间不足以容纳这2.5亿个整数。 &lt;br /&gt;&lt;br /&gt;将bit-map扩展一下，用2bit表示一个数即可，0表示未出现，1表示出现一次，2表示出现2次及以上。或者我们不用2bit来进行表示，我们用两个bit-map即可模拟实现这个2bit-map。 &lt;br /&gt;&lt;br /&gt;4.堆 &lt;br /&gt;&lt;br /&gt;适用范围：海量数据前n大，并且n比较小，堆可以放入内存 &lt;br /&gt;&lt;br /&gt;基本原理及要点：最大堆求前n小，最小堆求前n大。方法，比如求前n小，我们比较当前元素与最大堆里的最大元素，如果它小于最大元素，则应该替换那个最大元素。这样最后得到的n个元素就是最小的n个。适合大数据量，求前n小，n的大小比较小的情况，这样可以扫描一遍即可得到所有的前n元素，效率很高。 &lt;br /&gt;&lt;br /&gt;扩展：双堆，一个最大堆与一个最小堆结合，可以用来维护中位数。 &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1)100w个数中找最大的前100个数。 &lt;br /&gt;&lt;br /&gt;用一个100个元素大小的最小堆即可。 &lt;br /&gt;&lt;br /&gt;5.双层桶划分 其实本质上就是【分而治之】的思想，重在“分”的技巧上！ &lt;br /&gt;&lt;br /&gt;适用范围：第k大，中位数，不重复或重复的数字 &lt;br /&gt;&lt;br /&gt;基本原理及要点：因为元素范围很大，不能利用直接寻址表，所以通过多次划分，逐步确定范围，然后最后在一个可以接受的范围内进行。可以通过多次缩小，双层只是一个例子。 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1).2.5亿个整数中找出不重复的整数的个数，内存空间不足以容纳这2.5亿个整数。 &lt;br /&gt;&lt;br /&gt;有点像鸽巢原理，整数个数为2^32,也就是，我们可以将这2^32个数，划分为2^8个区域(比如用单个文件代表一个区域)，然后将数据分离到不同的区域，然后不同的区域在利用bitmap就可以直接解决了。也就是说只要有足够的磁盘空间，就可以很方便的解决。 &lt;br /&gt;&lt;br /&gt;2).5亿个int找它们的中位数。 &lt;br /&gt;&lt;br /&gt;这个例子比上面那个更明显。首先我们将int划分为2^16个区域，然后读取数据统计落到各个区域里的数的个数，之后我们根据统计结果就可以判断中位数落到那个区域，同时知道这个区域中的第几大数刚好是中位数。然后第二次扫描我们只统计落在这个区域中的那些数就可以了。 &lt;br /&gt;&lt;br /&gt;实际上，如果不是int是int64，我们可以经过3次这样的划分即可降低到可以接受的程度。即可以先将int64分成2^24个区域，然后确定区域的第几大数，在将该区域分成2^20个子区域，然后确定是子区域的第几大数，然后子区域里的数的个数只有2^20，就可以直接利用direct addr table进行统计了。 &lt;br /&gt;&lt;br /&gt;6.数据库索引 &lt;br /&gt;&lt;br /&gt;适用范围：大数据量的增删改查 &lt;br /&gt;&lt;br /&gt;基本原理及要点：利用数据的设计实现方法，对海量数据的增删改查进行处理。 &lt;br /&gt;扩展： &lt;br /&gt;问题实例： &lt;br /&gt;&lt;br /&gt;&lt;br /&gt;7.倒排索引(Inverted index) &lt;br /&gt;&lt;br /&gt;适用范围：搜索引擎，关键字查询 &lt;br /&gt;&lt;br /&gt;基本原理及要点：为何叫倒排索引？一种索引方法，被用来存储在全文搜索下某个单词在一个文档或者一组文档中的存储位置的映射。 &lt;br /&gt;&lt;br /&gt;以英文为例，下面是要被索引的文本： &lt;br /&gt;T0 = &amp;quot;it is what it is&amp;quot; &lt;br /&gt;T1 = &amp;quot;what is it&amp;quot; &lt;br /&gt;T2 = &amp;quot;it is a banana&amp;quot; &lt;br /&gt;我们就能得到下面的反向文件索引： &lt;br /&gt;&amp;quot;a&amp;quot;: {2} &lt;br /&gt;&amp;quot;banana&amp;quot;: {2} &lt;br /&gt;&amp;quot;is&amp;quot;: {0, 1, 2} &lt;br /&gt;&amp;quot;it&amp;quot;: {0, 1, 2} &lt;br /&gt;&amp;quot;what&amp;quot;: {0, 1} &lt;br /&gt;检索的条件&amp;quot;what&amp;quot;, &amp;quot;is&amp;quot; 和 &amp;quot;it&amp;quot; 将对应集合的交集。 &lt;br /&gt;&lt;br /&gt;正向索引开发出来用来存储每个文档的单词的列表。正向索引的查询往往满足每个文档有序频繁的全文查询和每个单词在校验文档中的验证这样的查询。在正向索引中，文档占据了中心的位置，每个文档指向了一个它所包含的索引项的序列。也就是说文档指向了它包含的那些单词，而反向索引则是单词指向了包含它的文档，很容易看到这个反向的关系。 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;&lt;br /&gt;问题实例：文档检索系统，查询那些文件包含了某单词，比如常见的学术论文的关键字搜索。 &lt;br /&gt;&lt;br /&gt;8.外排序 &lt;br /&gt;&lt;br /&gt;适用范围：大数据的排序，去重 &lt;br /&gt;&lt;br /&gt;基本原理及要点：外排序的归并方法，置换选择 败者树原理，最优归并树 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1).有一个1G大小的一个文件，里面每一行是一个词，词的大小不超过16个字节，内存限制大小是1M。返回频数最高的100个词。 &lt;br /&gt;&lt;br /&gt;这个数据具有很明显的特点，词的大小为16个字节，但是内存只有1m做hash有些不够，所以可以用来排序。内存可以当输入缓冲区使用。 &lt;br /&gt;&lt;br /&gt;9.trie树 &lt;br /&gt;&lt;br /&gt;适用范围：数据量大，重复多，但是数据种类小可以放入内存 &lt;br /&gt;&lt;br /&gt;基本原理及要点：实现方式，节点孩子的表示方式 &lt;br /&gt;&lt;br /&gt;扩展：压缩实现。 &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1).有10个文件，每个文件1G， 每个文件的每一行都存放的是用户的query，每个文件的query都可能重复。要你按照query的频度排序 。 &lt;br /&gt;&lt;br /&gt;2).1000万字符串，其中有些是相同的(重复),需要把重复的全部去掉，保留没有重复的字符串。请问怎么设计和实现？ &lt;br /&gt;&lt;br /&gt;3).寻找热门查询：查询串的重复度比较高，虽然总数是1千万，但如果除去重复后，不超过3百万个，每个不超过255字节。 &lt;br /&gt;&lt;br /&gt;10.分布式处理 mapreduce &lt;br /&gt;&lt;br /&gt;适用范围：数据量大，但是数据种类小可以放入内存 &lt;br /&gt;&lt;br /&gt;基本原理及要点：将数据交给不同的机器去处理，数据划分，结果归约。 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;&lt;br /&gt;1).The canonical example application of MapReduce is a process to &amp;nbsp;the appearances of &lt;br /&gt;&lt;br /&gt;each different word in a set of documents: &lt;br /&gt;void map(String name, String document): &lt;br /&gt;// name: document name &lt;br /&gt;// document: document contents &lt;br /&gt;for each word w in document: &lt;br /&gt;EmitIntermediate(w, 1); &lt;br /&gt;&lt;br /&gt;void reduce(String word, Iterator partials): &lt;br /&gt;// key: a word &lt;br /&gt;// values: a list of aggregated partial s &lt;br /&gt;int result = 0; &lt;br /&gt;for each v in partials: &lt;br /&gt;result &amp;nbsp;= ParseInt(v); &lt;br /&gt;Emit(result); &lt;br /&gt;Here, each document is split in words, &amp;nbsp;each word is ed initially with a &amp;quot;1&amp;quot; value by &lt;br /&gt;&lt;br /&gt;the Map function, using the word as the result key. The framework puts together all the pairs &lt;br /&gt;&lt;br /&gt;with the same key &amp;nbsp;feeds them to the same call to Reduce, thus this function just needs to &lt;br /&gt;&lt;br /&gt;sum all of its input values to find the total appearances of that word. &lt;br /&gt;&lt;br /&gt;2).海量数据分布在100台电脑中，想个办法高效统计出这批数据的TOP10。 &lt;br /&gt;&lt;br /&gt;3).一共有N个机器，每个机器上有N个数。每个机器最多存O(N)个数并对它们操作。如何找到N^2个数的中数(median)？ &lt;br /&gt;&lt;br /&gt;&lt;br /&gt;经典问题分析 &lt;br /&gt;&lt;br /&gt;上千万or亿数据（有重复），统计其中出现次数最多的前N个数据,分两种情况：可一次读入内存，不可一次读入。 &lt;br /&gt;&lt;br /&gt;可用思路：trie树 堆，数据库索引，划分子集分别统计，hash，分布式计算，近似统计，外排序 &lt;br /&gt;&lt;br /&gt;所谓的是否能一次读入内存，实际上应该指去除重复后的数据量。如果去重后数据可以放入内存，我们可以为数据建立字典，比如通过 map，hashmap，trie，然后直接进行统计即可。当然在更新每条数据的出现次数的时候，我们可以利用一个堆来维护出现次数最多的前N个数据，当然这样导致维护次数增加，不如完全统计后在求前N大效率高。 &lt;br /&gt;&lt;br /&gt;如果数据无法放入内存。一方面我们可以考虑上面的字典方法能否被改进以适应这种情形，可以做的改变就是将字典存放到硬盘上，而不是内存，这可以参考数据库的存储方法。 &lt;br /&gt;&lt;br /&gt;当然还有更好的方法，就是可以采用分布式计算，基本上就是map-reduce过程，首先可以根据数据值或者把数据hash(md5)后的值，将数据按照范围划分到不同的机子，最好可以让数据划分后可以一次读入内存，这样不同的机子负责处理各种的数值范围，实际上就是map。得到结果后，各个机子只需拿出各自的出现次数最多的前N个数据，然后汇总，选出所有的数据中出现次数最多的前N个数据，这实际上就是reduce过程。 &lt;br /&gt;&lt;br /&gt;实际上可能想直接将数据均分到不同的机子上进行处理，这样是无法得到正确的解的。因为一个数据可能被均分到不同的机子上，而另一个则可能完全聚集到一个机子上，同时还可能存在具有相同数目的数据。比如我们要找出现次数最多的前100个，我们将1000万的数据分布到10台机器上，找到每台出现次数最多的前 100个，归并之后这样不能保证找到真正的第100个，因为比如出现次数最多的第100个可能有1万个，但是它被分到了10台机子，这样在每台上只有1千个，假设这些机子排名在1000个之前的那些都是单独分布在一台机子上的，比如有1001个，这样本来具有1万个的这个就会被淘汰，即使我们让每台机子选出出现次数最多的1000个再归并，仍然会出错，因为可能存在大量个数为1001个的发生聚集。因此不能将数据随便均分到不同机子上，而是要根据hash 后的值将它们映射到不同的机子上处理，让不同的机器处理一个数值范围。 &lt;br /&gt;&lt;br /&gt;而外排序的方法会消耗大量的IO，效率不会很高。而上面的分布式方法，也可以用于单机版本，也就是将总的数据根据值的范围，划分成多个不同的子文件，然后逐个处理。处理完毕之后再对这些单词的及其出现频率进行一个归并。实际上就可以利用一个外排序的归并过程。 &lt;br /&gt;&lt;br /&gt;另外还可以考虑近似计算，也就是我们可以通过结合自然语言属性，只将那些真正实际中出现最多的那些词作为一个字典，使得这个规模可以放入内存。&lt;br /&gt;&lt;/p&gt;', '', '', 'http://www.jb51.net/article/27064.htm', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 17:25:13', '2013-04-10 22:06:27');
INSERT INTO `blog_info` VALUES ('3', '1', '1', '20', '从海量数据中找出中位数', '大数据,海量数据,中位数', '题目：在一个文件中有 10G 个整数，乱序排列，要求找出中位数。内存限制为 2G。只写出思路即可（内存限制为 2G的意思就是，可以使用2G的空间来运行程序，而不考虑这台机器上的其他软件的占用内存）', '&lt;p&gt;题目：在一个文件中有 10G 个整数，乱序排列，要求找出中位数。内存限制为 2G。只写出思路即可（内存限制为 2G的意思就是，可以使用2G的空间来运行程序，而不考虑这台机器上的其他软件的占用内存）。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;关于中位数：数据排序后，位置在最中间的数值。即将数据分成两部分，一部分大于该数值，一部分小于该数值。中位数的位置：当样本数为奇数时，中位数=(N 1)/2 ; 当样本数为偶数时，中位数为N/2与1 N/2的均值（那么10G个数的中位数，就第5G大的数与第5G 1大的数的均值了）。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;分析：明显是一道工程性很强的题目，和一般的查找中位数的题目有几点不同。&lt;br /&gt;1. 原数据不能读进内存，不然可以用快速选择，如果数的范围合适的话还可以考虑桶排序或者计数排序，但这里假设是32位整数，仍有4G种取值，需要一个16G大小的数组来计数。&lt;br /&gt;2. 若看成从N个数中找出第K大的数，如果K个数可以读进内存，可以利用最小或最大堆，但这里K=N/2,有5G个数，仍然不能读进内存。&lt;br /&gt;3. 接上，对于N个数和K个数都不能一次读进内存的情况，《编程之美》里给出一个方案：设k&amp;lt;K,且k个数可以完全读进内存，那么先构建k个数的堆，先找出第0到k大的数，再扫描一遍数组找出第k 1到2k的数，再扫描直到找出第K个数。虽然每次时间大约是nlog(k)，但需要扫描ceil(K/k)次，这里要扫描5次。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;解法：首先假设是32位无符号整数。&lt;br /&gt;1. 读一遍10G个整数，把整数映射到256M个区段中，用一个64位无符号整数给每个相应区段记数。&lt;br /&gt;说明：整数范围是0 - 2^32 - 1，一共有4G种取值，映射到256M个区段，则每个区段有16（4G/256M = 16）种值，每16个值算一段， 0～15是第1段，16～31是第2段，……2^32-16 ～2^32-1是第256M段。一个64位无符号整数最大值是0～8G-1，这里先不考虑溢出的情况。总共占用内存256M×8B=2GB。&lt;br /&gt;2. 从前到后对每一段的计数累加，当累加的和超过5G时停止，找出这个区段（即累加停止时达到的区段，也是中位数所在的区段）的数值范围，设为[a，a 15]，同时记录累加到前一个区段的总数，设为m。然后，释放除这个区段占用的内存。&lt;br /&gt;3. 再读一遍10G个整数，把在[a，a 15]内的每个值计数，即有16个计数。&lt;br /&gt;4. 对新的计数依次累加，每次的和设为n，当m n的值超过5G时停止，此时的这个计数所对应的数就是中位数。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;总结：&lt;br /&gt;1.以上方法只要读两遍整数，对每个整数也只是常数时间的操作，总体来说是线性时间。&lt;br /&gt;2. 考虑其他情况。若是有符号的整数，只需改变映射即可。若是64为整数，则增加每个区段的范围，那么在第二次读数时，要考虑更多的计数。若过某个计数溢出，那么可认定所在的区段或代表整数为所求，这里只需做好相应的处理。噢，忘了还要找第5G 1大的数了，相信有了以上的成果，找到这个数也不难了吧。&lt;br /&gt;3. 时空权衡。花费256个区段也许只是恰好配合2GB的内存（其实也不是，呵呵）。可以增大区段范围，减少区段数目，节省一些内存，虽然增加第二部分的对单个数值的计数，但第一部分对每个区段的计数加快了（总体改变？？待测）。&lt;br /&gt;4. 映射时尽量用位操作，由于每个区段的起点都是2的整数幂，映射起来也很方便。&lt;br /&gt;&lt;/p&gt;', '', '', 'http://blog.csdn.net/maohaiyan/article/details/8059931', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 17:49:23', '2013-04-10 22:06:00');
INSERT INTO `blog_info` VALUES ('4', '1', '1', '20', 'B树', 'BTree,B树', 'B 树又叫平衡多路查找树。一棵m阶的B 树 (m叉树)的特性如下：1、树中每个结点最多含有m个孩子（m>=2）；2、除根结点和叶子结点外，其它每个结点至少有[ceil(m / 2)]个孩子（其中', '&lt;p&gt;B 树又叫平衡多路查找树。一棵m阶的B 树 (m叉树)的特性如下：&lt;br /&gt;&lt;br /&gt;1、树中每个结点最多含有m个孩子（m&amp;gt;=2）；&lt;br /&gt;&lt;/p&gt;&lt;p&gt;2、除根结点和叶子结点外，其它每个结点至少有[ceil(m / 2)]个孩子（其中ceil(x)是一个取上限的函数）；&lt;br /&gt;&lt;/p&gt;&lt;p&gt;3、若根结点不是叶子结点，则至少有2个孩子（特殊情况：没有孩子的根结点，即根结点为叶子结点，整棵树只有一个根节点）；&lt;br /&gt;&lt;/p&gt;&lt;p&gt;4、所有叶子结点都出现在同一层，叶子结点不包含任何关键字信息，也可以认为，叶子节点只是没有孩子和指向孩子的指针，这些节点也存在，也有元素。其实，关键是把什么当做叶子结点，因为如红黑树中，每一个NULL指针即当做叶子结点，只是没画出来而已）。&lt;/p&gt;&lt;p&gt;5、每个非终端结点中包含有n个关键字信息： (n，P0，K1，P1，K2，P2，......，Kn，Pn)。其中：&lt;br /&gt; &amp;nbsp; a) &amp;nbsp; Ki (i=1...n)为关键字，且关键字按顺序升序排序K(i-1)&amp;lt; Ki。 &lt;br /&gt; &amp;nbsp; b) &amp;nbsp; Pi为指向子树根的接点，且指针P(i-1)指向子树种所有结点的关键字均小于Ki，但都大于K(i-1)。 &lt;br /&gt; &amp;nbsp; c) &amp;nbsp; 关键字的个数n必须满足： [ceil(m / 2)-1]&amp;lt;= n &amp;lt;= m-1。 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;', '', '', 'http://blog.csdn.net/maohaiyan/article/details/7407719', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 22:04:40', '2013-04-10 22:06:57');

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
