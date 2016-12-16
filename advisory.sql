/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost
 Source Database       : advisory

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : utf-8

 Date: 12/16/2016 22:06:27 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `meet_advisory`
-- ----------------------------
DROP TABLE IF EXISTS `meet_advisory`;
CREATE TABLE `meet_advisory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `workplace` varchar(64) NOT NULL,
  `job` varchar(64) NOT NULL,
  `job_type` varchar(25) NOT NULL,
  `area` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `money` varchar(25) NOT NULL,
  `money_from` varchar(25) NOT NULL,
  `info` varchar(64) NOT NULL,
  `info_more` varchar(25) NOT NULL,
  `feedback` varchar(300) NOT NULL,
  `random` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `meet_advisory`
-- ----------------------------
BEGIN;
INSERT INTO `meet_advisory` VALUES ('1', '子矜', '13476179904', '1769111903@qq.com', '冰岩作坊', '前端', '国有企业', '5000', '上海市', '2', '公司投资', '卡丁车场', '室内场馆', '这是测试的反馈此', 'd4fgr'), ('2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'J9NoT'), ('3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'E3TV4');
COMMIT;

-- ----------------------------
--  Table structure for `speed_advisory`
-- ----------------------------
DROP TABLE IF EXISTS `speed_advisory`;
CREATE TABLE `speed_advisory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(25) NOT NULL DEFAULT '' COMMENT '省份',
  `district` varchar(25) NOT NULL DEFAULT '' COMMENT '地区',
  `city` varchar(25) NOT NULL DEFAULT '',
  `city_type` varchar(25) NOT NULL DEFAULT '',
  `area` varchar(25) NOT NULL DEFAULT '',
  `land` varchar(25) NOT NULL DEFAULT '',
  `land_type` varchar(25) NOT NULL DEFAULT '',
  `dis_high` varchar(25) NOT NULL DEFAULT '',
  `dis_center` varchar(25) NOT NULL DEFAULT '',
  `dis_airplane` varchar(25) NOT NULL DEFAULT '',
  `center_money` varchar(25) NOT NULL DEFAULT '',
  `business_money` varchar(25) NOT NULL DEFAULT '',
  `people_num` varchar(25) NOT NULL,
  `people_200_num` varchar(25) NOT NULL,
  `view_type` varchar(25) NOT NULL,
  `city_num` varchar(25) NOT NULL,
  `has_place` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `workplace` varchar(25) NOT NULL,
  `job` varchar(25) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `random` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `speed_advisory`
-- ----------------------------
BEGIN;
INSERT INTO `speed_advisory` VALUES ('1', '上海', '华东地区', '上海', '省会城市', '300', '荒地', '林地', '345', '324', '600', '230', '340', '5000', '234', '5A', '45', '有', '子矜', '华中科技大学', '前端', '13476179904', '1769111903@qq.com', ''), ('2', '上海', '华东地区', '上海', '省会城市', '300', '荒地', '林地', '345', '324', '600', '230', '340', '5000', '234', '5A', '45', '有', '子矜', '华中科技大学', '前端', '13476179904', '1769111903@qq.com', ''), ('3', '上海', '华东地区', '上海', '省会城市', '300', '荒地', '林地', '345', '324', '600', '230', '340', '5000', '234', '5A', '45', '有', '子矜', '华中科技大学', '前端', '13476179904', '1769111903@qq.com', ''), ('4', '上海', '华东地区', '上海', '省会城市', '300', '荒地', '林地', '345', '324', '600', '230', '340', '5000', '234', '5A', '45', '有', '子矜', '华中科技大学', '前端', '13476179904', '1769111903@qq.com', ''), ('5', '上海', '华东地区', '上海', '省会城市', '300', '荒地', '林地', '345', '324', '600', '230', '340', '5000', '234', '5A', '45', '有', '子矜', '华中科技大学', '前端', '13476179904', '1769111903@qq.com', ''), ('6', '上海', '华东地区', '上海', '省会城市', '300', '荒地', '林地', '345', '324', '600', '230', '340', '5000', '234', '5A', '45', '有', '子矜', '华中科技大学', '前端', '13476179904', '1769111903@qq.com', ''), ('7', '河南', 'undefined', '地级市', '驻马店', '234', '，农田，荒地', '，平地', '4545', '345', '232', '2345', '1', '234', '33', '4A', '45', '无', '常明明', '华中科技大学', '前端工程师', '13476179904', 'cmm@bingyan.net', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
