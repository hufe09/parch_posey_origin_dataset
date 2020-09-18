/*
 Navicat Premium Data Transfer

 Source Server         : Tencent_MySQL
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 
 Source Schema         : parchposey

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 18/09/2020 17:06:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES (1, 'Northeast');
INSERT INTO `region` VALUES (2, 'Midwest');
INSERT INTO `region` VALUES (3, 'Southeast');
INSERT INTO `region` VALUES (4, 'West');

SET FOREIGN_KEY_CHECKS = 1;
