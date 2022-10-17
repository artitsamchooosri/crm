/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : crm_db

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 17/10/2022 16:26:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `date_added` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `date_updated` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (2, 'Artit', 'Samchoosri', 'mixser@gmail', '2ffbeb14009a60c9dd3aeeedbf60e119', NULL, NULL, '2022-10-15 11:39:42', '2022-10-15 08:35:41');

-- ----------------------------
-- Table structure for quote
-- ----------------------------
DROP TABLE IF EXISTS `quote`;
CREATE TABLE `quote`  (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `date_created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quote
-- ----------------------------
INSERT INTO `quote` VALUES (1, 'jsmith@sample.com', '3,4,2', '2021-05-11 01:08:50');
INSERT INTO `quote` VALUES (3, 'mixser@gmail.com', '4', '2022-10-15 15:35:22');

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category_id` int(30) NOT NULL,
  `service` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `img_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (2, 2, 'Service 102', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus placerat sem et porta sagittis. Cras interdum varius risus, quis tincidunt orci convallis quis. Sed eget orci augue. Pellentesque mollis blandit nibh, vitae dapibus diam fringilla sed. Integer elementum felis vel elit feugiat auctor. Nunc fermentum tincidunt enim, non dignissim turpis pharetra ac. Proin pellentesque commodo diam. Morbi sem risus, blandit in egestas eget, suscipit quis tellus. Aenean varius quis turpis eu maximus. Nam feugiat sollicitudin ex. Etiam mollis ultricies turpis, a faucibus neque laoreet non. Integer et magna ultrices, faucibus felis quis, blandit quam.', 'uploads/services/2_img.jpg');
INSERT INTO `services` VALUES (3, 1, 'asdasd', 'asdasd', NULL);
INSERT INTO `services` VALUES (4, 1, 'Test 101', 'Sample', NULL);

-- ----------------------------
-- Table structure for services_category
-- ----------------------------
DROP TABLE IF EXISTS `services_category`;
CREATE TABLE `services_category`  (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of services_category
-- ----------------------------
INSERT INTO `services_category` VALUES (1, 'Sample Category', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus placerat sem et porta sagittis. Cras interdum varius risus, quis tincidunt orci convallis quis. Sed eget orci augue. Pellentesque mollis blandit nibh, vitae dapibus diam fringilla sed. Integer elementum felis vel elit feugiat auctor. Nunc fermentum tincidunt enim, non dignissim turpis pharetra ac. Proin pellentesque commodo diam. Morbi sem risus, blandit in egestas eget, suscipit quis tellus. Aenean varius quis turpis eu maximus. Nam feugiat sollicitudin ex. Etiam mollis ultricies turpis, a faucibus neque laoreet non. Integer et magna ultrices, faucibus felis quis, blandit quam.');
INSERT INTO `services_category` VALUES (2, 'Sample Category 102', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus placerat sem et porta sagittis. Cras interdum varius risus, quis tincidunt orci convallis quis. Sed eget orci augue. Pellentesque mollis blandit nibh, vitae dapibus diam fringilla sed. Integer elementum felis vel elit feugiat auctor. Nunc fermentum tincidunt enim, non dignissim turpis pharetra ac. Proin pellentesque commodo diam. Morbi sem risus, blandit in egestas eget, suscipit quis tellus. Aenean varius quis turpis eu maximus. Nam feugiat sollicitudin ex. Etiam mollis ultricies turpis, a faucibus neque laoreet non. Integer et magna ultrices, faucibus felis quis, blandit quam.');

-- ----------------------------
-- Table structure for system_info
-- ----------------------------
DROP TABLE IF EXISTS `system_info`;
CREATE TABLE `system_info`  (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `meta_field` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_info
-- ----------------------------
INSERT INTO `system_info` VALUES (1, 'name', 'Customer Relationship Management System');
INSERT INTO `system_info` VALUES (4, 'intro', 'Hi! I&apos;m Johnny, a ChatBot of this application. How can I help you?');
INSERT INTO `system_info` VALUES (6, 'short_name', 'CRMS');
INSERT INTO `system_info` VALUES (10, 'no_result', 'I am sorry. I can&apos;t understand your question. Please rephrase your question and make sure it is related to this site. Thank you :)');
INSERT INTO `system_info` VALUES (11, 'logo', 'uploads/1620608940_tech-logo.png');
INSERT INTO `system_info` VALUES (12, 'bot_avatar', 'uploads/bot_avatar.png');
INSERT INTO `system_info` VALUES (13, 'user_avatar', 'uploads/user_avatar.jpg');
INSERT INTO `system_info` VALUES (14, 'welcome_message', '');

-- ----------------------------
-- Table structure for ticket_comment
-- ----------------------------
DROP TABLE IF EXISTS `ticket_comment`;
CREATE TABLE `ticket_comment`  (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(30) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `user_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_created` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_comment
-- ----------------------------
INSERT INTO `ticket_comment` VALUES (2, 1, 'Sample comment..', '-1', 'developer', '2021-05-10 16:36:21');
INSERT INTO `ticket_comment` VALUES (4, 1, 'Sample', '-1', 'developer', '2021-05-10 21:55:34');
INSERT INTO `ticket_comment` VALUES (5, 4, 'sample', '1', 'user', '2021-05-10 23:55:39');
INSERT INTO `ticket_comment` VALUES (6, 4, 'test', '1', 'admin', '2021-05-11 00:02:06');

-- ----------------------------
-- Table structure for tickets
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets`  (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(5) NOT NULL DEFAULT 0,
  `service_id` int(30) NOT NULL,
  `user_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_created` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `date_created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `date_updated` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES (1, 'Sample Ticket 102', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus placerat sem et porta sagittis. Cras interdum varius risus, quis tincidunt orci convallis quis. Sed eget orci augue. Pellentesque mollis blandit nibh, vitae dapibus diam fringilla sed. Integer elementum felis vel elit feugiat auctor. Nunc fermentum tincidunt enim, non dignissim turpis pharetra ac. Proin pellentesque commodo diam. Morbi sem risus, blandit in egestas eget, suscipit quis tellus. Aenean varius quis turpis eu maximus. Nam feugiat sollicitudin ex. Etiam mollis ultricies turpis, a faucibus neque laoreet non. Integer et magna ultrices, faucibus felis quis, blandit quam.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif;\">Morbi tincidunt malesuada ullamcorper. Nam blandit eros sit amet gravida mollis. Etiam ullamcorper magna et enim tempor bibendum. In mollis lectus non tellus euismod imperdiet. Duis nec vestibulum leo. Vivamus vel metus mattis, fringilla erat in, blandit risus. Fusce dolor ligula, consequat vel varius vel, cursus nec nibh. Integer vel condimentum lorem. Aliquam tincidunt aliquam eros eu tincidunt.</p>', 2, 2, '-1', 'developer', '2021-05-10 13:59:54', '2021-05-10 21:55:55');
INSERT INTO `tickets` VALUES (4, 'Sample 103', '<p>Sample only</p>', 0, 3, '1', 'user', '2021-05-10 23:38:52', '2021-05-10 23:38:52');
INSERT INTO `tickets` VALUES (5, 'test', '<p><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">โดยปกติ&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">โลกจะหมุนรอบตัวเองช้าลงทีละน้อย&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">โลกหมุนช้าลงศตวรรษละ&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">2&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">มิลลิวินาที&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">หากคิดแบบคร่าว&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">ๆ&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">ในระยะยาวก็น่าจะต้องมีการเพิ่มอธิกวินาทีบ่อยขึ้น&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">แต่ในทางความเป็นจริงกลับพบว่าหลายปีที่ผ่านมาโลกหมุนเร็วกว่าเดิม&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">จึงไม่มีการเพิ่มอธิกวินาทีมาหลายปีแล้ว&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">ครั้งล่าสุดที่มีการเพิ่มอธิกวินาทีคือวันที่&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">31&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">ธันวาคม&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">2559&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><span style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\">หรือเกือบหกปีก่อน&nbsp;</span><wbr style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><br style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><br style=\"color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"></p><div class=\"mkbb-docmedia\" style=\"display: table; margin: auto; color: rgb(64, 16, 0); font-family: &quot;TH Sarabun New&quot;; font-size: 25.3333px;\"><div class=\"image\" style=\"border: none; text-align: center; overflow: auto; margin-top: 20px;\"><a class=\"lightbox cboxElement\" href=\"http://thaiastro.nectec.or.th/news/uploads/2022/media-4454-62eb0510d6415.jpg\" style=\"color: rgb(64, 64, 175); text-decoration-line: underline; text-decoration-thickness: 2px;\"><img src=\"http://thaiastro.nectec.or.th/news/uploads/2022/media-4454-62eb0510d6415.jpg\" style=\"max-width: 100%; max-height: 100%;\"></a></div><div class=\"imagecaption\" style=\"color: rgb(128, 128, 128); margin: auto auto 20px; padding: 10px 0px; border-bottom: 1px solid rgb(176, 176, 176); display: table-caption; caption-side: bottom;\">แผนภูมิแสดงระยะเวลาของวันนับจากที่มีการใช้นาฬิกาอะตอม&nbsp;<wbr>ปี&nbsp;<wbr>2565&nbsp;<wbr>นี้เป็นปีที่มีวันที่สั้นที่สุดที่เคยบันทึก&nbsp;<wbr>เส้นหยักละเอียดแสดงความผันแปรที่เกิดขึ้นเป็นรายเดือน&nbsp;<wbr>ซึ่งเกิดจากการโคจรของดวงจันทร์&nbsp;<wbr>ส่วนแนวโน้มที่ขึ้นลงเป็นรายปีเป็นผลจากการไหลเวียนของบรรรยากาศโลก&nbsp;<wbr>สังเกตว่าช่วงวันที่สั้นที่สุดในรอบปีจะเกิดขึ้นราวเดือนมิถุนายนหรือกรกฎาคม<br>&nbsp;<wbr>(<i>จาก&nbsp;<wbr>timeanddate.com)</i></div></div>', 0, 3, '1', 'admin', '2022-10-15 15:29:15', '2022-10-15 15:29:15');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `date_added` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `date_updated` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (6, 'admin', 'admin1', 'admin1', '2ffbeb14009a60c9dd3aeeedbf60e119', NULL, NULL, '2021-05-10 22:38:34', '2022-10-15 11:38:10');

SET FOREIGN_KEY_CHECKS = 1;
