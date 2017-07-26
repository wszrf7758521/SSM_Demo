/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : secondhandtradingnetwork

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-07-26 10:07:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT '0',
  `goods_name` varchar(16) NOT NULL,
  `goods_price` double(12,2) DEFAULT NULL,
  `img_address` varchar(50) DEFAULT NULL,
  `goods_status` int(1) NOT NULL DEFAULT '0',
  `goods_desc` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goods_id`),
  KEY `FK_ID` (`user_id`),
  CONSTRAINT `FK_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', '0', '达到', '222.00', null, '0', '大苏打', '2017-07-12 16:54:05');
INSERT INTO `goods` VALUES ('2', '2', '0', '刀子', '333.00', 'daozi.png', '0', '很好', '2017-07-12 17:03:32');
INSERT INTO `goods` VALUES ('4', '2', '0', '斧子', '222.00', 'futou.png', '0', 'dfsd', '2017-07-17 16:07:49');
INSERT INTO `goods` VALUES ('6', '1', '0', '大砍刀', '132.00', '7405939b62a73f28846533de08db3a80_b.jpg', '0', '阿斯顿', '2017-07-20 10:26:17');
INSERT INTO `goods` VALUES ('7', '1', '0', '三星S8', '5000.23', 'futou.png', '0', '国行S8', '2017-07-21 10:11:08');
INSERT INTO `goods` VALUES ('13', '1', '0', 'vbcv', '213.00', 'futou.png', '0', 'asda', '2017-07-21 10:20:14');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小王', '123456');
INSERT INTO `user` VALUES ('2', '小赵', '123456');
