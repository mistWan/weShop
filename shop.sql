/*
Navicat MySQL Data Transfer

Source Server         : shop
Source Server Version : 100138
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 100138
File Encoding         : 65001

Date: 2019-08-11 14:48:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `user_id` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', 'Anna', '17882783788', '浙江省', '汉中市', '中国', '江干区下沙街道', '1', '2019-07-30 20:27:02', '2019-07-30 20:27:02');
INSERT INTO `address` VALUES ('4', 'Anna', '17882783738', '浙江省', '杭州市', '中国', '萧山区下沙街道', '1', '2019-07-30 20:38:33', '2019-07-30 20:38:33');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '首页置顶', '首页轮播图', '2019-07-21 00:22:43', '2019-07-21 00:22:43');

-- ----------------------------
-- Table structure for banner_item
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型。0，无导向；1：导向商品;2:导向专题',
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES ('1', '65', '6', '1', '1', '2019-07-21 00:22:43', '2019-07-21 00:22:43');
INSERT INTO `banner_item` VALUES ('2', '2', '25', '1', '1', '2019-07-21 00:22:43', '2019-07-21 00:22:43');
INSERT INTO `banner_item` VALUES ('3', '3', '11', '1', '1', '2019-07-21 00:22:43', '2019-07-21 00:22:43');
INSERT INTO `banner_item` VALUES ('5', '1', '10', '1', '1', '2019-07-21 00:22:43', '2019-07-21 00:22:43');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `image_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', '果味', '6', null, '2019-07-21 00:22:43', '2019-07-21 00:22:43');
INSERT INTO `category` VALUES ('3', '蔬菜', '5', null, '2019-07-21 00:22:43', '2019-07-21 00:22:43');
INSERT INTO `category` VALUES ('4', '炒货', '7', null, '2019-07-21 00:22:43', '2019-07-21 00:22:43');
INSERT INTO `category` VALUES ('5', '点心', '4', null, '2019-07-21 00:22:43', '2019-07-21 00:22:43');
INSERT INTO `category` VALUES ('6', '粗茶', '8', null, '2019-07-21 00:22:43', '2019-07-21 00:22:43');
INSERT INTO `category` VALUES ('7', '淡饭', '9', null, '2019-07-21 00:22:43', '2019-07-21 00:22:43');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '/banner-1a.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('2', '/banner-2a.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('3', '/banner-3a.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('4', '/category-cake.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('5', '/category-vg.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('6', '/category-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('7', '/category-fry-a.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('8', '/category-tea.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('9', '/category-rice.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('10', '/product-dryfruit@1.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('13', '/product-vg@1.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('14', '/product-rice@6.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('16', '/1@theme.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('17', '/2@theme.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('18', '/3@theme.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('19', '/detail-1@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('20', '/detail-2@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('21', '/detail-3@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('22', '/detail-4@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('23', '/detail-5@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('24', '/detail-6@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('25', '/detail-7@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('26', '/detail-8@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('27', '/detail-9@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('28', '/detail-11@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('29', '/detail-10@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('31', '/product-rice@1.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('32', '/product-tea@1.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('33', '/product-dryfruit@2.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('36', '/product-dryfruit@3.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('37', '/product-dryfruit@4.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('38', '/product-dryfruit@5.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('39', '/product-dryfruit-a@6.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('40', '/product-dryfruit@7.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('41', '/product-rice@2.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('42', '/product-rice@3.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('43', '/product-rice@4.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('44', '/product-fry@1.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('45', '/product-fry@2.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('46', '/product-fry@3.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('47', '/product-tea@2.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('48', '/product-tea@3.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('49', '/1@theme-head.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('50', '/2@theme-head.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('51', '/3@theme-head.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('52', '/product-cake@1.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('53', '/product-cake@2.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('54', '/product-cake-a@3.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('55', '/product-cake-a@4.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('56', '/product-dryfruit@8.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('57', '/product-fry@4.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('58', '/product-fry@5.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('59', '/product-rice@5.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('60', '/product-rice@7.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('62', '/detail-12@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('63', '/detail-13@1-dryfruit.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('65', '/banner-4a.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('66', '/product-vg@4.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('67', '/product-vg@5.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('68', '/product-vg@2.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');
INSERT INTO `image` VALUES ('69', '/product-vg@3.png', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `address_id` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('16', '15651895634358', '1', '0.02', '1', '2', '1', null, '2019-08-07 22:52:43', '2019-08-07 22:52:43');
INSERT INTO `order` VALUES ('17', '15651896956525', '1', '0.14', '2', '14', '1', null, '2019-08-07 22:54:55', '2019-08-07 22:54:55');
INSERT INTO `order` VALUES ('19', '15654097065535', '1', '0.16', '2', '16', '1', null, '2019-08-10 12:01:46', '2019-08-10 12:01:46');
INSERT INTO `order` VALUES ('20', '15654102701195', '1', '0.07', '2', '7', '1', null, '2019-08-10 12:11:10', '2019-08-10 12:11:10');
INSERT INTO `order` VALUES ('21', '15654103362836', '1', '0.56', '2', '56', '1', null, '2019-08-10 12:12:16', '2019-08-10 12:12:16');
INSERT INTO `order` VALUES ('22', '15654181006607', '1', '0.07', '2', '7', '1', null, '2019-08-10 14:21:40', '2019-08-10 14:21:40');
INSERT INTO `order` VALUES ('23', '15654407171408', '1', '0.23', '2', '23', '1', null, '2019-08-10 20:38:37', '2019-08-10 20:38:37');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `user_id` int(11) unsigned NOT NULL,
  `count` int(11) NOT NULL COMMENT '商品数量',
  `status` tinyint(4) DEFAULT NULL COMMENT '0 加入购物车；1 订单；2 已购买；',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`product_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('1', null, '1', '1', '2', '-1', '2019-08-02 10:02:33', '2019-08-02 10:02:33');
INSERT INTO `order_product` VALUES ('3', null, '1', '2', '2', '0', '2019-08-02 11:14:24', '2019-08-02 11:14:24');
INSERT INTO `order_product` VALUES ('5', '23', '5', '1', '6', '2', '2019-08-02 14:02:12', '2019-08-02 14:02:12');
INSERT INTO `order_product` VALUES ('6', '23', '6', '1', '8', '2', '2019-08-02 15:03:10', '2019-08-02 15:03:10');
INSERT INTO `order_product` VALUES ('7', '21', '7', '1', '56', '2', '2019-08-02 15:03:32', '2019-08-02 15:03:32');
INSERT INTO `order_product` VALUES ('8', '20', '8', '1', '7', '2', '2019-08-02 15:04:27', '2019-08-02 15:04:27');
INSERT INTO `order_product` VALUES ('9', '19', '4', '1', '7', '2', '2019-08-03 13:43:45', '2019-08-03 13:43:45');
INSERT INTO `order_product` VALUES ('14', '19', '33', '1', '9', '2', '2019-08-03 16:11:47', '2019-08-03 16:11:47');
INSERT INTO `order_product` VALUES ('15', '17', '10', '1', '5', '2', '2019-08-07 20:43:44', '2019-08-07 20:43:44');
INSERT INTO `order_product` VALUES ('16', '17', '22', '1', '9', '2', '2019-08-07 21:13:23', '2019-08-07 21:13:23');
INSERT INTO `order_product` VALUES ('17', '16', '3', '1', '2', '1', '2019-08-07 22:13:22', '2019-08-07 22:13:22');
INSERT INTO `order_product` VALUES ('18', '23', '7', '1', '3', '2', '2019-08-10 12:21:27', '2019-08-10 12:21:27');
INSERT INTO `order_product` VALUES ('19', '23', '33', '1', '1', '2', '2019-08-10 12:22:45', '2019-08-10 12:22:45');
INSERT INTO `order_product` VALUES ('20', '23', '1', '1', '1', '2', '2019-08-10 12:27:57', '2019-08-10 12:27:57');
INSERT INTO `order_product` VALUES ('21', '22', '2', '1', '3', '2', '2019-08-10 12:29:35', '2019-08-10 12:29:35');
INSERT INTO `order_product` VALUES ('22', '22', '3', '1', '3', '2', '2019-08-10 12:32:04', '2019-08-10 12:32:04');
INSERT INTO `order_product` VALUES ('23', '22', '10', '1', '1', '2', '2019-08-10 14:21:33', '2019-08-10 14:21:33');
INSERT INTO `order_product` VALUES ('24', '23', '3', '1', '3', '2', '2019-08-10 14:24:12', '2019-08-10 14:24:12');
INSERT INTO `order_product` VALUES ('25', '23', '4', '1', '1', '2', '2019-08-10 20:38:31', '2019-08-10 20:38:31');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '商品名称',
  `price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `category_id` int(11) DEFAULT NULL,
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `image_id` int(11) DEFAULT NULL COMMENT '图片外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '芹菜 半斤', '0.01', '998', '3', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '13');
INSERT INTO `product` VALUES ('2', '梨花带雨 3个', '0.01', '984', '2', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '10');
INSERT INTO `product` VALUES ('3', '素米 327克', '0.01', '996', '7', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '31');
INSERT INTO `product` VALUES ('4', '红袖枸杞 6克*3袋', '0.01', '998', '6', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '32');
INSERT INTO `product` VALUES ('5', '春生龙眼 500克', '0.01', '995', '2', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '33');
INSERT INTO `product` VALUES ('6', '小红的猪耳朵 120克', '0.01', '997', '5', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '53');
INSERT INTO `product` VALUES ('7', '泥蒿 半斤', '0.01', '998', '3', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '68');
INSERT INTO `product` VALUES ('8', '夏日芒果 3个', '0.01', '995', '2', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '36');
INSERT INTO `product` VALUES ('9', '冬木红枣 500克', '0.01', '996', '2', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '37');
INSERT INTO `product` VALUES ('10', '万紫千凤梨 300克', '0.01', '996', '2', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '38');
INSERT INTO `product` VALUES ('11', '贵妃笑 100克', '0.01', '994', '2', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '39');
INSERT INTO `product` VALUES ('12', '珍奇异果 3个', '0.01', '999', '2', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '40');
INSERT INTO `product` VALUES ('13', '绿豆 125克', '0.01', '999', '7', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '41');
INSERT INTO `product` VALUES ('14', '芝麻 50克', '0.01', '999', '7', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '42');
INSERT INTO `product` VALUES ('15', '猴头菇 370克', '0.01', '999', '7', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '43');
INSERT INTO `product` VALUES ('16', '西红柿 1斤', '0.01', '999', '3', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '69');
INSERT INTO `product` VALUES ('17', '油炸花生 300克', '0.01', '999', '4', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '44');
INSERT INTO `product` VALUES ('18', '春泥西瓜子 128克', '0.01', '997', '4', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '45');
INSERT INTO `product` VALUES ('19', '碧水葵花籽 128克', '0.01', '999', '4', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '46');
INSERT INTO `product` VALUES ('20', '碧螺春 12克*3袋', '0.01', '999', '6', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '47');
INSERT INTO `product` VALUES ('21', '西湖龙井 8克*3袋', '0.01', '998', '6', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '48');
INSERT INTO `product` VALUES ('22', '梅兰清花糕 1个', '0.01', '997', '5', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '54');
INSERT INTO `product` VALUES ('23', '清凉薄荷糕 1个', '0.01', '998', '5', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '55');
INSERT INTO `product` VALUES ('25', '小明的妙脆角 120克', '0.01', '999', '5', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '52');
INSERT INTO `product` VALUES ('26', '红衣青瓜 混搭160克', '0.01', '999', '2', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '56');
INSERT INTO `product` VALUES ('27', '锈色瓜子 100克', '0.01', '998', '4', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '57');
INSERT INTO `product` VALUES ('28', '春泥花生 200克', '0.01', '999', '4', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '58');
INSERT INTO `product` VALUES ('29', '冰心鸡蛋 2个', '0.01', '999', '7', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '59');
INSERT INTO `product` VALUES ('30', '八宝莲子 200克', '0.01', '999', '7', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '14');
INSERT INTO `product` VALUES ('31', '深涧木耳 78克', '0.01', '999', '7', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '60');
INSERT INTO `product` VALUES ('32', '土豆 半斤', '0.01', '999', '3', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '66');
INSERT INTO `product` VALUES ('33', '青椒 半斤', '0.01', '999', '3', '1', '2019-07-21 00:22:44', '2019-07-21 00:22:44', null, '67');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('4', '19', '1', '11');
INSERT INTO `product_image` VALUES ('5', '20', '2', '11');
INSERT INTO `product_image` VALUES ('6', '21', '3', '11');
INSERT INTO `product_image` VALUES ('7', '22', '4', '11');
INSERT INTO `product_image` VALUES ('8', '23', '5', '11');
INSERT INTO `product_image` VALUES ('9', '24', '6', '11');
INSERT INTO `product_image` VALUES ('10', '25', '7', '11');
INSERT INTO `product_image` VALUES ('11', '26', '8', '11');
INSERT INTO `product_image` VALUES ('12', '27', '9', '11');
INSERT INTO `product_image` VALUES ('13', '28', '11', '11');
INSERT INTO `product_image` VALUES ('14', '29', '10', '11');
INSERT INTO `product_image` VALUES ('18', '62', '12', '11');
INSERT INTO `product_image` VALUES ('19', '63', '13', '11');

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_property
-- ----------------------------
INSERT INTO `product_property` VALUES ('1', '品名', '杨梅', '11', '2019-07-21 00:22:45', '2019-07-21 00:22:45');
INSERT INTO `product_property` VALUES ('2', '口味', '青梅味 雪梨味 黄桃味 菠萝味', '11', '2019-07-21 00:22:45', '2019-07-21 00:22:45');
INSERT INTO `product_property` VALUES ('3', '产地', '火星', '11', '2019-07-21 00:22:45', '2019-07-21 00:22:45');
INSERT INTO `product_property` VALUES ('4', '保质期', '180天', '11', '2019-07-21 00:22:45', '2019-07-21 00:22:45');
INSERT INTO `product_property` VALUES ('5', '品名', '梨子', '2', '2019-07-21 00:22:45', '2019-07-21 00:22:45');
INSERT INTO `product_property` VALUES ('6', '产地', '金星', '2', '2019-07-21 00:22:45', '2019-07-21 00:22:45');
INSERT INTO `product_property` VALUES ('7', '净含量', '100g', '2', '2019-07-21 00:22:45', '2019-07-21 00:22:45');
INSERT INTO `product_property` VALUES ('8', '保质期', '10天', '2', '2019-07-21 00:22:45', '2019-07-21 00:22:45');

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '专题名称',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `theme_image_id` int(11) NOT NULL COMMENT '主题图，外键',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `head_image_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='主题信息表';

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES ('1', '专题栏位一', '美味水果世界', '16', '2019-07-21 00:22:45', '49', '2019-07-21 00:22:45');
INSERT INTO `theme` VALUES ('2', '专题栏位二', '新品推荐', '17', '2019-07-21 00:22:45', '50', '2019-07-21 00:22:45');
INSERT INTO `theme` VALUES ('3', '专题栏位三', '做个干物女', '18', '2019-07-21 00:22:45', '18', '2019-07-21 00:22:45');

-- ----------------------------
-- Table structure for theme_product
-- ----------------------------
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

-- ----------------------------
-- Records of theme_product
-- ----------------------------
INSERT INTO `theme_product` VALUES ('1', '2');
INSERT INTO `theme_product` VALUES ('1', '5');
INSERT INTO `theme_product` VALUES ('1', '8');
INSERT INTO `theme_product` VALUES ('1', '10');
INSERT INTO `theme_product` VALUES ('1', '12');
INSERT INTO `theme_product` VALUES ('2', '1');
INSERT INTO `theme_product` VALUES ('2', '2');
INSERT INTO `theme_product` VALUES ('2', '3');
INSERT INTO `theme_product` VALUES ('2', '5');
INSERT INTO `theme_product` VALUES ('2', '6');
INSERT INTO `theme_product` VALUES ('2', '16');
INSERT INTO `theme_product` VALUES ('2', '33');
INSERT INTO `theme_product` VALUES ('3', '15');
INSERT INTO `theme_product` VALUES ('3', '18');
INSERT INTO `theme_product` VALUES ('3', '19');
INSERT INTO `theme_product` VALUES ('3', '27');
INSERT INTO `theme_product` VALUES ('3', '30');
INSERT INTO `theme_product` VALUES ('3', '31');

-- ----------------------------
-- Table structure for third_app
-- ----------------------------
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='访问API的各应用账号密码表';

-- ----------------------------
-- Records of third_app
-- ----------------------------
INSERT INTO `third_app` VALUES ('1', 'starcraft', '777*777', 'CMS', '32', 'Super', '2019-07-21 00:22:45', '2019-07-21 00:22:45');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'o2FiW5JG7GQ7ooar8Q15wCjskh5Q3M', null, null, '2019-07-30 19:51:03', '2019-07-30 19:51:03');
INSERT INTO `user` VALUES ('2', 'gdfkljdgaskrio843o873hosdhnbugo9f', null, null, '2019-08-02 11:13:44', '2019-08-02 11:13:44');
