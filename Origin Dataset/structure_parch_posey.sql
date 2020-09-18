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

 Date: 18/09/2020 17:08:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `long` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `primary_poc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sales_rep_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accounts_sales_reps_id_fk`(`sales_rep_id`) USING BTREE,
  CONSTRAINT `accounts_sales_reps_id_fk` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_reps` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `occurred_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `standard_qty` int(11) NOT NULL DEFAULT 0,
  `gloss_qty` int(11) NOT NULL DEFAULT 0,
  `poster_qty` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `standard_amt_usd` float(11, 2) NOT NULL DEFAULT 0.00,
  `gloss_amt_usd` float(11, 2) NOT NULL DEFAULT 0.00,
  `poster_amt_usd` float(11, 2) NOT NULL DEFAULT 0.00,
  `total_amt_usd` float(11, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_accounts_id_fk`(`account_id`) USING BTREE,
  CONSTRAINT `orders_accounts_id_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13825 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

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
-- Table structure for sales_reps
-- ----------------------------
DROP TABLE IF EXISTS `sales_reps`;
CREATE TABLE `sales_reps`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sales_reps_region_id_fk`(`region_id`) USING BTREE,
  CONSTRAINT `sales_reps_region_id_fk` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for web_events
-- ----------------------------
DROP TABLE IF EXISTS `web_events`;
CREATE TABLE `web_events`  (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `occurred_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_events_accounts_id_fk`(`account_id`) USING BTREE,
  CONSTRAINT `web_events_accounts_id_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
