/*
Navicat MySQL Data Transfer

Source Server         : 192.168.137.3
Source Server Version : 50553
Source Host           : 192.168.137.3:3306
Source Database       : newshop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-11 22:35:14
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `shop_address`
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE `shop_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `consignee` varchar(255) NOT NULL COMMENT '收件人',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `tel` varchar(255) DEFAULT '' COMMENT '电话',
  `email` varchar(255) DEFAULT '' COMMENT '邮箱',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `best_time` varchar(255) DEFAULT NULL COMMENT '最佳收货时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_address
-- ----------------------------
INSERT INTO `shop_address` VALUES ('1', '13', 'test', '11111111', '', 'sdfsd@sdfs.com', '广东省广州市天河区', '晚上9点前');
INSERT INTO `shop_address` VALUES ('2', '13', 'orange', '2222222', '', 'sdfsdfsd@qq.com', '北京市', '白天');

-- ----------------------------
-- Table structure for `shop_admin_message`
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin_message`;
CREATE TABLE `shop_admin_message` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发送人',
  `receiver_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '接收人',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '标题',
  `message` text NOT NULL COMMENT '留言',
  `is_readed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '已读|0-否 1-是',
  `send_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`,`receiver_id`),
  KEY `receiver_id` (`receiver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_admin_message
-- ----------------------------
INSERT INTO `shop_admin_message` VALUES ('3', '1', '2', 'sdfsdfs', 'sdfdagsdfgsdf枯相辅相成要要林要要要顶戴夺夺在地一一一一寺地地地寺地地', '1', '1534727698');
INSERT INTO `shop_admin_message` VALUES ('4', '1', '4', '在吗', '注意客户的电话', '0', '1534725964');

-- ----------------------------
-- Table structure for `shop_ads`
-- ----------------------------
DROP TABLE IF EXISTS `shop_ads`;
CREATE TABLE `shop_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL COMMENT '标题',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `url` varchar(255) DEFAULT NULL COMMENT '广告地址',
  `tags` varchar(255) DEFAULT NULL COMMENT '标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_ads
-- ----------------------------
INSERT INTO `shop_ads` VALUES ('3', '香港-法兰克福 ￥3010', '201005/05_12730545815990.gif', 'https://www.gzftx.com/result.php?id=628_&did=686', 'index_1');
INSERT INTO `shop_ads` VALUES ('5', 'ad0', '201007/27_12801987377369.jpg', 'http://gzftx.com', 'index_2');
INSERT INTO `shop_ads` VALUES ('6', 'test', 'sdfsdfsd', 'sdfsfs', 'sfsd');
INSERT INTO `shop_ads` VALUES ('7', 'test', 'sfsdfsd', 'www.baidu.com', 'sdfsd');

-- ----------------------------
-- Table structure for `shop_area`
-- ----------------------------
DROP TABLE IF EXISTS `shop_area`;
CREATE TABLE `shop_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '地区名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_area
-- ----------------------------
INSERT INTO `shop_area` VALUES ('1', '0', '中国');
INSERT INTO `shop_area` VALUES ('2', '1', '广东省');
INSERT INTO `shop_area` VALUES ('3', '2', '广州');
INSERT INTO `shop_area` VALUES ('5', '2', '深圳test');
INSERT INTO `shop_area` VALUES ('6', '3', '白云');
INSERT INTO `shop_area` VALUES ('7', '2', 'test');

-- ----------------------------
-- Table structure for `shop_article`
-- ----------------------------
DROP TABLE IF EXISTS `shop_article`;
CREATE TABLE `shop_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `article_cat_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pic` varchar(100) DEFAULT NULL,
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热门|0-否 1-是',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶|0-否 1-是',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_article
-- ----------------------------
INSERT INTO `shop_article` VALUES ('63', '精油的用法', '  <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfsdfdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('64', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('65', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('66', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('67', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('68', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('69', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('70', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('71', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('72', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('73', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('74', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('75', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('76', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('77', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('78', '精油的用法', '  <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('79', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('80', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('81', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('82', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('83', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('84', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('85', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('86', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('87', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('88', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('89', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('90', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('91', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('92', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('93', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('94', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('95', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('96', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('99', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('100', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('101', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('102', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('103', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('104', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('105', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('106', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('107', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('108', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('109', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('110', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('111', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('112', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('113', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('114', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('115', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('116', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('117', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('118', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('119', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('120', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('121', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('122', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('123', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('124', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('135', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('136', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('137', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('138', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('139', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('140', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('141', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('142', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('143', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('144', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('145', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('146', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('147', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('148', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('149', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('153', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('155', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('156', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('157', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('158', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('159', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('160', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('161', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('162', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('163', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('164', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('165', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('166', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('167', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('168', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('169', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('170', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('171', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('172', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('173', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('174', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('175', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('176', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('177', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('178', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('179', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('180', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('181', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('182', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('183', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('184', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('185', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('186', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('187', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('188', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('189', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('190', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('191', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('192', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('193', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('194', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('195', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('196', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('197', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('198', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('199', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('200', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('201', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('202', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('203', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('204', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('205', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('206', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('207', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('208', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('209', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('210', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('211', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('212', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('213', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('214', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('215', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('216', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('217', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('218', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('219', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('220', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('221', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('222', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('223', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('224', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('225', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('226', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('227', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('228', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('229', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('230', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('231', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('232', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('233', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('234', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('235', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('236', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('237', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('238', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('239', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('240', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('241', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('242', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('243', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('244', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('245', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('246', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('247', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('248', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('249', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('250', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('251', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('252', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('253', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('254', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('255', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('256', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('257', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('258', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('259', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('260', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('261', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('262', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('263', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('264', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('265', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('266', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('267', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('268', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('269', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('270', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('271', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('272', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('273', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('274', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('275', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('276', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('277', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('278', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('279', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('280', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('281', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('282', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('283', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('284', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('285', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('286', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('287', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('288', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('289', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('290', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('291', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('292', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('293', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('294', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('295', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('296', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('297', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('298', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('299', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('300', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('301', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('302', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('303', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('304', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('305', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('306', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('307', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('308', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('309', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('310', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('311', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('312', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('313', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('314', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('315', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('316', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('317', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('318', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('319', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('320', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('321', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('322', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('323', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('324', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('325', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('326', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('327', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('328', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('329', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('330', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('331', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('332', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('333', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('334', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('335', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('336', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('337', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('338', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('339', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('340', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('341', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('342', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('343', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('344', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('345', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('346', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('347', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('348', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('349', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('350', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('351', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('352', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('353', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('354', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('355', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('356', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('357', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('358', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('359', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('360', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('361', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('362', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('363', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('364', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('365', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('366', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('367', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('368', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('369', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('370', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('371', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('372', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('373', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('374', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('375', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('376', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('377', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('378', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('379', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('380', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('381', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('382', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('383', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('384', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('385', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('386', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('387', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('388', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('389', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('390', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('391', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('392', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('393', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('394', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('395', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('396', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('397', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('398', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('399', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('400', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('401', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('402', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('403', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('404', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('405', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('406', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('407', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('408', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('409', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('410', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('411', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('412', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('413', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('414', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('415', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('416', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('417', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('418', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('419', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('420', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('421', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('422', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('423', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('424', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('425', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('426', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('427', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('428', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('429', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('430', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('431', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('432', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('433', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('434', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('435', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('436', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('437', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('438', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('439', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('440', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('441', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('442', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('443', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('444', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('445', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('446', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('447', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('448', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('449', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('450', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('451', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('452', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('453', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('454', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('455', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('456', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('457', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('458', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('459', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('460', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('461', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('462', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('463', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('464', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('465', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('466', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('467', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('468', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('469', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('470', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('471', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('472', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('473', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('474', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('475', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('476', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('477', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('478', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('479', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('480', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('481', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('482', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('483', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('484', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('485', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('486', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('487', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('488', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('489', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('490', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('491', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('492', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('493', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('494', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('495', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('496', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('497', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('498', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('499', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('500', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('501', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('502', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('503', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('504', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('505', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('506', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('507', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('508', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('509', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('510', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('511', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('512', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('513', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('514', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('515', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('516', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('517', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('518', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('519', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('520', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('521', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('522', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('523', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('524', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('525', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('526', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('527', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('528', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('529', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('530', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('531', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('532', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('533', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('534', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('535', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('536', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('537', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('538', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('539', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('540', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('541', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('542', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('543', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('544', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('545', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('546', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('547', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('548', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('549', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('550', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('551', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('552', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('553', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('554', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('555', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('556', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('557', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('558', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('559', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('560', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('561', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('562', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('563', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('564', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('565', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('566', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('567', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('568', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('569', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('570', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('571', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('572', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('573', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('574', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('575', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('576', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('577', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('578', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('579', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('580', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('581', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('582', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('583', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('584', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('585', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('586', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('587', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('588', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('589', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('590', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('591', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('592', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('593', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('594', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('595', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('596', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('597', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('598', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('599', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('600', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('601', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('602', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('603', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('604', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('605', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('606', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('607', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('608', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('609', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('610', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('611', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('612', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('613', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('614', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('615', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('616', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('617', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('618', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('619', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('620', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('621', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('622', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('623', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('624', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('625', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('626', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('627', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('628', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('629', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('630', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('631', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('632', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('633', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('634', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('635', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('636', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('637', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('638', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('639', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('640', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('641', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('642', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('643', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('644', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('645', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('646', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('647', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('648', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('649', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('650', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('651', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('652', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('653', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('654', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('655', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('656', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('657', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('658', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('659', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('660', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('661', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('662', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('663', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('664', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('665', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('666', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('667', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('668', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('669', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('670', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('671', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('672', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('673', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('674', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('675', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('676', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('677', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('678', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('679', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('680', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('681', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('682', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('683', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('684', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('685', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('686', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('687', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('688', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('689', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('690', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('691', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('692', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('693', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('694', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('695', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('696', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('697', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('698', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('699', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('700', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('701', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('702', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('703', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('704', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('705', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('706', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('707', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('708', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('709', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('710', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('711', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('712', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('713', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('714', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('715', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('716', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('717', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('718', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('719', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('720', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('721', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('722', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('723', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('724', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('725', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('726', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('727', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('728', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('729', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('730', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('731', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('732', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('733', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('734', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('735', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('736', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('737', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('738', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('739', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('740', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('741', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('742', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('743', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('744', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('745', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('746', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('747', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('748', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('749', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('750', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('751', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('752', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('753', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('754', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('755', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('756', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('757', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('758', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('759', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('760', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('761', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('762', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('763', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('764', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('765', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('766', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('767', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('768', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('769', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('770', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('771', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('772', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('773', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('774', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('775', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('776', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('777', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('778', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('779', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('780', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('781', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('782', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('783', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('784', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('785', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('786', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('787', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('788', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('789', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('790', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('791', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('792', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('793', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('794', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('795', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('796', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('797', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('798', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('799', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('800', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('801', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('802', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('803', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('804', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('805', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('806', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('807', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('808', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('809', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('810', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('811', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('812', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('813', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('814', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('815', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('816', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('817', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('818', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('819', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('820', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('821', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('822', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('823', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('824', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('825', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('826', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('827', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('828', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('829', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('830', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('831', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('832', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('833', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('834', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('835', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('836', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('837', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('838', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('839', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('840', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('841', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('842', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('843', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('844', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('845', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('846', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('847', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('848', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('849', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('850', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('851', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('852', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('853', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('854', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('855', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('856', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('857', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('858', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('859', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('860', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('861', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('862', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('863', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('864', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('865', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('866', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('867', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('868', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('869', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('870', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('871', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('872', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('873', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('874', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('875', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('876', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('877', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('878', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('879', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('880', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('881', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('882', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('883', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('884', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('885', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('886', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('887', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('888', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('889', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('890', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('891', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('892', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('893', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('894', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('895', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('896', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('897', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('898', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('899', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('900', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('901', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('902', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('903', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('904', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('905', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('906', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('907', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('908', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('909', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('910', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('911', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('912', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('913', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('914', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('915', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('916', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('917', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('918', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('919', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('920', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('921', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('922', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('923', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('924', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('925', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('926', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('927', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('928', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('929', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('930', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('931', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('932', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('933', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('934', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('935', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('936', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('937', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('938', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('939', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('940', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('941', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('942', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('943', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('944', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('945', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('946', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('947', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('948', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('949', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('950', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('951', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('952', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('953', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('954', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('955', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('956', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('957', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('958', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('959', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('960', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('961', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('962', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('963', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('964', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('965', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('966', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('967', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('968', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('969', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('970', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('971', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('972', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('973', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('974', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('975', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('976', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('977', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('978', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('979', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('980', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('981', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('982', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('983', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('984', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('985', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('986', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('987', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('988', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('989', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('990', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('991', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('992', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('993', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('994', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('995', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('996', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('997', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('998', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('999', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1000', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1001', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1002', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1003', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1004', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1005', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1006', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1007', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1008', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1009', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1010', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1011', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1012', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1013', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1014', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1015', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1016', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1017', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1018', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1019', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1020', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1021', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1022', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1023', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1024', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1025', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1026', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1027', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1028', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1029', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1030', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1031', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1032', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1033', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1034', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1035', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1036', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1037', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1038', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1039', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1040', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1041', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1042', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1043', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1044', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1045', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1046', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1047', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1048', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1049', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1050', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1051', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1052', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1053', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1054', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1055', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1056', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1057', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1058', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1059', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1060', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1061', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1062', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1063', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1064', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1065', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1066', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1067', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1068', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1069', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1070', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1071', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1072', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1073', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1074', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1075', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1076', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1077', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1078', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1079', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1080', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1081', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1082', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1083', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1084', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1085', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1086', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1087', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1088', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1089', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1090', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1091', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1092', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1093', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1094', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1095', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1096', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1097', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1098', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1099', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1100', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1101', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1102', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1103', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1104', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1105', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1106', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1107', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1108', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1109', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1110', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1111', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1112', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1113', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1114', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1115', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1116', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1117', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1118', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1119', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1120', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1121', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1122', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1123', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1124', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1125', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1126', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1127', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1128', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1129', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1130', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1131', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1132', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1133', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1134', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1135', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1136', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1137', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1138', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1139', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1140', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1141', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1142', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1143', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1144', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1145', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1146', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1147', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1148', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1149', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1150', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1151', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1152', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1153', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1154', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1155', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1156', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1157', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1158', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1159', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1160', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1161', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1162', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1163', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1164', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1165', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1166', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1167', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1168', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1169', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1170', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1171', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1172', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1173', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1174', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1175', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1176', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1177', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1178', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1179', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1180', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1181', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1182', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1183', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1184', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1185', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1186', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1187', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1188', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1189', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1190', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1191', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1192', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1193', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1194', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1195', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1196', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1197', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1198', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1199', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1200', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1201', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1202', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1203', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1204', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1205', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1206', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1207', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1208', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1209', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1210', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1211', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1212', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1213', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1214', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1215', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1216', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1217', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1218', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1219', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1220', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1221', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1222', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1223', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1224', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1225', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1226', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1227', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1228', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1229', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1230', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1231', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1232', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1233', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1234', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1235', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1236', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1237', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1238', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1239', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1240', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1241', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1242', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1243', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1244', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1245', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1246', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1247', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1248', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1249', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1250', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1251', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1252', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1253', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1254', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1255', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1256', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1257', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1258', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1259', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1260', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1261', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1262', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1263', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1264', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1265', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1266', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1267', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1268', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1269', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1270', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1271', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1272', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1273', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1274', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1275', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1276', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1277', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1278', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1279', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1280', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1281', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1282', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1283', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1284', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1285', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1286', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1287', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1288', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1289', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1290', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1291', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1292', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1293', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1294', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1295', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1296', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1297', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1298', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1299', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1300', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1301', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1302', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1303', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1304', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1305', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1306', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1307', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1308', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1309', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1310', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1311', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1312', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1313', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1314', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1315', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1316', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1317', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1318', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1319', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1320', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1321', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1322', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1323', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1324', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1325', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1326', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1327', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1328', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1329', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1330', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1331', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1332', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1333', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1334', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1335', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1336', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1337', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1338', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1339', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1340', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1341', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1342', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1343', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1344', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1345', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1346', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1347', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1348', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1349', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1350', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1351', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1352', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1353', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1354', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1355', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1356', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1357', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1358', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1359', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1360', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1361', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1362', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1363', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1364', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1365', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1366', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1367', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1368', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1369', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1370', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1371', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1372', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1373', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1374', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1375', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1376', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1377', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1378', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1379', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1380', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1381', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1382', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1383', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1384', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1385', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1386', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1387', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1388', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1389', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1390', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1391', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1392', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1393', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1394', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1395', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1396', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1397', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1398', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1399', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1400', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1401', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1402', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1403', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1404', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1405', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1406', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1407', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1408', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1409', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1410', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1411', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1412', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1413', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1414', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1415', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1416', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1417', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1418', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1419', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1420', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1421', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1422', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1423', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1424', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1425', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1426', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1427', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1428', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1429', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1430', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1431', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1432', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1433', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1434', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1435', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1436', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1437', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1438', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1439', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1440', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1441', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1442', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1443', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1444', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1445', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1446', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1447', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1448', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1449', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1450', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1451', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1452', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1453', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1454', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1455', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1456', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1457', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1458', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1459', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1460', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1461', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1462', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1463', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1464', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1465', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1466', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1467', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1468', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1469', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1470', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1471', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1472', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1473', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1474', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1475', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1476', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1477', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1478', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1479', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1480', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1481', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1482', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1483', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1484', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1485', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1486', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1487', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1488', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1489', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1490', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1491', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1492', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');
INSERT INTO `shop_article` VALUES ('1493', '这是文章标题', '       这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '1532090598');
INSERT INTO `shop_article` VALUES ('1494', '专家指导', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707087494427.jpg\" alt=\"\" border=\"0\">fsdfsdsdf<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1495', '精油的用法', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_1370708983747.jpg\" alt=\"\" border=\"0\">sdfsdfs<br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1496', '星座精油传奇', '<img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090214043.jpg\" alt=\"\" border=\"0\" /><br />', '', null, null, '1', null, '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1497', '美丽肌肤的标准', ' <img src=\"http://shop.tianziya.com/app/upload/editor/201306/09_13707090467669.jpg\" alt=\"\" border=\"0\"><br>', '', '', '', '1', '', '1', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1498', '购销我来了', ' <div>购销（direct purchase）：也称为“经销”，即由商家正式下订单采购，货款到帐期时，由商家支付给供应商。但在某些情况下，可要求供应商补一些损耗，或做一些退换货的安排，以降低风险。</div>\r\n<div>购销实销月结（consignment）：即由商家正式下订单采购，但采取按月的实际销售成本的百分10的误差，抽取订货单结算。商家的库存的风险较少，退换货容易，适用销量小、周转慢、风险较大，或采购人员较难把握的商品。库存损耗可与供应商协商负担比例。</div>', '', '', '', '1', '', '1', '0', '0', '838');
INSERT INTO `shop_article` VALUES ('1499', 'sdfsdfsd', 'sdfsdfsd', 'sdfsdf', '', 'sdfsdfs', '1', null, '0', '0', '0', '0');
INSERT INTO `shop_article` VALUES ('1500', '这是文章标题', ' 这是文章内容', '', '这是来源', '这是关键字', '1', '', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for `shop_article_cat`
-- ----------------------------
DROP TABLE IF EXISTS `shop_article_cat`;
CREATE TABLE `shop_article_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) NOT NULL DEFAULT '' COMMENT '分类名',
  `desc` text COMMENT '备注',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_article_cat
-- ----------------------------
INSERT INTO `shop_article_cat` VALUES ('1', '品牌物语', 'test');
INSERT INTO `shop_article_cat` VALUES ('2', '单肤test', 'sfsdfsds');
INSERT INTO `shop_article_cat` VALUES ('3', 'sdfsdsfd要sssd', '');
INSERT INTO `shop_article_cat` VALUES ('14', '单纯美肤test', null);
INSERT INTO `shop_article_cat` VALUES ('16', 'test', '');

-- ----------------------------
-- Table structure for `shop_attr`
-- ----------------------------
DROP TABLE IF EXISTS `shop_attr`;
CREATE TABLE `shop_attr` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `attr_group_id` int(20) NOT NULL DEFAULT '0' COMMENT '属性组',
  `value_type` tinyint(8) unsigned DEFAULT '1' COMMENT '属性类型|1-选项 2-文本',
  `attr_name` varchar(100) DEFAULT NULL COMMENT '属性名',
  `attr_value` text COMMENT '属性值',
  `order` tinyint(5) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`value_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_attr
-- ----------------------------
INSERT INTO `shop_attr` VALUES ('4', '3', '1', '颜色', '#ff0000,#ffff00,#00ff00,#0000ff,#ff00ff', '2');
INSERT INTO `shop_attr` VALUES ('5', '3', '2', '尺码', '70A,70B,70C,75A,75B,75C', '1');
INSERT INTO `shop_attr` VALUES ('7', '3', '1', 'sdfs', 'sdfsd', '1');

-- ----------------------------
-- Table structure for `shop_attr_group`
-- ----------------------------
DROP TABLE IF EXISTS `shop_attr_group`;
CREATE TABLE `shop_attr_group` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(60) NOT NULL DEFAULT '' COMMENT '分组名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_attr_group
-- ----------------------------
INSERT INTO `shop_attr_group` VALUES ('3', 'news', null);
INSERT INTO `shop_attr_group` VALUES ('4', 'test', 'test');

-- ----------------------------
-- Table structure for `shop_auth_admin`
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_admin`;
CREATE TABLE `shop_auth_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `notebook` text COMMENT '记事本',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态|0-禁止 1-开启',
  `is_super_admin` tinyint(1) DEFAULT '0' COMMENT '是否超级管理员',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登陆时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_auth_admin
-- ----------------------------
INSERT INTO `shop_auth_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '客户xxx下午说要下单', '1', '1', '1535794301');
INSERT INTO `shop_auth_admin` VALUES ('2', 'myadmin1', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '0', '1534870922');

-- ----------------------------
-- Table structure for `shop_auth_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_admin_role`;
CREATE TABLE `shop_auth_admin_role` (
  `admin_id` int(11) DEFAULT '0',
  `role_id` int(11) DEFAULT '0',
  UNIQUE KEY `admin_role` (`admin_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_auth_admin_role
-- ----------------------------
INSERT INTO `shop_auth_admin_role` VALUES ('2', '1');
INSERT INTO `shop_auth_admin_role` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `shop_auth_items`
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_items`;
CREATE TABLE `shop_auth_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '权限名称',
  `path` varchar(255) NOT NULL COMMENT '权限路径',
  `relation_path` varchar(255) DEFAULT NULL COMMENT '关联地址',
  `param` varchar(255) DEFAULT NULL COMMENT '参数',
  `menu_id` int(11) DEFAULT '0' COMMENT '菜单类型',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '权限描述',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态|0-禁用 1-开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of shop_auth_items
-- ----------------------------
INSERT INTO `shop_auth_items` VALUES ('1', '0', '后台首页', '/admin/Index/index', '/admin/Index/welcome,\r\n/admin/AuthAdmin/adminInfo,\r\n/admin/AuthAdmin/doEditAdminInfo,\r\n/admin/AuthAdmin/notebook,\r\n/admin/AuthAdmin/doEditNoteBook', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('2', '0', '网站设置', '/admin/Config/index', '/admin/Config/setConfig', '', '1', '', '1');
INSERT INTO `shop_auth_items` VALUES ('3', '2', '邮箱设置', '/admin/Config/setEmailConfig', '', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('4', '2', '积分规则', '/admin/Config/setRules', '', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('5', '0', '广告管理', '/admin/Ads/index', '', null, '1', '', '1');
INSERT INTO `shop_auth_items` VALUES ('6', '5', '新增', '/admin/Ads/add', '/admin/Ads/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('7', '5', '编辑', '/admin/Ads/edit', '/admin/Ads/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('8', '5', '删除', '/admin/Ads/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('9', '0', '导航管理', '/admin/Nav/index', '', '', '1', '', '1');
INSERT INTO `shop_auth_items` VALUES ('10', '9', '新增', '/admin/Nav/add', '/admin/Nav/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('11', '9', '编辑', '/admin/Nav/edit', '/admin/Nav/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('12', '9', '删除', '/admin/Nav/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('13', '0', '文章列表', '/admin/Article/index', '', null, '2', '', '1');
INSERT INTO `shop_auth_items` VALUES ('14', '13', '添加文章', '/admin/Article/add', '/admin/Article/doAdd', null, '2', '', '1');
INSERT INTO `shop_auth_items` VALUES ('15', '13', '编辑', '/admin/Article/edit', '/admin/Article/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('16', '13', '删除', '/admin/Article/del', '/admin/Article/batchDel', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('17', '0', '文章分类', '/admin/ArticleCat/index', '', null, '2', '', '1');
INSERT INTO `shop_auth_items` VALUES ('18', '17', '新增', '/admin/ArticleCat/add', '/admin/ArticleCat/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('19', '17', '编辑', '/admin/ArticleCat/edit', '/admin/ArticleCat/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('20', '17', '删除', '/admin/ArticleCat/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('21', '0', '商品列表', '/admin/Goods/index', '', null, '3', '', '1');
INSERT INTO `shop_auth_items` VALUES ('22', '21', '商品新增', '/admin/Goods/add', '/admin/Goods/doAdd', '', '3', '', '1');
INSERT INTO `shop_auth_items` VALUES ('23', '21', '编辑', '/admin/Goods/edit', '/admin/Goods/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('24', '21', '删除', '/admin/Goods/del', '/admin/Goods/batchDel', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('25', '0', '商品分类', '/admin/GoodsCat/index', '/admin/GoodsCat/getTree', '', '3', '', '1');
INSERT INTO `shop_auth_items` VALUES ('26', '25', '新增', '/admin/GoodsCat/add', '/admin/GoodsCat/doAdd', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('27', '25', '编辑', '/admin/GoodsCat/edit', '/admin/GoodsCat/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('28', '25', '删除', '/admin/GoodsCat/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('29', '0', '商品属性', '/admin/Attr/index', '', null, '3', '', '1');
INSERT INTO `shop_auth_items` VALUES ('30', '29', '新增', '/admin/Attr/add', '/admin/Attr/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('31', '29', '编辑', '/admin/Attr/edit', '/admin/Attr/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('32', '29', '删除', '/admin/Attr/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('33', '0', '属性分组', '/admin/AttrGroup/index', '', null, '3', '', '1');
INSERT INTO `shop_auth_items` VALUES ('34', '33', '新增', '/admin/AttrGroup/add', '/admin/AttrGroup/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('35', '33', '编辑', '/admin/AttrGroup/edit', '/admin/AttrGroup/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('36', '33', '删除', '/admin/AttrGroup/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('37', '0', '支付方式', '/admin/Payment/index', '', null, '3', '', '1');
INSERT INTO `shop_auth_items` VALUES ('38', '37', '新增', '/admin/Payment/add', '/admin/Payment/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('39', '37', '编辑', '/admin/Payment/edit', '/admin/Payment/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('40', '37', '删除', '/admin/Payment/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('41', '0', '配送方式', '/admin/Delivery/index', '', null, '3', '', '1');
INSERT INTO `shop_auth_items` VALUES ('42', '41', '新增', '/admin/Delivery/add', '/admin/Delivery/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('43', '41', '编辑', '/admin/Delivery/edit', '/admin/Delivery/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('44', '41', '删除', '/admin/Delivery/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('45', '0', '地区管理', '/admin/Area/index', '/admin/Area/getTree', '', '3', '', '1');
INSERT INTO `shop_auth_items` VALUES ('46', '45', '新增', '/admin/Area/add', '/admin/Area/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('47', '45', '编辑', '/admin/Area/edit', '/admin/Area/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('48', '45', '删除', '/admin/Area/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('49', '0', '订单列表', '/admin/Order/index', '', null, '4', '', '1');
INSERT INTO `shop_auth_items` VALUES ('50', '49', '订单处理', '/admin/Order/edit', '/admin/Order/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('51', '0', '会员管理', '/admin/Users/index', '', null, '5', '', '1');
INSERT INTO `shop_auth_items` VALUES ('52', '51', '新增', '/admin/Users/add', '/admin/Users/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('53', '51', '编辑', '/admin/Users/edit', '/admin/Users/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('54', '51', '改密码', '/admin/Users/modifyPassword', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('55', '51', '删除', '/admin/Users/del', '/admin/Users/batchDel', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('56', '0', '站内信息', '/admin/Message/index', '', '', '5', '', '1');
INSERT INTO `shop_auth_items` VALUES ('57', '56', '新增', '/admin/Message/add', '/admin/Message/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('58', '56', '编辑', '/admin/Message/edit', '/admin/Message/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('59', '56', '删除', '/admin/Message/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('60', '0', '管理员列表', '/admin/AuthAdmin/index', '', '', '6', '', '1');
INSERT INTO `shop_auth_items` VALUES ('61', '60', '新增', '/admin/AuthAdmin/add', '/admin/AuthAdmin/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('62', '60', '编辑', '/admin/AuthAdmin/edit', '/admin/AuthAdmin/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('63', '60', '改密码', '/admin/AuthAdmin/modifyPassword', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('64', '60', '删除', '/admin/AuthAdmin/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('65', '0', '角色管理', '/admin/AuthRole/index', '/admin/AuthRole/getTree', '', '6', '', '1');
INSERT INTO `shop_auth_items` VALUES ('66', '65', '新增', '/admin/AuthRole/add', '/admin/AuthRole/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('67', '65', '编辑', '/admin/AuthRole/edit', '/admin/AuthRole/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('68', '65', '删除', '/admin/AuthRole/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('69', '0', '权限管理', '/admin/AuthItems/index', '/admin/AuthItems/getTree', '', '6', '', '1');
INSERT INTO `shop_auth_items` VALUES ('70', '69', '新增', '/admin/AuthItems/add', '/admin/AuthItems/doAdd', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('71', '69', '编辑', '/admin/AuthItems/edit', '/admin/AuthItems/doEdit', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('72', '69', '删除', '/admin/AuthItems/del', '', null, null, '', '1');
INSERT INTO `shop_auth_items` VALUES ('73', '0', '数据列表', '/admin/Database/index', '', '', '7', '', '1');
INSERT INTO `shop_auth_items` VALUES ('74', '73', '备份', '/admin/Database/backup', '/admin/Database/doBackup', '', '7', '', '1');
INSERT INTO `shop_auth_items` VALUES ('75', '73', '执行SQL脚本', '/admin/Database/query', '/admin/Database/doQuery', '', '7', '', '1');
INSERT INTO `shop_auth_items` VALUES ('76', '73', '删除备份文件', '/admin/Database/del', '', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('77', '21', '积分商城', '/admin/Goods/index', '', '/isIntegral/1', '3', '', '1');
INSERT INTO `shop_auth_items` VALUES ('78', '49', '发货单列表', '/admin/Order/index', '', '/status/2', '4', '', '1');
INSERT INTO `shop_auth_items` VALUES ('79', '49', '退货单列表', '/admin/Order/index', '', '/status/4', '4', '', '1');
INSERT INTO `shop_auth_items` VALUES ('80', '51', '未审会员', '/admin/Users/index', '', '/checked/1', '5', '', '1');
INSERT INTO `shop_auth_items` VALUES ('81', '51', '已审会员', '/admin/Users/index', '', '/checked/2', '5', '', '1');
INSERT INTO `shop_auth_items` VALUES ('82', '51', '积分规则', '/admin/Config/index', '/admin/Config/setRules', '#tab=rules', '5', '', '1');
INSERT INTO `shop_auth_items` VALUES ('84', '0', '菜单管理', '/admin/AuthMenu/index', '', '', '6', '', '1');
INSERT INTO `shop_auth_items` VALUES ('85', '84', '新增', '/admin/AuthMenu/add', '/admin/AuthMenu/doAdd', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('86', '84', '编辑', '/admin/AuthMenu/edit', '/admin/AuthMenu/doEdit', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('87', '84', '删除', '/admin/AuthMenu/del', '', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('88', '0', '友情链接', '/admin/FriendLink/index', '', '', '1', '', '1');
INSERT INTO `shop_auth_items` VALUES ('89', '88', '新增', '/admin/FriendLink/add', '/admin/FriendLink/doAdd', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('90', '88', '编辑', '/admin/FriendLink/edit', '/admin/FriendLink/doEdit', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('91', '88', '删除', '/admin/FriendLink/del', '', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('92', '60', '个人设置', '/admin/AuthAdmin/adminInfo', '/admin/AuthAdmin/doEditAdminInfo', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('93', '0', '数据统计', '/admin/Statistics/index', '', '', '0', '', '1');
INSERT INTO `shop_auth_items` VALUES ('94', '93', '营业额走势', '/admin/Statistics/turnover', '', '', '8', '', '1');
INSERT INTO `shop_auth_items` VALUES ('95', '93', '用户数走势', '/admin/Statistics/users', '', '', '8', '', '1');
INSERT INTO `shop_auth_items` VALUES ('96', '93', '订单数走势', '/admin/Statistics/order', '', '', '8', '', '1');
INSERT INTO `shop_auth_items` VALUES ('97', '93', '访客数走势', '/admin/Statistics/visitor', '', '', '8', '', '1');

-- ----------------------------
-- Table structure for `shop_auth_menu`
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_menu`;
CREATE TABLE `shop_auth_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '菜单分类',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_auth_menu
-- ----------------------------
INSERT INTO `shop_auth_menu` VALUES ('1', '基本设置', '&#xe60b;', '1');
INSERT INTO `shop_auth_menu` VALUES ('2', '文章管理', '&#xe608;', '2');
INSERT INTO `shop_auth_menu` VALUES ('3', '商品管理', '&#xe604;', '3');
INSERT INTO `shop_auth_menu` VALUES ('4', '订单管理', '&#xe603;', '4');
INSERT INTO `shop_auth_menu` VALUES ('5', '会员管理', '&#xe606;', '5');
INSERT INTO `shop_auth_menu` VALUES ('6', '权限管理', '&#xe60a;', '7');
INSERT INTO `shop_auth_menu` VALUES ('7', '数据库管理', '&#xe600;', '7');
INSERT INTO `shop_auth_menu` VALUES ('8', '数据统计', '&#xe607;', '6');

-- ----------------------------
-- Table structure for `shop_auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_role`;
CREATE TABLE `shop_auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of shop_auth_role
-- ----------------------------
INSERT INTO `shop_auth_role` VALUES ('1', '普通管理员', '1', '');

-- ----------------------------
-- Table structure for `shop_auth_role_items`
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_role_items`;
CREATE TABLE `shop_auth_role_items` (
  `role_id` int(11) DEFAULT NULL,
  `items_id` int(11) DEFAULT NULL,
  UNIQUE KEY `role_items` (`role_id`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_auth_role_items
-- ----------------------------
INSERT INTO `shop_auth_role_items` VALUES ('1', '1');
INSERT INTO `shop_auth_role_items` VALUES ('1', '2');
INSERT INTO `shop_auth_role_items` VALUES ('1', '3');
INSERT INTO `shop_auth_role_items` VALUES ('1', '4');
INSERT INTO `shop_auth_role_items` VALUES ('1', '5');
INSERT INTO `shop_auth_role_items` VALUES ('1', '6');
INSERT INTO `shop_auth_role_items` VALUES ('1', '7');
INSERT INTO `shop_auth_role_items` VALUES ('1', '8');
INSERT INTO `shop_auth_role_items` VALUES ('1', '13');
INSERT INTO `shop_auth_role_items` VALUES ('1', '14');
INSERT INTO `shop_auth_role_items` VALUES ('1', '15');
INSERT INTO `shop_auth_role_items` VALUES ('1', '16');
INSERT INTO `shop_auth_role_items` VALUES ('1', '17');
INSERT INTO `shop_auth_role_items` VALUES ('1', '18');
INSERT INTO `shop_auth_role_items` VALUES ('1', '19');
INSERT INTO `shop_auth_role_items` VALUES ('1', '20');
INSERT INTO `shop_auth_role_items` VALUES ('1', '21');
INSERT INTO `shop_auth_role_items` VALUES ('1', '22');
INSERT INTO `shop_auth_role_items` VALUES ('1', '23');
INSERT INTO `shop_auth_role_items` VALUES ('1', '24');
INSERT INTO `shop_auth_role_items` VALUES ('1', '25');
INSERT INTO `shop_auth_role_items` VALUES ('1', '26');
INSERT INTO `shop_auth_role_items` VALUES ('1', '27');
INSERT INTO `shop_auth_role_items` VALUES ('1', '28');
INSERT INTO `shop_auth_role_items` VALUES ('1', '29');
INSERT INTO `shop_auth_role_items` VALUES ('1', '30');
INSERT INTO `shop_auth_role_items` VALUES ('1', '31');
INSERT INTO `shop_auth_role_items` VALUES ('1', '32');
INSERT INTO `shop_auth_role_items` VALUES ('1', '45');
INSERT INTO `shop_auth_role_items` VALUES ('1', '46');
INSERT INTO `shop_auth_role_items` VALUES ('1', '47');
INSERT INTO `shop_auth_role_items` VALUES ('1', '48');
INSERT INTO `shop_auth_role_items` VALUES ('1', '51');
INSERT INTO `shop_auth_role_items` VALUES ('1', '52');
INSERT INTO `shop_auth_role_items` VALUES ('1', '53');
INSERT INTO `shop_auth_role_items` VALUES ('1', '54');
INSERT INTO `shop_auth_role_items` VALUES ('1', '55');
INSERT INTO `shop_auth_role_items` VALUES ('1', '56');
INSERT INTO `shop_auth_role_items` VALUES ('1', '57');
INSERT INTO `shop_auth_role_items` VALUES ('1', '58');
INSERT INTO `shop_auth_role_items` VALUES ('1', '59');
INSERT INTO `shop_auth_role_items` VALUES ('1', '60');
INSERT INTO `shop_auth_role_items` VALUES ('1', '61');
INSERT INTO `shop_auth_role_items` VALUES ('1', '62');
INSERT INTO `shop_auth_role_items` VALUES ('1', '63');
INSERT INTO `shop_auth_role_items` VALUES ('1', '64');
INSERT INTO `shop_auth_role_items` VALUES ('1', '65');
INSERT INTO `shop_auth_role_items` VALUES ('1', '66');
INSERT INTO `shop_auth_role_items` VALUES ('1', '67');
INSERT INTO `shop_auth_role_items` VALUES ('1', '68');
INSERT INTO `shop_auth_role_items` VALUES ('1', '69');
INSERT INTO `shop_auth_role_items` VALUES ('1', '70');
INSERT INTO `shop_auth_role_items` VALUES ('1', '71');
INSERT INTO `shop_auth_role_items` VALUES ('1', '72');
INSERT INTO `shop_auth_role_items` VALUES ('1', '73');
INSERT INTO `shop_auth_role_items` VALUES ('1', '74');
INSERT INTO `shop_auth_role_items` VALUES ('1', '77');
INSERT INTO `shop_auth_role_items` VALUES ('1', '80');
INSERT INTO `shop_auth_role_items` VALUES ('1', '81');
INSERT INTO `shop_auth_role_items` VALUES ('1', '82');
INSERT INTO `shop_auth_role_items` VALUES ('1', '93');
INSERT INTO `shop_auth_role_items` VALUES ('1', '94');
INSERT INTO `shop_auth_role_items` VALUES ('1', '95');
INSERT INTO `shop_auth_role_items` VALUES ('1', '96');
INSERT INTO `shop_auth_role_items` VALUES ('1', '97');

-- ----------------------------
-- Table structure for `shop_config`
-- ----------------------------
DROP TABLE IF EXISTS `shop_config`;
CREATE TABLE `shop_config` (
  `id` int(11) NOT NULL DEFAULT '1',
  `web_name` varchar(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `order_prex` varchar(50) DEFAULT NULL,
  `can_comment` tinyint(1) DEFAULT NULL,
  `icp` varchar(100) DEFAULT NULL,
  `copyright` varchar(100) DEFAULT NULL,
  `bank` text,
  `api_user` varchar(100) DEFAULT '0',
  `api_pass` varchar(100) DEFAULT NULL,
  `smtp` tinyint(1) DEFAULT '1',
  `smtp_sender` varchar(50) DEFAULT NULL,
  `smtp_user` varchar(255) DEFAULT NULL,
  `smtp_pwd` varchar(255) DEFAULT NULL,
  `smtp_server` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(6) DEFAULT NULL,
  `rules` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_config
-- ----------------------------
INSERT INTO `shop_config` VALUES ('1', 'skdfsdsdsfsf', 'http://www.test.com', '5303588521@111.com', '123321332', 'sdfsdfssdfsdssdss', '1', '黔ICP备sdfss', '遵义依来德防水保温公司 copyRight © 2016', '<p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">开户名称：广州御德商务咨询有限公司</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">开 户 行：中国工商银行广州市环城支行</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">账&nbsp;&nbsp;&nbsp; 号：3602015209200693463</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">接受货币：人民币 （到账当天出票）</span></span></p><p>&nbsp;</p><hr /><p>&nbsp;</p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">个人汇款账号：（注意：只有以下账户是公司认可的个人对私账户）</span></span></p><p>&nbsp;</p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">中国建设银行&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">户名：覃兵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br /></span><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">开户行：建设银行广州市帝景大厦支行&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">账号：6227 0033 2753 0034 328&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p><p>&nbsp;</p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">中国农业银行</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">户名：覃兵</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">开户行：农业银行广州环市支行</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">账号：6228 4800 8220 8372 118</span></span></p><p>&nbsp;</p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">招商银行</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">户名：覃兵</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">开户行：招商银行广州世贸大厦支行</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">账号：6225 8812 0535 8947</span></span></p><p>&nbsp;</p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">中国工商银行&nbsp; </span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">户名：覃兵</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">开户行：中国工商银行广州友谊支行</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">卡号：6222 0236 0204 2570770</span></span></p><p>&nbsp;</p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">交通银行</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">户名：覃兵</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">开户行：交通银行广州市同福支行</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">账号：6222 6007 1000 7559 323</span></span></p><p>&nbsp;</p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">中国银行</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">户名：覃兵</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">开户行：中国银行广州昌岗路分理处</span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">账号：4776405 0188 089191 4 </span></span></p><p><span style=\"font-size:14px;\"><span style=\"font-size:14px;\">卡号：6013 8219 0003 8031 246</span></span></p>', '879905060103109788', '99billKeyForTest', '1', '1300hong@163.coms', '1300hong@163.com', '111111ssd', 'smtp.163.com', '250', '操作 获得积分数 说明 <div class=\"spctrl\"></div>\r\n　　日常操作： <div class=\"spctrl\"></div>\r\n　　新用户首次登陆 ＋20 完成帐户的激活 <div class=\"spctrl\"></div>\r\n　　每日登陆 ＋5 每日只在第一次登陆加分（可以分别登陆知道和百科） <div class=\"spctrl\"></div>\r\n　　回答： <div class=\"spctrl\"></div>\r\n　　提交回答 ＋2 每日最多可获得20分 <div class=\"spctrl\"></div>\r\n　　回答被采纳为最佳答案 ＋20＋悬赏分 回答被提问者采纳为最佳答案，或者通过投票被选为最佳答案，回答者可获得系统自动赠送的20分＋提问者设置的悬赏分 <div class=\"spctrl\"></div>\r\n　　减少处罚 <div class=\"spctrl\"></div>\r\n　　处理过期问题 ＋10 提问者对过期问题进行处理，包括采纳最佳答案和选择无满意答案，都可以获得系统返还的10分 <div class=\"spctrl\"></div>\r\n　　其他操作 <div class=\"spctrl\"></div>\r\n　　投票 ＋1 每日最多可获得20分 <div class=\"spctrl\"></div>\r\n　　奖励 <div class=\"spctrl\"></div>\r\n　　最佳答案受到大量好评 ＋50 最佳答案被评价的次数达到200次，若其中评其“好”的次数达到总次数的80%，系统给最佳回答者增加50分奖励积分。 <h3><a name=\"2_2\"></a>积分降低</h3>\r\n　　操作 降低积分数 说明<div class=\"spctrl\"></div>\r\n　　提问： <div class=\"spctrl\"></div>\r\n　　悬赏付出 －悬赏分 提问用户设置悬赏、追加悬赏，扣除相应积分。第一次设置悬赏分最少为5分，最多为100分或其积分上限（当积分不足100时），追加悬赏分最多为50分或其积分上限（当积分不足50分时），悬赏付出的分数将不会返还。 <div class=\"spctrl\"></div>\r\n　　匿名提问 －10 提问用户采用匿名方式提交问题，扣除10分悬赏 <div class=\"spctrl\"></div>\r\n　　处罚 <div class=\"spctrl\"></div>\r\n　　上线提问后被删除 －20 提问上线后，被管理员删除，扣除提问用户20分，答复者不扣 <div class=\"spctrl\"></div>\r\n　　上线回答后被删除 －10 回答上线后，被管理员删除，扣除回答用户10分 <div class=\"spctrl\"></div>\r\n　　上线评论后被删除 －5 评论上线后，被管理员删除，扣除评论用户5分 <div class=\"spctrl\"></div>\r\n　　问题15天内不处理 －20 问题到期，提问用户不作处理（不做最佳答案判断、不通过提高悬赏延长问题有效时间，不关闭问题，或不转入投票流程），扣除提问用户20分。 <div class=\"spctrl\"></div>\r\n　　作弊刷分—40(提问和回答者');

-- ----------------------------
-- Table structure for `shop_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `shop_delivery`;
CREATE TABLE `shop_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `delivery_name` varchar(300) NOT NULL COMMENT '配送方式名称',
  `first_price` double(20,0) NOT NULL DEFAULT '0' COMMENT '首件运费',
  `other_price` double(20,0) DEFAULT '0' COMMENT '加件运费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_delivery
-- ----------------------------
INSERT INTO `shop_delivery` VALUES ('1', '1', '快递-上海、杭州', '100', '2');
INSERT INTO `shop_delivery` VALUES ('2', '3', '快递-其他地方', '10', '2');
INSERT INTO `shop_delivery` VALUES ('3', '3', '快递-西藏', '10', '2');
INSERT INTO `shop_delivery` VALUES ('4', '4', '快递-香港', '10', '2');
INSERT INTO `shop_delivery` VALUES ('5', '5', '快递-台湾', '10', '2');
INSERT INTO `shop_delivery` VALUES ('6', '6', '快递-上海、杭州', '10', '2');
INSERT INTO `shop_delivery` VALUES ('7', '7', '快递-广州', '20', '10');

-- ----------------------------
-- Table structure for `shop_extend_cat`
-- ----------------------------
DROP TABLE IF EXISTS `shop_extend_cat`;
CREATE TABLE `shop_extend_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_extend_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_fav`
-- ----------------------------
DROP TABLE IF EXISTS `shop_fav`;
CREATE TABLE `shop_fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_fav
-- ----------------------------
INSERT INTO `shop_fav` VALUES ('5', '11', '14', '2010');

-- ----------------------------
-- Table structure for `shop_friend_link`
-- ----------------------------
DROP TABLE IF EXISTS `shop_friend_link`;
CREATE TABLE `shop_friend_link` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `show_order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_friend_link
-- ----------------------------
INSERT INTO `shop_friend_link` VALUES ('1', '淘宝', 'https://www.taobao.coms/sdfsld', '', '1');
INSERT INTO `shop_friend_link` VALUES ('2', '百度', 'http://www.baidu.com', '', '1');
INSERT INTO `shop_friend_link` VALUES ('4', 'sdfsdf', 'https://www.sss.com', '', '0');

-- ----------------------------
-- Table structure for `shop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `goods_cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类',
  `attr_group_id` int(11) DEFAULT NULL COMMENT '属性组',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商城价格',
  `reference_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '参考价格',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否上架|1-是 0-否',
  `is_integral` tinyint(1) unsigned DEFAULT '0' COMMENT '积分商城|1-是 0-否',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `required_integral` int(11) DEFAULT NULL COMMENT '所需积分',
  `feature` varchar(800) DEFAULT NULL COMMENT '商品特点',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `goods_desc` text NOT NULL COMMENT '商品描述',
  `content` text NOT NULL COMMENT '商品详情',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`goods_cat_id`),
  KEY `goods_number` (`goods_number`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods
-- ----------------------------
INSERT INTO `shop_goods` VALUES ('19', '天姿雅 桃花美白滋养睡眠面膜100g 补水美白 淡斑去黄 亮色修护', '100', '47', '3', '88.00', '90.00', '1', '0', '0', '0', '', '', '', 'sdfsd', '1370724574');
INSERT INTO `shop_goods` VALUES ('20', 'test', '1000', '37', '3', '100.00', '110.00', '1', '1', '0', '0', '', '', '', 'tesfsdfssfd', '1370728574');
INSERT INTO `shop_goods` VALUES ('21', 'test', '1000', '37', '3', '0.00', '0.00', '1', '0', '0', '0', '', '', '', 'test', '1370724574');
INSERT INTO `shop_goods` VALUES ('22', 'test', '1000', '37', '3', '0.00', '0.00', '1', '0', '0', '0', '', '', '', 'test', '1370774574');
INSERT INTO `shop_goods` VALUES ('23', 'test', '1000', '37', '3', '0.00', '0.00', '1', '0', '0', '0', '', '', '', 'test', '1370724574');
INSERT INTO `shop_goods` VALUES ('24', 'testsdfsd', '1000', '33', '3', '33.00', '333.00', '1', '0', '0', '0', '', '', '', 'sdfsdfsdsd', '1370784574');
INSERT INTO `shop_goods` VALUES ('25', 'testsdfsd', '1000', '33', '3', '33.00', '333.00', '1', '0', '0', '0', '', '', '', 'sdfsdfsdsd', '1370724574');
INSERT INTO `shop_goods` VALUES ('26', 'testsdfsd', '1000', '33', '3', '33.00', '333.00', '1', '0', '0', '0', '', '', '', 'sdfsdfsdsd', '1370728574');
INSERT INTO `shop_goods` VALUES ('29', 'sdfsgogogogogogo', '1000', '37', '3', '1000.00', '1000.00', '1', '0', '0', '0', 'sdfsdf', '', '', 'sdfsdafsdfsasdf', '1370724574');
INSERT INTO `shop_goods` VALUES ('30', '桃花美白滋养睡眠面膜100g 补水美白 淡斑去黄 亮色修护', '1000', '35', '3', '88.00', '110.00', '1', '0', '0', '0', '', '', '', 'sdfsdfsdfssddf', '1370729574');
INSERT INTO `shop_goods` VALUES ('31', '桃花美白滋养睡眠面膜100g', '1000', '41', '4', '100.00', '110.00', '1', '0', '0', '0', '', '', '', 'sdfsdfsddf', '1370724574');

-- ----------------------------
-- Table structure for `shop_goods_cat`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_cat`;
CREATE TABLE `shop_goods_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名',
  `remark` varchar(800) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_cat
-- ----------------------------
INSERT INTO `shop_goods_cat` VALUES ('32', '0', '按类型分', 'test');
INSERT INTO `shop_goods_cat` VALUES ('33', '32', '洁面/卸妆/去角质', '');
INSERT INTO `shop_goods_cat` VALUES ('34', '32', '爽肤水/柔肤水/精华水', '');
INSERT INTO `shop_goods_cat` VALUES ('35', '32', '乳液/精华', '');
INSERT INTO `shop_goods_cat` VALUES ('36', '32', '凝露/面霜', '');
INSERT INTO `shop_goods_cat` VALUES ('37', '36', 'BB霜/隔离', '');
INSERT INTO `shop_goods_cat` VALUES ('38', '36', '眼部护理', '');
INSERT INTO `shop_goods_cat` VALUES ('39', '36', '面膜', '');
INSERT INTO `shop_goods_cat` VALUES ('40', '36', '其他护理', '');
INSERT INTO `shop_goods_cat` VALUES ('41', '40', '按功效分', '');
INSERT INTO `shop_goods_cat` VALUES ('42', '40', '保湿补水', '');
INSERT INTO `shop_goods_cat` VALUES ('43', '40', '美白祛斑', '');
INSERT INTO `shop_goods_cat` VALUES ('44', '40', '紧致毛孔', '');
INSERT INTO `shop_goods_cat` VALUES ('45', '0', '祛痘消印', '');
INSERT INTO `shop_goods_cat` VALUES ('46', '45', '滋养皮肤', '');
INSERT INTO `shop_goods_cat` VALUES ('47', '45', '抗皱', '');
INSERT INTO `shop_goods_cat` VALUES ('48', '45', '抗过敏', '');
INSERT INTO `shop_goods_cat` VALUES ('49', '45', '控油', '');

-- ----------------------------
-- Table structure for `shop_goods_images`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_images`;
CREATE TABLE `shop_goods_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `goods_pic` varchar(255) DEFAULT NULL COMMENT '图片',
  `goods_thumb_pic` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `is_default` tinyint(4) DEFAULT '0' COMMENT '默认',
  `order` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_images
-- ----------------------------
INSERT INTO `shop_goods_images` VALUES ('7', '22', '/uploads/goods/201808/20180803101229_132.jpg', '/uploads/goods/201808/20180803101229_132_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('8', '22', '/uploads/goods/201808/20180803101233_868.jpg', '/uploads/goods/201808/20180803101229_132_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('9', '23', '/uploads/goods/201808/20180803101229_132.jpg', '/uploads/goods/201808/20180803101229_132_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('10', '23', '/uploads/goods/201808/20180803101233_868.jpg', '/uploads/goods/201808/20180803101233_868_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('11', '24', '/uploads/goods/201808/20180803105547_330.jpg', '/uploads/goods/201808/20180803105547_330_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('12', '24', '/uploads/goods/201808/20180803105549_188.jpg', '/uploads/goods/201808/20180803105549_188_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('13', '25', '/uploads/goods/201808/20180803105547_330.jpg', '/uploads/goods/201808/20180803105547_330_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('14', '25', '/uploads/goods/201808/20180803105549_188.jpg', '/uploads/goods/201808/20180803105549_188_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('15', '26', '/uploads/goods/201808/20180803105547_330.jpg', '/uploads/goods/201808/20180803105547_330_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('16', '26', '/uploads/goods/201808/20180803105549_188.jpg', '/uploads/goods/201808/20180803105549_188_jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('23', '20', '/uploads/goods/20180804/6b18efe2c9f606eccfe487bac1eddfba.png', '/uploads/goods/20180804/6b18efe2c9f606eccfe487bac1eddfba_thumb.png', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('24', '19', '/uploads/goods/20180819/90073a7637c08bc07ff3da84e248f2ce.jpg', '/uploads/goods/20180819/90073a7637c08bc07ff3da84e248f2ce_thumb.jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('25', '19', '/uploads/goods/20180819/904cba2c1b73133d718faeab326589f3.png', '/uploads/goods/20180819/904cba2c1b73133d718faeab326589f3_thumb.png', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('26', '19', '/uploads/goods/20180819/0b33afed7909d5a6c74ea32f13a80332.jpg', '/uploads/goods/20180819/0b33afed7909d5a6c74ea32f13a80332_thumb.jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('27', '19', '/uploads/goods/20180819/745cba6dcb6bb76ba03f094326d9aeae.jpg', '/uploads/goods/20180819/745cba6dcb6bb76ba03f094326d9aeae_thumb.jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('28', '19', '/uploads/goods/20180819/1d031e56608d70e8541749ef18116845.png', '/uploads/goods/20180819/1d031e56608d70e8541749ef18116845_thumb.png', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('29', '19', '/uploads/goods/20180819/bba72486ca9c0f55748cf51f33d806fe.jpg', '/uploads/goods/20180819/bba72486ca9c0f55748cf51f33d806fe_thumb.jpg', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('33', '20', '/uploads/goods/20180820/eb266dc55856052f7b96de6cb0e5ecae.png', '/uploads/goods/20180820/eb266dc55856052f7b96de6cb0e5ecae_thumb.png', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('37', '29', '/uploads/goods/20180820/0520ea49e51d324be953b7b58110c741.png', '/uploads/goods/20180820/0520ea49e51d324be953b7b58110c741_thumb.png', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('38', '31', '/uploads/goods/20180822/0c9913aa76738a051a84bd77f9493727.png', '/uploads/goods/20180822/0c9913aa76738a051a84bd77f9493727_thumb.png', '0', '0');
INSERT INTO `shop_goods_images` VALUES ('39', '31', '/uploads/goods/20180822/1d9a7be60dac8862ac4009135b981137.jpg', '/uploads/goods/20180822/1d9a7be60dac8862ac4009135b981137_thumb.jpg', '0', '0');

-- ----------------------------
-- Table structure for `shop_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `shop_keywords`;
CREATE TABLE `shop_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hits` int(11) NOT NULL,
  `key_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_keywords
-- ----------------------------
INSERT INTO `shop_keywords` VALUES ('1', '21', '内衣');
INSERT INTO `shop_keywords` VALUES ('2', '21', '裤国');
INSERT INTO `shop_keywords` VALUES ('3', '21', 'bb');
INSERT INTO `shop_keywords` VALUES ('4', '11', 't');

-- ----------------------------
-- Table structure for `shop_message`
-- ----------------------------
DROP TABLE IF EXISTS `shop_message`;
CREATE TABLE `shop_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态|0-未读 1-已读',
  `send_time` int(11) NOT NULL COMMENT '发送时间',
  `admin_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_message
-- ----------------------------
INSERT INTO `shop_message` VALUES ('1', '0', '测试', '测试', '1', '2010', '0');

-- ----------------------------
-- Table structure for `shop_nav`
-- ----------------------------
DROP TABLE IF EXISTS `shop_nav`;
CREATE TABLE `shop_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `nav_name` varchar(50) NOT NULL COMMENT '导航名称',
  `nav_url` varchar(255) NOT NULL COMMENT '导航地址',
  `is_blank` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新窗口|0-否 1-是',
  `tags` varchar(50) NOT NULL COMMENT '标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_nav
-- ----------------------------
INSERT INTO `shop_nav` VALUES ('1', '1', '文胸系列', 'goods-1.html', '0', 'top-xxs');
INSERT INTO `shop_nav` VALUES ('2', '2', '家居服', 'goods-2.html', '0', 'top');
INSERT INTO `shop_nav` VALUES ('3', '3', '泳衣', 'goods-3.html', '0', 'top');
INSERT INTO `shop_nav` VALUES ('4', '4', '保暖衣', 'goods-4.html', '0', 'top-gggg');
INSERT INTO `shop_nav` VALUES ('5', '5', '其他商品', 'goods-5.html', '0', 'top');
INSERT INTO `shop_nav` VALUES ('6', '6', '特价专区', 'goods-18.html', '0', 'top');

-- ----------------------------
-- Table structure for `shop_order`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` char(50) DEFAULT NULL COMMENT '订单号',
  `users_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `addr` varchar(200) NOT NULL DEFAULT '' COMMENT '发货地址',
  `tel` varchar(20) DEFAULT '' COMMENT '收件电话',
  `message` varchar(0) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态|1-未发货 2-发货中 3-已发货 4-退货',
  `trade_status` int(11) DEFAULT '0' COMMENT '交易状态|0-未完成 1-交易完成 2-交易关闭',
  `pay_status` int(11) DEFAULT '0' COMMENT '支付状态|0-未付款 1-已付款 2-退款',
  `tag` text,
  `delivery_type` tinyint(5) DEFAULT '0' COMMENT '地址',
  `pay_type` tinyint(2) DEFAULT '0' COMMENT '支付方式',
  `price` varchar(20) DEFAULT '' COMMENT '价格',
  `order_time` int(11) DEFAULT '0' COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO `shop_order` VALUES ('1', 'ftx_20100526025830', '2', 'sdfsdafa', '123456313', '', '2', '2', '2', null, '1', '1', '100', '0');
INSERT INTO `shop_order` VALUES ('2', 'ftx_20100526025833', '2', 'sdfsdafa', '123456313', '', '2', '0', '1', null, '1', '2', '100', '0');
INSERT INTO `shop_order` VALUES ('5', 'ftx_20100526025840', '2', 'sdfsdafa', '123456313', '', '1', '0', '0', null, '1', '2', '100', '0');
INSERT INTO `shop_order` VALUES ('6', 'ftx_20100526025843', '2', 'sdfsdafa', '123456313', '', '2', '0', '0', null, '1', '2', '100', '0');
INSERT INTO `shop_order` VALUES ('7', 'ftx_20100526025853', '2', 'sdfsdafa', '123456313', '', '2', '0', '0', null, '1', '3', '100', '0');
INSERT INTO `shop_order` VALUES ('21', 'ftx_20100526025821', '2', '', '1231333', null, '1', '1', '0', null, '1', '1', '100', '0');
INSERT INTO `shop_order` VALUES ('22', 'ftx_20100526025828', '2', 'sdfsdafa', '123456313', '', '1', '1', '0', null, '1', '1', '100', '0');
INSERT INTO `shop_order` VALUES ('30', 'ftx_20100526025863', '2', 'sdfsdafa', '123456313', '', '2', '0', '1', null, '1', '3', '100', '0');
INSERT INTO `shop_order` VALUES ('31', 'ftx_20100526025873', '2', 'sdfsdafa', '123456313', '', '2', '0', '0', null, '1', '1', '100', '0');
INSERT INTO `shop_order` VALUES ('32', 'ftx_20100526025872', '2', 'sdfsdafa', '123456313', '', '4', '0', '1', null, '1', '1', '100', '0');
INSERT INTO `shop_order` VALUES ('35', 'ftx_20100526035872', '2', 'sdfsdafa', '123456313', '', '4', '0', '0', null, '1', '1', '100', '0');
INSERT INTO `shop_order` VALUES ('36', 'ftx_20100526065872', '2', 'sdfsdafa', '123456313', '', '1', '0', '0', null, '1', '1', '100', '0');

-- ----------------------------
-- Table structure for `shop_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_goods`;
CREATE TABLE `shop_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_num` int(10) NOT NULL,
  `pay_price` varchar(20) NOT NULL,
  `reference_price` varchar(20) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_goods
-- ----------------------------
INSERT INTO `shop_order_goods` VALUES ('1', 'ftx_20100526025821', '19', '100', '100', '100', null, null);
INSERT INTO `shop_order_goods` VALUES ('7', 'ftx_20100526025828', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('8', 'ftx_20100526025828', '19', '1', '75.00', '90.00', '#ff0000', '70Asssd');
INSERT INTO `shop_order_goods` VALUES ('10', 'ftx_20100526025830', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('11', 'ftx_20100526025833', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('12', 'ftx_20100526025840', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('13', 'ftx_20100526025843', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('14', 'ftx_20100526025853', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('15', 'ftx_20100526025863', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('16', 'ftx_20100526025873', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('17', 'ftx_20100526025872', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('18', 'ftx_20100526035872', '19', '10', '75.00', '90.00', '#ffff00', '70B');
INSERT INTO `shop_order_goods` VALUES ('19', 'ftx_20100526065872', '19', '10', '75.00', '90.00', '#ffff00', '70B');

-- ----------------------------
-- Table structure for `shop_payment`
-- ----------------------------
DROP TABLE IF EXISTS `shop_payment`;
CREATE TABLE `shop_payment` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `fee` varchar(10) DEFAULT '0' COMMENT '费用',
  `desc` text COMMENT '描述',
  `checkcode` varchar(200) DEFAULT NULL COMMENT '安全校验码',
  `username` varchar(200) DEFAULT NULL COMMENT '商号',
  `password` varchar(200) DEFAULT NULL COMMENT '密钥',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用|0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_payment
-- ----------------------------
INSERT INTO `shop_payment` VALUES ('1', '银行汇款/转帐', '0', '银行名称', '4sd5f4s5f4s5d', 'ds4f5sd4f5sd45', 'sd4f5sd45dsf45', '0');
INSERT INTO `shop_payment` VALUES ('2', '余额支付', '0', '收款人信息：全称 ××× ；帐号或地址 ××× ；开户行 ×××。', '4sd5f4s5f4s5d', 'ds4f5sd4f5sd45', 'sd4f5sd45dsf45', '0');
INSERT INTO `shop_payment` VALUES ('3', '网银在线', '0', '注意事项：办理电汇时，请在电汇单“汇款用途”一栏处注明您的订单号。', '4sd5f4s5f4s5d', 'ds4f5sd4f5sd45', 'sd4f5sd45dsf45', '0');
INSERT INTO `shop_payment` VALUES ('4', '财付通中介担保接口', '0', '支付宝网站(www.alipay.com) 是国内先进的网上支付平台。<br/>ECShop联合支付宝推出优惠套餐：无预付/年费，单笔费率1.5%，无流量限制。<br/><a href=\"https://www.alipay.com/himalayas/practicality_profile_edit.htm?market_type=from_agent_contract&customer_external_id=C4335319945672464113\" target=\"_blank\"><font color=\"red\">立即在线申请</font></a>', '4sd5f4s5f4s5d', 'ds4f5sd4f5sd45', 'sd4f5sd45dsf45', '0');
INSERT INTO `shop_payment` VALUES ('5', '货到付款', '0', '使用帐户余额支付。只有会员才能使用，通过设置信用额度，可以透支。', '4sd5f4s5f4s5d', 'ds4f5sd4f5sd45', 'sd4f5sd45dsf45', '0');
INSERT INTO `shop_payment` VALUES ('6', 'paypal', '0', '网银在线与中国工商银行、招商银行、中国建设银行、农业银行、民生银行等数十家金融机构达成协议。全面支持全国19家银行的信用卡及借记卡实现网上支付。（网址：http://www.chinabank.com.cn）', '4sd5f4s5f4s5d', 'ds4f5sd4f5sd45', 'sd4f5sd45dsf45', '0');
INSERT INTO `shop_payment` VALUES ('7', '银行汇款/转帐', '0', '<b>财付通（www.tenpay.com） - 腾讯旗下在线支付平台，通过国家权威安全认证，支持各大银行网上支付，免支付手续费。</b><br /><a href=\"http://union.tenpay.com/mch/mch_register_b2c.shtml?sp_suggestuser=1202822001\" target=\"_blank\">立即免费申请：单笔费率1%</a><br /><a href=\"http://union.tenpay.com/mch/mch_register_b2c.shtml?sp_suggestuser=2289480\" target=\"_blank\">立即购买包量套餐：折算后单笔费率0.6-1%</a>', '4sd5f4s5f4s5d', 'dsdsdsds', '00000000000000', '0');
INSERT INTO `shop_payment` VALUES ('8', '支付宝', '10', '开通城市：×××', '0000000000000000000', '000', '111', '1');

-- ----------------------------
-- Table structure for `shop_pay_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_pay_log`;
CREATE TABLE `shop_pay_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_amount` decimal(10,2) unsigned NOT NULL,
  `order_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_pay_log
-- ----------------------------
INSERT INTO `shop_pay_log` VALUES ('1', '1', '272.00', '0', '0');

-- ----------------------------
-- Table structure for `shop_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `shop_statistics`;
CREATE TABLE `shop_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL COMMENT '年',
  `month` int(11) NOT NULL COMMENT '月',
  `day` int(11) NOT NULL,
  `users` int(11) NOT NULL COMMENT '用户数',
  `turnover` int(11) DEFAULT NULL COMMENT '营业额',
  `order` int(11) DEFAULT NULL COMMENT '订单数',
  `visitor` int(11) DEFAULT NULL COMMENT '访客数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `year_month_day` (`year`,`month`,`day`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_statistics
-- ----------------------------
INSERT INTO `shop_statistics` VALUES ('1', '2018', '7', '23', '224', '288', '1576', '39757');
INSERT INTO `shop_statistics` VALUES ('2', '2018', '7', '24', '676', '136', '1417', '13761');
INSERT INTO `shop_statistics` VALUES ('3', '2018', '7', '25', '723', '25', '2530', '22145');
INSERT INTO `shop_statistics` VALUES ('4', '2018', '7', '26', '350', '901', '3141', '80417');
INSERT INTO `shop_statistics` VALUES ('5', '2018', '7', '27', '663', '499', '6683', '64785');
INSERT INTO `shop_statistics` VALUES ('6', '2018', '7', '28', '535', '821', '8788', '89360');
INSERT INTO `shop_statistics` VALUES ('7', '2018', '7', '29', '536', '895', '5219', '80782');
INSERT INTO `shop_statistics` VALUES ('8', '2018', '7', '30', '304', '477', '553', '51414');
INSERT INTO `shop_statistics` VALUES ('9', '2018', '7', '31', '766', '212', '9107', '43591');
INSERT INTO `shop_statistics` VALUES ('10', '2018', '8', '1', '353', '52', '5725', '6738');
INSERT INTO `shop_statistics` VALUES ('11', '2018', '8', '2', '85', '825', '2878', '41957');
INSERT INTO `shop_statistics` VALUES ('12', '2018', '8', '3', '728', '601', '2237', '38573');
INSERT INTO `shop_statistics` VALUES ('13', '2018', '8', '4', '108', '891', '335', '62992');
INSERT INTO `shop_statistics` VALUES ('14', '2018', '8', '5', '715', '911', '5235', '24404');
INSERT INTO `shop_statistics` VALUES ('15', '2018', '8', '6', '808', '45', '518', '10420');
INSERT INTO `shop_statistics` VALUES ('16', '2018', '8', '7', '525', '106', '6173', '28447');
INSERT INTO `shop_statistics` VALUES ('17', '2018', '8', '8', '323', '528', '7194', '66349');
INSERT INTO `shop_statistics` VALUES ('18', '2018', '8', '9', '583', '292', '7299', '65522');
INSERT INTO `shop_statistics` VALUES ('19', '2018', '8', '10', '124', '18', '747', '84096');
INSERT INTO `shop_statistics` VALUES ('20', '2018', '8', '11', '621', '298', '2267', '71688');
INSERT INTO `shop_statistics` VALUES ('21', '2018', '8', '12', '196', '259', '3468', '89972');
INSERT INTO `shop_statistics` VALUES ('22', '2018', '8', '13', '178', '869', '1437', '97590');
INSERT INTO `shop_statistics` VALUES ('23', '2018', '8', '14', '915', '195', '801', '43472');
INSERT INTO `shop_statistics` VALUES ('24', '2018', '8', '15', '306', '696', '7182', '61591');
INSERT INTO `shop_statistics` VALUES ('25', '2018', '8', '16', '231', '438', '2794', '80293');
INSERT INTO `shop_statistics` VALUES ('26', '2018', '8', '17', '731', '9', '4581', '84389');
INSERT INTO `shop_statistics` VALUES ('27', '2018', '8', '18', '34', '532', '6849', '64263');
INSERT INTO `shop_statistics` VALUES ('28', '2018', '8', '19', '830', '911', '3595', '1703');
INSERT INTO `shop_statistics` VALUES ('29', '2018', '8', '20', '177', '705', '9158', '33938');
INSERT INTO `shop_statistics` VALUES ('30', '2018', '8', '21', '579', '60', '3153', '48841');
INSERT INTO `shop_statistics` VALUES ('31', '2018', '8', '22', '260', '394', '9222', '55192');
INSERT INTO `shop_statistics` VALUES ('32', '2018', '8', '23', '99', '640', '1678', '31428');
INSERT INTO `shop_statistics` VALUES ('33', '2018', '8', '24', '86', '446', '1172', '80538');
INSERT INTO `shop_statistics` VALUES ('34', '2018', '8', '25', '459', '574', '6493', '47943');
INSERT INTO `shop_statistics` VALUES ('35', '2018', '8', '26', '114', '334', '1220', '93376');
INSERT INTO `shop_statistics` VALUES ('36', '2018', '8', '27', '251', '481', '9498', '41343');
INSERT INTO `shop_statistics` VALUES ('37', '2018', '8', '28', '193', '866', '7518', '75954');
INSERT INTO `shop_statistics` VALUES ('38', '2018', '8', '29', '925', '67', '2479', '17720');
INSERT INTO `shop_statistics` VALUES ('39', '2018', '8', '30', '465', '170', '7281', '55029');
INSERT INTO `shop_statistics` VALUES ('40', '2018', '8', '31', '811', '895', '8636', '88631');
INSERT INTO `shop_statistics` VALUES ('41', '2018', '9', '1', '347', '980', '6917', '79464');
INSERT INTO `shop_statistics` VALUES ('42', '2018', '9', '2', '558', '341', '2740', '65942');
INSERT INTO `shop_statistics` VALUES ('43', '2018', '9', '3', '677', '395', '5932', '91770');
INSERT INTO `shop_statistics` VALUES ('44', '2018', '9', '4', '876', '543', '3311', '6060');
INSERT INTO `shop_statistics` VALUES ('45', '2018', '9', '5', '414', '83', '8192', '33260');
INSERT INTO `shop_statistics` VALUES ('46', '2018', '9', '6', '156', '67', '5088', '60852');
INSERT INTO `shop_statistics` VALUES ('47', '2018', '9', '7', '243', '237', '1588', '4558');
INSERT INTO `shop_statistics` VALUES ('48', '2018', '9', '8', '139', '22', '9309', '47203');
INSERT INTO `shop_statistics` VALUES ('49', '2018', '9', '9', '11', '623', '2666', '55528');
INSERT INTO `shop_statistics` VALUES ('50', '2018', '9', '10', '963', '540', '2147', '63657');
INSERT INTO `shop_statistics` VALUES ('51', '2018', '9', '11', '935', '807', '5543', '80857');
INSERT INTO `shop_statistics` VALUES ('52', '2018', '9', '12', '356', '884', '8682', '75737');
INSERT INTO `shop_statistics` VALUES ('53', '2018', '9', '13', '967', '687', '899', '11539');
INSERT INTO `shop_statistics` VALUES ('54', '2018', '9', '14', '756', '598', '7229', '98857');
INSERT INTO `shop_statistics` VALUES ('55', '2018', '9', '15', '836', '881', '341', '96457');
INSERT INTO `shop_statistics` VALUES ('56', '2018', '9', '16', '903', '964', '4366', '90324');
INSERT INTO `shop_statistics` VALUES ('57', '2018', '9', '17', '590', '702', '4585', '54913');
INSERT INTO `shop_statistics` VALUES ('58', '2018', '9', '18', '249', '672', '1857', '17585');
INSERT INTO `shop_statistics` VALUES ('59', '2018', '9', '19', '484', '739', '9835', '82791');
INSERT INTO `shop_statistics` VALUES ('60', '2018', '9', '20', '627', '852', '5853', '58972');
INSERT INTO `shop_statistics` VALUES ('61', '2018', '9', '21', '543', '674', '7041', '29228');
INSERT INTO `shop_statistics` VALUES ('62', '2018', '9', '22', '278', '427', '2808', '10570');
INSERT INTO `shop_statistics` VALUES ('63', '2018', '9', '23', '314', '314', '702', '20982');
INSERT INTO `shop_statistics` VALUES ('64', '2018', '9', '24', '284', '506', '1130', '86364');
INSERT INTO `shop_statistics` VALUES ('65', '2018', '9', '25', '215', '571', '4128', '44914');
INSERT INTO `shop_statistics` VALUES ('66', '2018', '9', '26', '249', '597', '6240', '72083');
INSERT INTO `shop_statistics` VALUES ('67', '2018', '9', '27', '342', '607', '5487', '95881');
INSERT INTO `shop_statistics` VALUES ('68', '2018', '9', '28', '464', '134', '5485', '99690');
INSERT INTO `shop_statistics` VALUES ('69', '2018', '9', '29', '809', '253', '2892', '7926');
INSERT INTO `shop_statistics` VALUES ('70', '2018', '9', '30', '682', '569', '1839', '98540');
INSERT INTO `shop_statistics` VALUES ('71', '2018', '10', '1', '883', '253', '1952', '16003');
INSERT INTO `shop_statistics` VALUES ('72', '2018', '10', '2', '761', '307', '236', '96526');
INSERT INTO `shop_statistics` VALUES ('73', '2018', '10', '3', '878', '435', '4144', '11959');
INSERT INTO `shop_statistics` VALUES ('74', '2018', '10', '4', '41', '38', '8395', '36833');
INSERT INTO `shop_statistics` VALUES ('75', '2018', '10', '5', '648', '388', '3271', '10379');
INSERT INTO `shop_statistics` VALUES ('76', '2018', '10', '6', '526', '875', '1006', '32843');
INSERT INTO `shop_statistics` VALUES ('77', '2018', '10', '7', '135', '389', '4067', '80495');
INSERT INTO `shop_statistics` VALUES ('78', '2018', '10', '8', '958', '590', '7904', '83889');
INSERT INTO `shop_statistics` VALUES ('79', '2018', '10', '9', '844', '985', '9980', '60001');
INSERT INTO `shop_statistics` VALUES ('80', '2018', '10', '10', '298', '22', '5653', '16867');
INSERT INTO `shop_statistics` VALUES ('81', '2018', '10', '11', '461', '979', '2872', '48793');
INSERT INTO `shop_statistics` VALUES ('82', '2018', '10', '12', '25', '127', '8553', '66084');
INSERT INTO `shop_statistics` VALUES ('83', '2018', '10', '13', '518', '182', '7637', '3503');
INSERT INTO `shop_statistics` VALUES ('84', '2018', '10', '14', '65', '863', '3624', '18334');
INSERT INTO `shop_statistics` VALUES ('85', '2018', '10', '15', '259', '768', '9873', '20905');
INSERT INTO `shop_statistics` VALUES ('86', '2018', '10', '16', '363', '778', '479', '19970');
INSERT INTO `shop_statistics` VALUES ('87', '2018', '10', '17', '765', '46', '7987', '5404');
INSERT INTO `shop_statistics` VALUES ('88', '2018', '10', '18', '74', '364', '2217', '52150');
INSERT INTO `shop_statistics` VALUES ('89', '2018', '10', '19', '348', '508', '94', '35867');
INSERT INTO `shop_statistics` VALUES ('90', '2018', '10', '20', '637', '864', '195', '14753');
INSERT INTO `shop_statistics` VALUES ('91', '2018', '10', '21', '54', '782', '1815', '10214');
INSERT INTO `shop_statistics` VALUES ('92', '2018', '10', '22', '649', '543', '2845', '89663');
INSERT INTO `shop_statistics` VALUES ('93', '2018', '10', '23', '317', '272', '1056', '66799');
INSERT INTO `shop_statistics` VALUES ('94', '2018', '10', '24', '58', '153', '8667', '81064');
INSERT INTO `shop_statistics` VALUES ('95', '2018', '10', '25', '204', '665', '8637', '26294');
INSERT INTO `shop_statistics` VALUES ('96', '2018', '10', '26', '38', '85', '7835', '37102');
INSERT INTO `shop_statistics` VALUES ('97', '2018', '10', '27', '596', '792', '7287', '22607');
INSERT INTO `shop_statistics` VALUES ('98', '2018', '10', '28', '659', '747', '3726', '70065');
INSERT INTO `shop_statistics` VALUES ('99', '2018', '10', '29', '534', '553', '8018', '17478');
INSERT INTO `shop_statistics` VALUES ('100', '2018', '10', '30', '104', '86', '714', '40639');
INSERT INTO `shop_statistics` VALUES ('101', '2018', '10', '31', '363', '176', '743', '40549');
INSERT INTO `shop_statistics` VALUES ('102', '2018', '11', '1', '334', '940', '2161', '52420');
INSERT INTO `shop_statistics` VALUES ('103', '2018', '11', '2', '609', '80', '7862', '63385');
INSERT INTO `shop_statistics` VALUES ('104', '2018', '11', '3', '171', '570', '48', '75562');
INSERT INTO `shop_statistics` VALUES ('105', '2018', '11', '4', '367', '733', '9807', '1699');
INSERT INTO `shop_statistics` VALUES ('106', '2018', '11', '5', '484', '353', '7167', '908');
INSERT INTO `shop_statistics` VALUES ('107', '2018', '11', '6', '907', '518', '1828', '167');
INSERT INTO `shop_statistics` VALUES ('108', '2018', '11', '7', '607', '253', '4071', '95978');
INSERT INTO `shop_statistics` VALUES ('109', '2018', '11', '8', '433', '480', '3653', '75510');
INSERT INTO `shop_statistics` VALUES ('110', '2018', '11', '9', '426', '580', '2793', '2596');
INSERT INTO `shop_statistics` VALUES ('111', '2018', '11', '10', '662', '65', '6588', '82245');
INSERT INTO `shop_statistics` VALUES ('112', '2018', '11', '11', '637', '663', '5781', '99445');
INSERT INTO `shop_statistics` VALUES ('113', '2018', '11', '12', '401', '559', '114', '87399');
INSERT INTO `shop_statistics` VALUES ('114', '2018', '11', '13', '912', '727', '8821', '81651');
INSERT INTO `shop_statistics` VALUES ('115', '2018', '11', '14', '252', '65', '8172', '84824');
INSERT INTO `shop_statistics` VALUES ('116', '2018', '11', '15', '323', '224', '8080', '74462');
INSERT INTO `shop_statistics` VALUES ('117', '2018', '11', '16', '707', '173', '4997', '12418');
INSERT INTO `shop_statistics` VALUES ('118', '2018', '11', '17', '755', '778', '1491', '41191');
INSERT INTO `shop_statistics` VALUES ('119', '2018', '11', '18', '844', '807', '2343', '47646');
INSERT INTO `shop_statistics` VALUES ('120', '2018', '11', '19', '474', '811', '4709', '86386');
INSERT INTO `shop_statistics` VALUES ('121', '2018', '11', '20', '376', '481', '7379', '28119');
INSERT INTO `shop_statistics` VALUES ('122', '2018', '11', '21', '215', '620', '977', '45294');
INSERT INTO `shop_statistics` VALUES ('123', '2018', '11', '22', '687', '914', '3012', '108');
INSERT INTO `shop_statistics` VALUES ('124', '2018', '11', '23', '146', '109', '7447', '84083');
INSERT INTO `shop_statistics` VALUES ('125', '2018', '11', '24', '288', '244', '9641', '3416');
INSERT INTO `shop_statistics` VALUES ('126', '2018', '11', '25', '31', '113', '4451', '86391');
INSERT INTO `shop_statistics` VALUES ('127', '2018', '11', '26', '920', '678', '3404', '38872');
INSERT INTO `shop_statistics` VALUES ('128', '2018', '11', '27', '494', '810', '2525', '85900');
INSERT INTO `shop_statistics` VALUES ('129', '2018', '11', '28', '298', '989', '1402', '49903');
INSERT INTO `shop_statistics` VALUES ('130', '2018', '11', '29', '613', '237', '9510', '29316');
INSERT INTO `shop_statistics` VALUES ('131', '2018', '11', '30', '158', '252', '2932', '28792');
INSERT INTO `shop_statistics` VALUES ('132', '2018', '12', '1', '366', '38', '1287', '64082');
INSERT INTO `shop_statistics` VALUES ('133', '2018', '12', '2', '288', '93', '6740', '30285');
INSERT INTO `shop_statistics` VALUES ('134', '2018', '12', '3', '212', '119', '1667', '12399');
INSERT INTO `shop_statistics` VALUES ('135', '2018', '12', '4', '799', '506', '5117', '28632');
INSERT INTO `shop_statistics` VALUES ('136', '2018', '12', '5', '322', '763', '1453', '60701');
INSERT INTO `shop_statistics` VALUES ('137', '2018', '12', '6', '755', '285', '1060', '36199');
INSERT INTO `shop_statistics` VALUES ('138', '2018', '12', '7', '525', '57', '6542', '67019');
INSERT INTO `shop_statistics` VALUES ('139', '2018', '12', '8', '314', '946', '9572', '66752');
INSERT INTO `shop_statistics` VALUES ('140', '2018', '12', '9', '984', '86', '3083', '26478');
INSERT INTO `shop_statistics` VALUES ('141', '2018', '12', '10', '185', '981', '5666', '38151');
INSERT INTO `shop_statistics` VALUES ('142', '2018', '12', '11', '108', '732', '5045', '89586');
INSERT INTO `shop_statistics` VALUES ('143', '2018', '12', '12', '245', '16', '1821', '55393');
INSERT INTO `shop_statistics` VALUES ('144', '2018', '12', '13', '781', '326', '1609', '53117');
INSERT INTO `shop_statistics` VALUES ('145', '2018', '12', '14', '614', '266', '8922', '13040');
INSERT INTO `shop_statistics` VALUES ('146', '2018', '12', '15', '328', '546', '7996', '62917');
INSERT INTO `shop_statistics` VALUES ('147', '2018', '12', '16', '497', '757', '2967', '47611');
INSERT INTO `shop_statistics` VALUES ('148', '2018', '12', '17', '843', '604', '7399', '1917');
INSERT INTO `shop_statistics` VALUES ('149', '2018', '12', '18', '589', '307', '3997', '68472');
INSERT INTO `shop_statistics` VALUES ('150', '2018', '12', '19', '47', '903', '5806', '27645');
INSERT INTO `shop_statistics` VALUES ('151', '2018', '12', '20', '920', '762', '8294', '69690');
INSERT INTO `shop_statistics` VALUES ('152', '2018', '12', '21', '96', '989', '2280', '69722');
INSERT INTO `shop_statistics` VALUES ('153', '2018', '12', '22', '262', '120', '8267', '57631');
INSERT INTO `shop_statistics` VALUES ('154', '2018', '12', '23', '669', '626', '2055', '15828');
INSERT INTO `shop_statistics` VALUES ('155', '2018', '12', '24', '388', '501', '6334', '22447');
INSERT INTO `shop_statistics` VALUES ('156', '2018', '12', '25', '113', '373', '2426', '68954');
INSERT INTO `shop_statistics` VALUES ('157', '2018', '12', '26', '682', '641', '3742', '71671');
INSERT INTO `shop_statistics` VALUES ('158', '2018', '12', '27', '549', '954', '9922', '46292');
INSERT INTO `shop_statistics` VALUES ('159', '2018', '12', '28', '718', '822', '1598', '80278');
INSERT INTO `shop_statistics` VALUES ('160', '2018', '12', '29', '813', '387', '5000', '6617');
INSERT INTO `shop_statistics` VALUES ('161', '2018', '12', '30', '511', '327', '6415', '17167');
INSERT INTO `shop_statistics` VALUES ('162', '2018', '12', '31', '953', '846', '3289', '33474');
INSERT INTO `shop_statistics` VALUES ('163', '2019', '1', '1', '353', '961', '5582', '45134');
INSERT INTO `shop_statistics` VALUES ('164', '2019', '1', '2', '340', '800', '1408', '1339');
INSERT INTO `shop_statistics` VALUES ('165', '2019', '1', '3', '446', '514', '7291', '98470');
INSERT INTO `shop_statistics` VALUES ('166', '2019', '1', '4', '473', '721', '4476', '18350');
INSERT INTO `shop_statistics` VALUES ('167', '2019', '1', '5', '547', '606', '9853', '35367');
INSERT INTO `shop_statistics` VALUES ('168', '2019', '1', '6', '993', '485', '4188', '49843');
INSERT INTO `shop_statistics` VALUES ('169', '2019', '1', '7', '813', '60', '6691', '76274');
INSERT INTO `shop_statistics` VALUES ('170', '2019', '1', '8', '907', '997', '974', '25245');
INSERT INTO `shop_statistics` VALUES ('171', '2019', '1', '9', '959', '655', '7028', '29300');
INSERT INTO `shop_statistics` VALUES ('172', '2019', '1', '10', '459', '843', '3054', '89473');
INSERT INTO `shop_statistics` VALUES ('173', '2019', '1', '11', '362', '35', '8795', '82374');
INSERT INTO `shop_statistics` VALUES ('174', '2019', '1', '12', '757', '327', '72', '29756');
INSERT INTO `shop_statistics` VALUES ('175', '2019', '1', '13', '934', '992', '6503', '92478');
INSERT INTO `shop_statistics` VALUES ('176', '2019', '1', '14', '481', '69', '4232', '28770');
INSERT INTO `shop_statistics` VALUES ('177', '2019', '1', '15', '136', '92', '504', '3373');
INSERT INTO `shop_statistics` VALUES ('178', '2019', '1', '16', '97', '147', '2852', '4774');
INSERT INTO `shop_statistics` VALUES ('179', '2019', '1', '17', '803', '987', '3397', '25516');
INSERT INTO `shop_statistics` VALUES ('180', '2019', '1', '18', '832', '644', '1498', '18645');
INSERT INTO `shop_statistics` VALUES ('181', '2019', '1', '19', '681', '29', '101', '43240');
INSERT INTO `shop_statistics` VALUES ('182', '2019', '1', '20', '361', '16', '7290', '28780');
INSERT INTO `shop_statistics` VALUES ('183', '2019', '1', '21', '16', '379', '2125', '48375');
INSERT INTO `shop_statistics` VALUES ('184', '2019', '1', '22', '452', '635', '7705', '57471');
INSERT INTO `shop_statistics` VALUES ('185', '2019', '1', '23', '729', '820', '6075', '81444');
INSERT INTO `shop_statistics` VALUES ('186', '2019', '1', '24', '967', '892', '8612', '76643');
INSERT INTO `shop_statistics` VALUES ('187', '2019', '1', '25', '880', '201', '215', '70827');
INSERT INTO `shop_statistics` VALUES ('188', '2019', '1', '26', '846', '170', '8938', '52168');
INSERT INTO `shop_statistics` VALUES ('189', '2019', '1', '27', '206', '903', '9531', '55311');
INSERT INTO `shop_statistics` VALUES ('190', '2019', '1', '28', '919', '682', '8399', '92529');
INSERT INTO `shop_statistics` VALUES ('191', '2019', '1', '29', '69', '52', '4090', '50754');
INSERT INTO `shop_statistics` VALUES ('192', '2019', '1', '30', '689', '179', '822', '41236');
INSERT INTO `shop_statistics` VALUES ('193', '2019', '1', '31', '999', '689', '2268', '96421');
INSERT INTO `shop_statistics` VALUES ('194', '2019', '2', '1', '584', '88', '7307', '45895');
INSERT INTO `shop_statistics` VALUES ('195', '2019', '2', '2', '294', '751', '1672', '13195');
INSERT INTO `shop_statistics` VALUES ('196', '2019', '2', '3', '922', '61', '6527', '11947');
INSERT INTO `shop_statistics` VALUES ('197', '2019', '2', '4', '964', '606', '6716', '88120');
INSERT INTO `shop_statistics` VALUES ('198', '2019', '2', '5', '294', '511', '8065', '34801');
INSERT INTO `shop_statistics` VALUES ('199', '2019', '2', '6', '567', '216', '8546', '24926');
INSERT INTO `shop_statistics` VALUES ('200', '2019', '2', '7', '399', '936', '6606', '39240');
INSERT INTO `shop_statistics` VALUES ('201', '2019', '2', '8', '628', '886', '3566', '20482');
INSERT INTO `shop_statistics` VALUES ('202', '2019', '2', '9', '974', '87', '6628', '26132');
INSERT INTO `shop_statistics` VALUES ('203', '2019', '2', '10', '839', '829', '3923', '75817');
INSERT INTO `shop_statistics` VALUES ('204', '2019', '2', '11', '890', '45', '8767', '85179');
INSERT INTO `shop_statistics` VALUES ('205', '2019', '2', '12', '653', '548', '7330', '93640');
INSERT INTO `shop_statistics` VALUES ('206', '2019', '2', '13', '68', '539', '2844', '62172');
INSERT INTO `shop_statistics` VALUES ('207', '2019', '2', '14', '756', '139', '8700', '14802');
INSERT INTO `shop_statistics` VALUES ('208', '2019', '2', '15', '83', '531', '5394', '69825');
INSERT INTO `shop_statistics` VALUES ('209', '2019', '2', '16', '422', '895', '9021', '39046');
INSERT INTO `shop_statistics` VALUES ('210', '2019', '2', '17', '982', '565', '6508', '81876');
INSERT INTO `shop_statistics` VALUES ('211', '2019', '2', '18', '399', '43', '5769', '28275');
INSERT INTO `shop_statistics` VALUES ('212', '2019', '2', '19', '95', '454', '1345', '73559');
INSERT INTO `shop_statistics` VALUES ('213', '2019', '2', '20', '10', '867', '6720', '6052');
INSERT INTO `shop_statistics` VALUES ('214', '2019', '2', '21', '411', '955', '6813', '16002');
INSERT INTO `shop_statistics` VALUES ('215', '2019', '2', '22', '102', '551', '3070', '16810');
INSERT INTO `shop_statistics` VALUES ('216', '2019', '2', '23', '90', '845', '8654', '49788');
INSERT INTO `shop_statistics` VALUES ('217', '2019', '2', '24', '743', '767', '8874', '72182');
INSERT INTO `shop_statistics` VALUES ('218', '2019', '2', '25', '338', '538', '5406', '72508');
INSERT INTO `shop_statistics` VALUES ('219', '2019', '2', '26', '584', '118', '78', '66613');
INSERT INTO `shop_statistics` VALUES ('220', '2019', '2', '27', '574', '141', '4017', '57089');
INSERT INTO `shop_statistics` VALUES ('221', '2019', '2', '28', '16', '74', '6304', '41293');
INSERT INTO `shop_statistics` VALUES ('222', '2019', '3', '1', '37', '312', '5720', '12245');
INSERT INTO `shop_statistics` VALUES ('223', '2019', '3', '2', '863', '878', '2895', '94272');
INSERT INTO `shop_statistics` VALUES ('224', '2019', '3', '3', '726', '155', '4406', '46401');
INSERT INTO `shop_statistics` VALUES ('225', '2019', '3', '4', '922', '328', '1858', '25358');
INSERT INTO `shop_statistics` VALUES ('226', '2019', '3', '5', '867', '725', '9777', '44522');
INSERT INTO `shop_statistics` VALUES ('227', '2019', '3', '6', '844', '984', '1113', '41199');
INSERT INTO `shop_statistics` VALUES ('228', '2019', '3', '7', '133', '512', '9819', '13278');
INSERT INTO `shop_statistics` VALUES ('229', '2019', '3', '8', '589', '612', '5447', '61289');
INSERT INTO `shop_statistics` VALUES ('230', '2019', '3', '9', '924', '117', '7344', '78484');
INSERT INTO `shop_statistics` VALUES ('231', '2019', '3', '10', '994', '24', '7276', '71718');
INSERT INTO `shop_statistics` VALUES ('232', '2019', '3', '11', '185', '168', '1812', '9915');
INSERT INTO `shop_statistics` VALUES ('233', '2019', '3', '12', '500', '366', '3517', '36011');
INSERT INTO `shop_statistics` VALUES ('234', '2019', '3', '13', '99', '329', '8044', '93233');
INSERT INTO `shop_statistics` VALUES ('235', '2019', '3', '14', '320', '915', '3443', '43876');
INSERT INTO `shop_statistics` VALUES ('236', '2019', '3', '15', '432', '326', '5706', '1153');
INSERT INTO `shop_statistics` VALUES ('237', '2019', '3', '16', '938', '115', '6234', '86045');
INSERT INTO `shop_statistics` VALUES ('238', '2019', '3', '17', '238', '358', '6453', '22462');
INSERT INTO `shop_statistics` VALUES ('239', '2019', '3', '18', '386', '373', '9408', '55748');
INSERT INTO `shop_statistics` VALUES ('240', '2019', '3', '19', '544', '122', '6556', '3504');
INSERT INTO `shop_statistics` VALUES ('241', '2019', '3', '20', '492', '7', '3942', '57743');
INSERT INTO `shop_statistics` VALUES ('242', '2019', '3', '21', '342', '198', '5098', '64865');
INSERT INTO `shop_statistics` VALUES ('243', '2019', '3', '22', '121', '853', '874', '53893');
INSERT INTO `shop_statistics` VALUES ('244', '2019', '3', '23', '186', '657', '5495', '11677');
INSERT INTO `shop_statistics` VALUES ('245', '2019', '3', '24', '774', '173', '9763', '215');
INSERT INTO `shop_statistics` VALUES ('246', '2019', '3', '25', '534', '621', '2258', '90931');
INSERT INTO `shop_statistics` VALUES ('247', '2019', '3', '26', '994', '167', '4668', '53330');
INSERT INTO `shop_statistics` VALUES ('248', '2019', '3', '27', '294', '122', '5674', '77358');
INSERT INTO `shop_statistics` VALUES ('249', '2019', '3', '28', '136', '961', '3510', '46353');
INSERT INTO `shop_statistics` VALUES ('250', '2019', '3', '29', '166', '860', '1121', '27118');
INSERT INTO `shop_statistics` VALUES ('251', '2019', '3', '30', '716', '199', '8091', '89112');
INSERT INTO `shop_statistics` VALUES ('252', '2019', '3', '31', '856', '359', '78', '62575');
INSERT INTO `shop_statistics` VALUES ('253', '2019', '4', '1', '535', '983', '6269', '6011');
INSERT INTO `shop_statistics` VALUES ('254', '2019', '4', '2', '608', '852', '9685', '59792');
INSERT INTO `shop_statistics` VALUES ('255', '2019', '4', '3', '27', '435', '1312', '30484');
INSERT INTO `shop_statistics` VALUES ('256', '2019', '4', '4', '561', '698', '784', '68439');
INSERT INTO `shop_statistics` VALUES ('257', '2019', '4', '5', '661', '428', '1479', '81608');
INSERT INTO `shop_statistics` VALUES ('258', '2019', '4', '6', '294', '259', '872', '101');
INSERT INTO `shop_statistics` VALUES ('259', '2019', '4', '7', '462', '895', '8912', '31121');
INSERT INTO `shop_statistics` VALUES ('260', '2019', '4', '8', '260', '898', '9360', '78342');
INSERT INTO `shop_statistics` VALUES ('261', '2019', '4', '9', '883', '563', '8426', '48570');
INSERT INTO `shop_statistics` VALUES ('262', '2019', '4', '10', '420', '811', '836', '43185');
INSERT INTO `shop_statistics` VALUES ('263', '2019', '4', '11', '253', '214', '7357', '80180');
INSERT INTO `shop_statistics` VALUES ('264', '2019', '4', '12', '912', '813', '4862', '56849');
INSERT INTO `shop_statistics` VALUES ('265', '2019', '4', '13', '248', '633', '3846', '52872');
INSERT INTO `shop_statistics` VALUES ('266', '2019', '4', '14', '893', '471', '5287', '34787');
INSERT INTO `shop_statistics` VALUES ('267', '2019', '4', '15', '372', '420', '6581', '61915');
INSERT INTO `shop_statistics` VALUES ('268', '2019', '4', '16', '324', '594', '4026', '19899');
INSERT INTO `shop_statistics` VALUES ('269', '2019', '4', '17', '164', '245', '6837', '57049');
INSERT INTO `shop_statistics` VALUES ('270', '2019', '4', '18', '64', '766', '23', '30125');
INSERT INTO `shop_statistics` VALUES ('271', '2019', '4', '19', '980', '737', '1030', '88956');
INSERT INTO `shop_statistics` VALUES ('272', '2019', '4', '20', '554', '588', '4580', '79069');
INSERT INTO `shop_statistics` VALUES ('273', '2019', '4', '21', '228', '842', '3194', '11253');
INSERT INTO `shop_statistics` VALUES ('274', '2019', '4', '22', '318', '847', '4594', '67763');
INSERT INTO `shop_statistics` VALUES ('275', '2019', '4', '23', '273', '117', '2968', '58391');
INSERT INTO `shop_statistics` VALUES ('276', '2019', '4', '24', '713', '698', '7819', '86646');
INSERT INTO `shop_statistics` VALUES ('277', '2019', '4', '25', '943', '466', '4369', '99753');
INSERT INTO `shop_statistics` VALUES ('278', '2019', '4', '26', '239', '438', '2988', '21104');
INSERT INTO `shop_statistics` VALUES ('279', '2019', '4', '27', '182', '401', '1006', '72446');
INSERT INTO `shop_statistics` VALUES ('280', '2019', '4', '28', '989', '558', '5152', '20940');
INSERT INTO `shop_statistics` VALUES ('281', '2019', '4', '29', '405', '834', '3209', '71068');
INSERT INTO `shop_statistics` VALUES ('282', '2019', '4', '30', '684', '779', '3883', '94675');
INSERT INTO `shop_statistics` VALUES ('283', '2019', '5', '1', '897', '684', '5307', '60636');
INSERT INTO `shop_statistics` VALUES ('284', '2019', '5', '2', '388', '313', '4728', '32487');
INSERT INTO `shop_statistics` VALUES ('285', '2019', '5', '3', '779', '909', '3224', '904');
INSERT INTO `shop_statistics` VALUES ('286', '2019', '5', '4', '353', '620', '2191', '52136');
INSERT INTO `shop_statistics` VALUES ('287', '2019', '5', '5', '29', '319', '2458', '906');
INSERT INTO `shop_statistics` VALUES ('288', '2019', '5', '6', '877', '760', '2174', '27458');
INSERT INTO `shop_statistics` VALUES ('289', '2019', '5', '7', '597', '537', '9843', '27425');
INSERT INTO `shop_statistics` VALUES ('290', '2019', '5', '8', '323', '373', '2210', '21258');
INSERT INTO `shop_statistics` VALUES ('291', '2019', '5', '9', '65', '751', '8180', '43806');
INSERT INTO `shop_statistics` VALUES ('292', '2019', '5', '10', '71', '291', '7620', '83937');
INSERT INTO `shop_statistics` VALUES ('293', '2019', '5', '11', '206', '84', '8474', '54557');
INSERT INTO `shop_statistics` VALUES ('294', '2019', '5', '12', '706', '67', '669', '72353');
INSERT INTO `shop_statistics` VALUES ('295', '2019', '5', '13', '390', '312', '7316', '25954');
INSERT INTO `shop_statistics` VALUES ('296', '2019', '5', '14', '80', '948', '5331', '66427');
INSERT INTO `shop_statistics` VALUES ('297', '2019', '5', '15', '490', '517', '9376', '80122');
INSERT INTO `shop_statistics` VALUES ('298', '2019', '5', '16', '890', '159', '138', '94458');
INSERT INTO `shop_statistics` VALUES ('299', '2019', '5', '17', '909', '831', '3826', '97040');
INSERT INTO `shop_statistics` VALUES ('300', '2019', '5', '18', '129', '145', '8098', '32002');

-- ----------------------------
-- Table structure for `shop_users`
-- ----------------------------
DROP TABLE IF EXISTS `shop_users`;
CREATE TABLE `shop_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(100) DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别|1-男 2-女',
  `tel` varchar(15) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `consumed` float(100,0) DEFAULT '0' COMMENT '已消费',
  `integral` int(10) DEFAULT '0' COMMENT '积分',
  `checked` tinyint(1) DEFAULT '1' COMMENT '审核状态|1-未审 2-已审',
  `addr` text COMMENT '地址',
  `zip` varchar(10) DEFAULT '' COMMENT '邮编',
  `birdthday` varchar(20) DEFAULT '' COMMENT '生日',
  `qq` varchar(20) DEFAULT '' COMMENT 'QQ',
  `msn` varchar(20) DEFAULT NULL COMMENT 'MSN',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_users
-- ----------------------------
INSERT INTO `shop_users` VALUES ('2', 'hong', '52c69e3a57331081823331c4e69d3f2e', 'testssss', '2', '13005623609', '381887126@qq.com', '0', '50', '2', '', '', '', '', '', '0');
INSERT INTO `shop_users` VALUES ('3', 'toto', '435a605868a16e60edb277742291913a', 'honghong', '2', '13005623609', '1300hong@15221.com', '0', '10', '1', '412sdsd', null, null, null, null, '0');
INSERT INTO `shop_users` VALUES ('7', 'orang', '21232f297a57a5a743894a0e4a801fc3', '这个是我的呢称', '1', '', '1300hong0@163.com', '0', '0', '1', 'dsdsf', null, null, null, null, '0');
INSERT INTO `shop_users` VALUES ('8', 'bang', 'c60364ea7654560b136fee807c85f102', 'hongadmin', '1', '', 'hongadmin', '0', '0', '1', '', null, null, null, null, '0');
INSERT INTO `shop_users` VALUES ('10', 'pen', 'd423f8f1efdf274efdb290b91359ec3b', 'aking', '1', '123456', 'caihuajun@gmail.com', '0', '0', '1', '广州市天河区中山大道中38号加悦大厦317', '0', '', '', '', '0');
INSERT INTO `shop_users` VALUES ('11', 'gddfgdf', 'e10adc3949ba59abbe56e057f20f883e', '洪四方0000', '2', '1213212', '1300hong@163.com', null, '0', '2', '121212', '52400000', '2010-05-06', '23221', '1212', '0');
INSERT INTO `shop_users` VALUES ('13', 'ppppp', 'f63f4fbc9f8c85d409f2f59f2b9e12d5', '', '1', '', '', '0', '100', '1', '', '', '', '', '', '0');

-- ----------------------------
-- Table structure for `shop_vote`
-- ----------------------------
DROP TABLE IF EXISTS `shop_vote`;
CREATE TABLE `shop_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品',
  `uid` int(11) NOT NULL COMMENT '用户',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `addtime` int(11) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_vote
-- ----------------------------
INSERT INTO `shop_vote` VALUES ('1', '11', '11', 'dsffddsfds', '2010');
INSERT INTO `shop_vote` VALUES ('2', '11', '11', '这个是评论内容', '2010');
INSERT INTO `shop_vote` VALUES ('3', '14', '11', 'sfadsdsdf', '2010');
