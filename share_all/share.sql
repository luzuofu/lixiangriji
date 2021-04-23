/*
 Navicat Premium Data Transfer

 Source Server         : localdb
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 192.168.0.100:3306
 Source Schema         : share

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 12/04/2021 11:22:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001786272E8287874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', '192.168.0.1001618197204343', 1618197522466, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1618198200000, -1, 5, 'WAITING', 'CRON', 1616588254000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001786272E8287874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
COMMIT;

-- ----------------------------
-- Table structure for article_message
-- ----------------------------
DROP TABLE IF EXISTS `article_message`;
CREATE TABLE `article_message` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `article_content` longtext NOT NULL COMMENT '文章内容',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `theme_id` int(11) NOT NULL DEFAULT '-1' COMMENT '分类ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COMMENT='文章信息管理';

-- ----------------------------
-- Records of article_message
-- ----------------------------
BEGIN;
INSERT INTO `article_message` VALUES (50, '<p style=\"text-align: center;\">《Umbrella》</p><p>You had my heart\' we\'ll never be a world apart</p><p>你拥有了我的心 我们不会被分隔在世界两端Maybe in magazines but you\'ll still be my star</p><p>可能你只会出现在杂志上 但你依旧是属于我的巨星</p><p>Baby \'cause in the dark you can see shiny cars Baby</p><p> 因为在黑暗中 你能看到闪烁的车灯</p><p>And that\'s when you need me there</p><p>那就是你需要我的时刻</p><p>With you I\'ll always share</p><p>我会永远和你分享</p><p><img src=\"https://1538933906.oss-cn-huhehaote.aliyuncs.com/https://1538933906.oss-accelerate.aliyuncs.com//share/images/2020-6-14/1592113246888144.png\" width=\"340\" style=\"\"></p><p><br></p><p><br></p>', 11, 3, '2020-06-29 05:41:00');
INSERT INTO `article_message` VALUES (51, '<p>桃夭-双笙</p><p>一首充满诗意的古风歌曲，节奏轻快 洒脱的曲风 有趣的是把二胡元素也揉进去，在副歌部分有曲折回旋的感觉，很有自己的风格，双笙作为一位具有隐藏实力型的歌手，她的经典歌曲都比较值得推荐</p><p>桃之夭夭，灼灼其华！<span class=\"ql-cursor\">﻿</span></p>', 12, 3, '2020-06-29 09:06:05');
INSERT INTO `article_message` VALUES (52, '<p style=\"text-align: center;\"><strong><em>《沉默的大多数》</em></strong></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><br></p><hr><p style=\"text-align: center;\"><br></p><p style=\"text-align: left;\" class=\"ql-indent-1\">王小波说：我活在世上，无非想要明白些道理，</p><p style=\"text-align: left;\" class=\"ql-indent-1\">遇见些有趣的事。倘能如我所愿，我的一生就算成功。我开始得太晚了，很可能做不成什么，但我总得申明我的态度，所以就有了这本书——为我自己，也代表沉默的大多数。</p><p style=\"text-align: center;\"><br></p><hr><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><img src=\"https://1538933906.oss-cn-huhehaote.aliyuncs.com/https://1538933906.oss-accelerate.aliyuncs.com//share/images/2020-6-14/159212552107180.png\" width=\"50%\"></img></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: left;\" class=\"ql-indent-1\">在读这本是之前我对王小波知之甚少，也不明白</p><p style=\"text-align: left; line-height: 2;\">这个作家究竟有何种魅力，可以受到这么多的读者喜爱。当我读完后，发现在他的文章之中有包含着他对这个世界属于他的理性的看法。用调侃的语气来表现复杂的现象，用幽默的方式解给出他的观点。对于这样有趣的文章，喜欢的人自然不会少了。</p><p style=\"text-align: left; line-height: 2;\"><br></p><p style=\"text-align: left;\" class=\"ql-indent-1\">也许大部分人欣赏他的读者在读过他的文章后都</p><p style=\"text-align: left; line-height: 2;\">会有中相识恨晚的感觉吧，可能他表达出了大多是沉默者的心声也说不定。</p><p style=\"text-align: left;\"><br></p><p style=\"text-align: left;\"><br></p><hr><p style=\"text-align: left;\"><br></p><p style=\"text-align: left;\"><br></p><p style=\"text-align: center;\"><br></p>', 9, 2, '2020-06-29 09:30:01');
INSERT INTO `article_message` VALUES (54, '<p style=\"text-align: center;\">剑来</p><p style=\"text-align: center;\">大千世界，无奇不有。 我陈平安，唯有一剑，可搬山，倒海，降妖，镇魔，敕神，摘星，断江，摧城，开天！ 我叫陈平安，平平安安的平安。我是一名剑客。</p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><img src=\"https://1538933906.oss-cn-huhehaote.aliyuncs.com/https://1538933906.oss-accelerate.aliyuncs.com//share/images/2020-6-14/159212862759532.png\" width=\"50%\"></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><br></p>', 11, 2, '2020-06-29 09:57:13');
INSERT INTO `article_message` VALUES (57, '<p style=\"text-align: center;\">《边城》</p><p><br></p><p>凡事都有偶然的凑巧，结果却又如宿命的必然。                                                      —— 沈从文</p><hr><p><br></p><p><img src=\"https://1538933906.oss-cn-huhehaote.aliyuncs.com/https://1538933906.oss-accelerate.aliyuncs.com//share/images/2020-6-14/159213147948577.png\" width=\"305\" style=\"\"></p><p><br></p><hr><p><br></p><p>《边城》是沈从文的代表作。这篇作品如沈从文的其他湘西作品，着眼于普通人、善良人的命运变迁，描摹了湘女翠翠阴差阳错的生活悲剧。</p><p>《边城》讲述的故事凄美动人。它没有惊心动魄的情节，也没有撕心裂肺的感人场面，但他细腻而且真实，像一根轻柔的丝线悠悠地牵动你心灵的一角，使你在不知不觉间已然泪落满面。</p><p><br></p>', 11, 2, '2020-06-29 10:46:45');
INSERT INTO `article_message` VALUES (83, '<p style=\"text-align: center;\"><strong>这是演示文章<span class=\"ql-cursor\">﻿</span></strong></p>', 14, 1, '2020-06-29 10:39:45');
INSERT INTO `article_message` VALUES (92, '<p>I\'m interested in the app.  I just try it</p>', 15, -1, '2020-07-01 01:52:38');
INSERT INTO `article_message` VALUES (93, '<h1 wx:nodeid=\"94\">你好呀！！！<strong wx:nodeid=\"96\">123456789</strong></h1>', 10, 2, '2020-10-13 08:14:08');
INSERT INTO `article_message` VALUES (94, '<p>你好啊。测试打断</p>', 19, 1, '2021-04-12 02:56:08');
COMMIT;

-- ----------------------------
-- Table structure for comment_message
-- ----------------------------
DROP TABLE IF EXISTS `comment_message`;
CREATE TABLE `comment_message` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `comment_content` longtext NOT NULL COMMENT '评论内容',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COMMENT='评论信息管理';

-- ----------------------------
-- Records of comment_message
-- ----------------------------
BEGIN;
INSERT INTO `comment_message` VALUES (73, '666', 50, 9, '2020-06-14 05:47:20');
INSERT INTO `comment_message` VALUES (74, '666', 50, 12, '2020-06-14 09:48:19');
INSERT INTO `comment_message` VALUES (75, '哇  这就是沉默的大多数吗？\n真是有够沉默的呢！', 52, 11, '2020-06-14 09:51:29');
INSERT INTO `comment_message` VALUES (76, '好分析\n', 51, 11, '2020-06-14 09:54:45');
INSERT INTO `comment_message` VALUES (77, '侠之大者，为国为民', 54, 12, '2020-06-14 10:54:47');
INSERT INTO `comment_message` VALUES (78, '真是够沉默的呢', 52, 12, '2020-06-14 10:55:53');
INSERT INTO `comment_message` VALUES (79, '1', 57, 9, '2020-06-14 12:04:00');
INSERT INTO `comment_message` VALUES (80, '1', 71, 10, '2020-06-15 06:06:49');
INSERT INTO `comment_message` VALUES (81, '2', 71, 10, '2020-06-15 06:06:51');
INSERT INTO `comment_message` VALUES (82, '3', 71, 10, '2020-06-15 06:06:55');
INSERT INTO `comment_message` VALUES (83, '4', 71, 10, '2020-06-15 06:06:58');
INSERT INTO `comment_message` VALUES (84, '5', 71, 10, '2020-06-15 06:07:00');
INSERT INTO `comment_message` VALUES (85, '5', 71, 10, '2020-06-15 06:07:00');
INSERT INTO `comment_message` VALUES (86, '5', 71, 10, '2020-06-15 06:07:00');
INSERT INTO `comment_message` VALUES (87, '5', 71, 10, '2020-06-15 06:07:00');
INSERT INTO `comment_message` VALUES (88, '6', 71, 10, '2020-06-15 06:09:23');
INSERT INTO `comment_message` VALUES (89, '8', 71, 10, '2020-06-15 06:09:27');
INSERT INTO `comment_message` VALUES (90, '123', 71, 10, '2020-06-15 06:10:35');
INSERT INTO `comment_message` VALUES (91, '123', 71, 10, '2020-06-15 06:10:42');
INSERT INTO `comment_message` VALUES (92, '123432', 71, 10, '2020-06-15 06:11:55');
INSERT INTO `comment_message` VALUES (93, '12312312312', 71, 10, '2020-06-15 06:11:59');
INSERT INTO `comment_message` VALUES (94, '1231232321341234', 71, 10, '2020-06-15 06:12:03');
INSERT INTO `comment_message` VALUES (95, '23434234324324234', 71, 10, '2020-06-15 06:12:08');
INSERT INTO `comment_message` VALUES (96, '435345', 71, 10, '2020-06-15 06:12:10');
INSERT INTO `comment_message` VALUES (97, '123123', 71, 10, '2020-06-15 06:12:32');
INSERT INTO `comment_message` VALUES (100, '评论123', 57, 10, '2020-06-15 10:23:43');
INSERT INTO `comment_message` VALUES (107, '这是演示评论', 83, 10, '2020-06-15 11:55:48');
INSERT INTO `comment_message` VALUES (108, '这是演示评论', 83, 10, '2020-06-15 11:57:43');
INSERT INTO `comment_message` VALUES (110, 'interesting', 51, 15, '2020-07-01 01:51:26');
INSERT INTO `comment_message` VALUES (111, '你好呀', 93, 10, '2020-10-13 08:14:24');
INSERT INTO `comment_message` VALUES (112, '这是评论', 93, 10, '2020-10-13 08:14:50');
INSERT INTO `comment_message` VALUES (113, '对方可以看到通知并回复', 93, 10, '2020-10-13 08:15:01');
COMMIT;

-- ----------------------------
-- Table structure for like_message
-- ----------------------------
DROP TABLE IF EXISTS `like_message`;
CREATE TABLE `like_message` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '喜欢ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_message` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COMMENT='喜欢信息管理';

-- ----------------------------
-- Records of like_message
-- ----------------------------
BEGIN;
INSERT INTO `like_message` VALUES (112, 14, 84, '2020-06-15 10:41:10');
INSERT INTO `like_message` VALUES (113, 10, 85, '2020-06-15 10:44:34');
INSERT INTO `like_message` VALUES (116, 10, 52, '2020-06-15 11:15:20');
INSERT INTO `like_message` VALUES (117, 10, 90, '2020-06-15 11:16:32');
INSERT INTO `like_message` VALUES (118, 10, 91, '2020-06-15 11:24:00');
INSERT INTO `like_message` VALUES (120, 10, 83, '2020-06-29 04:02:25');
INSERT INTO `like_message` VALUES (122, 15, 51, '2020-07-01 01:51:12');
INSERT INTO `like_message` VALUES (123, 16, 52, '2020-07-01 02:05:31');
INSERT INTO `like_message` VALUES (124, 10, 92, '2020-07-10 05:48:05');
INSERT INTO `like_message` VALUES (125, 10, 57, '2020-10-13 07:50:25');
INSERT INTO `like_message` VALUES (126, 10, 93, '2020-10-13 08:14:17');
COMMIT;

-- ----------------------------
-- Table structure for notice_message
-- ----------------------------
DROP TABLE IF EXISTS `notice_message`;
CREATE TABLE `notice_message` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信ID',
  `notice_type` int(11) NOT NULL COMMENT '私信类型',
  `send_user_id` int(11) DEFAULT NULL COMMENT '发送用户ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `replay_id` int(11) DEFAULT NULL COMMENT '回复ID',
  `like_id` int(11) DEFAULT NULL COMMENT '喜欢ID',
  `comment_id` int(11) DEFAULT NULL COMMENT '评论ID',
  `article_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `content` longtext COMMENT '内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COMMENT='私信信息管理';

-- ----------------------------
-- Records of notice_message
-- ----------------------------
BEGIN;
INSERT INTO `notice_message` VALUES (168, 2, NULL, 9, NULL, 110, NULL, 52, NULL, '2020-06-15 09:24:07');
INSERT INTO `notice_message` VALUES (170, 3, NULL, 11, NULL, NULL, 100, 57, NULL, '2020-06-15 10:23:43');
INSERT INTO `notice_message` VALUES (177, 6, 10, 9, NULL, NULL, NULL, 52, '我举报这篇文章,查看详情', '2020-06-15 10:51:07');
INSERT INTO `notice_message` VALUES (178, 6, 10, 9, NULL, NULL, NULL, 52, '我举报这篇文章,查看详情', '2020-06-15 10:54:13');
INSERT INTO `notice_message` VALUES (179, 6, 10, 9, NULL, NULL, NULL, 52, '我举报这篇文章,查看详情', '2020-06-15 11:03:13');
INSERT INTO `notice_message` VALUES (180, 2, NULL, 9, NULL, 116, NULL, 52, NULL, '2020-06-15 11:15:20');
INSERT INTO `notice_message` VALUES (182, 3, NULL, 14, NULL, NULL, 107, 83, NULL, '2020-06-15 11:55:48');
INSERT INTO `notice_message` VALUES (183, 3, NULL, 14, NULL, NULL, 107, 83, NULL, '2020-06-15 11:57:43');
INSERT INTO `notice_message` VALUES (185, 2, NULL, 14, NULL, 120, NULL, 83, NULL, '2020-06-29 04:02:25');
INSERT INTO `notice_message` VALUES (187, 2, NULL, 12, NULL, 122, NULL, 51, NULL, '2020-07-01 01:51:12');
INSERT INTO `notice_message` VALUES (188, 3, NULL, 12, NULL, NULL, 110, 51, NULL, '2020-07-01 01:51:26');
INSERT INTO `notice_message` VALUES (189, 2, NULL, 9, NULL, 123, NULL, 52, NULL, '2020-07-01 02:05:31');
INSERT INTO `notice_message` VALUES (190, 2, NULL, 15, NULL, 124, NULL, 92, NULL, '2020-07-10 05:48:05');
INSERT INTO `notice_message` VALUES (191, 1, 10, 15, NULL, NULL, NULL, NULL, '感谢你的体验😝', '2020-07-10 05:49:35');
INSERT INTO `notice_message` VALUES (192, 2, NULL, 11, NULL, 125, NULL, 57, NULL, '2020-10-13 07:50:25');
COMMIT;

-- ----------------------------
-- Table structure for replay_message
-- ----------------------------
DROP TABLE IF EXISTS `replay_message`;
CREATE TABLE `replay_message` (
  `replay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  `comment_id` int(11) NOT NULL COMMENT '评论ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `replay_user_id` int(11) DEFAULT NULL COMMENT '回复用户ID',
  `replay_content` longtext NOT NULL COMMENT '回复内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`replay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='回复信息管理';

-- ----------------------------
-- Records of replay_message
-- ----------------------------
BEGIN;
INSERT INTO `replay_message` VALUES (1, 76, 12, NULL, '有眼光', '2020-06-14 10:55:17');
INSERT INTO `replay_message` VALUES (2, 79, 9, NULL, '2', '2020-06-14 12:04:50');
INSERT INTO `replay_message` VALUES (3, 81, 10, NULL, '哈哈', '2020-06-15 06:29:35');
INSERT INTO `replay_message` VALUES (4, 93, 10, NULL, '123', '2020-06-15 06:30:45');
INSERT INTO `replay_message` VALUES (6, 97, 10, NULL, '123123123', '2020-06-15 06:33:08');
INSERT INTO `replay_message` VALUES (7, 96, 10, NULL, '12312321123', '2020-06-15 06:33:42');
INSERT INTO `replay_message` VALUES (8, 95, 10, NULL, '`121`2123', '2020-06-15 06:33:52');
INSERT INTO `replay_message` VALUES (10, 107, 10, NULL, '这是演示回复', '2020-06-15 11:56:06');
INSERT INTO `replay_message` VALUES (11, 111, 10, NULL, '你好呀', '2020-10-13 08:14:41');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2021-03-24 12:16:41');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-24 20:30:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-24 21:00:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-24 22:00:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-24 22:30:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 1, '2021-03-24 23:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 4, '2021-04-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 7, '2021-04-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 3, '2021-04-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2021-04-12 11:00:00');
COMMIT;

-- ----------------------------
-- Table structure for swiper_message
-- ----------------------------
DROP TABLE IF EXISTS `swiper_message`;
CREATE TABLE `swiper_message` (
  `swiper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图ID ',
  `swiper_url` varchar(255) NOT NULL COMMENT '轮播图链接',
  `swiper_type` varchar(255) NOT NULL COMMENT '轮播图类型',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `article_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `web_url` varchar(255) DEFAULT NULL COMMENT '网络地址',
  PRIMARY KEY (`swiper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='轮播图管理';

-- ----------------------------
-- Records of swiper_message
-- ----------------------------
BEGIN;
INSERT INTO `swiper_message` VALUES (1, 'https://s1.ax1x.com/2020/06/13/tvO2X6.jpg', '1', NULL, NULL, '欢迎您的到来！', NULL);
INSERT INTO `swiper_message` VALUES (2, 'https://s1.ax1x.com/2020/06/13/tvOg6x.jpg', '2', 9, NULL, '', NULL);
INSERT INTO `swiper_message` VALUES (3, 'https://s1.ax1x.com/2020/06/13/tvOc11.jpg', '3', NULL, 52, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
BEGIN;
INSERT INTO `sys_captcha` VALUES ('28eea6d1-3545-4810-8562-389dbdc7abae', 'ae2eg', '2021-03-24 20:23:08');
INSERT INTO `sys_captcha` VALUES ('63425aef-dee5-48f1-86ce-4505ddb76f1f', 'nxnm2', '2021-04-11 17:39:37');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[66]', 6, '0:0:0:0:0:0:0:1', '2021-03-24 20:39:11');
INSERT INTO `sys_log` VALUES (2, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', 0, '0:0:0:0:0:0:0:1', '2021-03-24 20:39:34');
INSERT INTO `sys_log` VALUES (3, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[3]', 0, '0:0:0:0:0:0:0:1', '2021-03-24 21:37:38');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (151, 1, '文章信息管理', 'generator/articlemessage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (152, 151, '查看', NULL, 'generator:articlemessage:list,generator:articlemessage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (153, 151, '新增', NULL, 'generator:articlemessage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (154, 151, '修改', NULL, 'generator:articlemessage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (155, 151, '删除', NULL, 'generator:articlemessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (156, 1, '评论信息管理', 'generator/commentmessage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (157, 156, '查看', NULL, 'generator:commentmessage:list,generator:commentmessage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (158, 156, '新增', NULL, 'generator:commentmessage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (159, 156, '修改', NULL, 'generator:commentmessage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (160, 156, '删除', NULL, 'generator:commentmessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (161, 1, '喜欢信息管理', 'generator/likemessage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (162, 161, '查看', NULL, 'generator:likemessage:list,generator:likemessage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (163, 161, '新增', NULL, 'generator:likemessage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (164, 161, '修改', NULL, 'generator:likemessage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (165, 161, '删除', NULL, 'generator:likemessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (166, 1, '私信信息管理', 'generator/noticemessage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (167, 166, '查看', NULL, 'generator:noticemessage:list,generator:noticemessage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (168, 166, '新增', NULL, 'generator:noticemessage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (169, 166, '修改', NULL, 'generator:noticemessage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (170, 166, '删除', NULL, 'generator:noticemessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (171, 1, '回复信息管理', 'generator/replaymessage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (172, 171, '查看', NULL, 'generator:replaymessage:list,generator:replaymessage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (173, 171, '新增', NULL, 'generator:replaymessage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (174, 171, '修改', NULL, 'generator:replaymessage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (175, 171, '删除', NULL, 'generator:replaymessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (176, 1, '轮播图管理', 'generator/swipermessage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (177, 176, '查看', NULL, 'generator:swipermessage:list,generator:swipermessage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (178, 176, '新增', NULL, 'generator:swipermessage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (179, 176, '修改', NULL, 'generator:swipermessage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (180, 176, '删除', NULL, 'generator:swipermessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (181, 1, '分类信息管理', 'generator/thememessage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (182, 181, '查看', NULL, 'generator:thememessage:list,generator:thememessage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (183, 181, '新增', NULL, 'generator:thememessage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (184, 181, '修改', NULL, 'generator:thememessage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (185, 181, '删除', NULL, 'generator:thememessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (186, 1, '用户信息管理', 'generator/usermessage', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (187, 186, '查看', NULL, 'generator:usermessage:list,generator:usermessage:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (188, 186, '新增', NULL, 'generator:usermessage:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (189, 186, '修改', NULL, 'generator:usermessage:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (190, 186, '删除', NULL, 'generator:usermessage:delete', 2, NULL, 6);
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_token` VALUES (1, '5883cb830fd0f3a12ae0b933e339021d', '2021-04-12 22:56:27', '2021-04-12 10:56:27');
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
COMMIT;

-- ----------------------------
-- Table structure for theme_message
-- ----------------------------
DROP TABLE IF EXISTS `theme_message`;
CREATE TABLE `theme_message` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `theme_title` varchar(255) NOT NULL COMMENT '分类主题',
  `theme_intro` varchar(255) NOT NULL COMMENT '分类介绍',
  `theme_use` int(11) NOT NULL DEFAULT '1' COMMENT '分类使用',
  `theme_image` varchar(255) NOT NULL COMMENT '分类图片',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='分类信息管理';

-- ----------------------------
-- Records of theme_message
-- ----------------------------
BEGIN;
INSERT INTO `theme_message` VALUES (1, '日常', '主题介绍', 1, 'https://s1.ax1x.com/2020/06/14/tzrdoD.png', '2020-06-14 08:32:53');
INSERT INTO `theme_message` VALUES (2, '书籍', '主题介绍', 1, 'https://s1.ax1x.com/2020/06/14/tzrtL6.png', '2020-06-14 08:33:19');
INSERT INTO `theme_message` VALUES (3, '音乐', '主题介绍', 1, 'https://s1.ax1x.com/2020/06/14/tzradO.png', '2020-06-14 08:33:03');
INSERT INTO `theme_message` VALUES (4, '电影', '主题介绍', 1, 'https://s1.ax1x.com/2020/06/14/tzrUeK.png', '2020-06-14 08:33:14');
COMMIT;

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_nickname` varchar(255) NOT NULL COMMENT '用户昵称',
  `user_gender` tinyint(4) NOT NULL COMMENT '用户性别',
  `user_token` varchar(255) DEFAULT NULL COMMENT '用户Token',
  `user_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `user_other` varchar(255) DEFAULT '' COMMENT '其他',
  `user_city` varchar(255) DEFAULT '' COMMENT '城市',
  `user_age` varchar(255) DEFAULT '0' COMMENT '年龄',
  `user_province` varchar(255) DEFAULT '' COMMENT '省',
  `user_country` varchar(255) DEFAULT '' COMMENT '国家',
  `user_admin` enum('2','1') NOT NULL DEFAULT '1' COMMENT '类型',
  `user_allow` enum('1','2') NOT NULL DEFAULT '1' COMMENT '权限',
  `user_motto` longtext COMMENT '格言',
  `user_phone` varchar(255) DEFAULT '' COMMENT '电话',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息管理';

-- ----------------------------
-- Records of user_message
-- ----------------------------
BEGIN;
INSERT INTO `user_message` VALUES (9, '进口凉白开', 1, 'oMyNA5d4nrDTcnztQ4iQNpDxcWBg', 'https://wx.qlogo.cn/mmopen/vi_32/6ibBsxibjxCoo867UAvicbiae4oDOAicsDxHY8fvlFibcLicyE7BmliaoibWWibPlHrQ1uT9ypJT9zsU0XXAkB7CqXTJKMJA/132', '', '西安', '0', '陕西', '中国', '2', '1', '这个人很懒,什么也没有留下', '', '2020-06-14 04:27:25');
INSERT INTO `user_message` VALUES (10, '勿 忘 我', 1, 'oMyNA5cv4NoSlv5bgHwfAt55zAyQ', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI4mUsxJjImu6e9xMiccYnDenQL9c0aNgIbKHHiciczgmicpMxCbG35sMg7iczLHMialgZtVM0RibpU9FbNg/132', '', '西安', '0', '陕西', '中国', '1', '1', '这个人很懒,什么也没有留下', '', '2020-06-14 04:28:47');
INSERT INTO `user_message` VALUES (11, 'ʚ👿ɞ', 1, 'oMyNA5fXNYMQ4A1yDWfuggYO6ZPE', 'https://wx.qlogo.cn/mmopen/vi_32/d43LH2205oSRD5Tc3I6Jg9oOpmEpOrSI8LAUzCDpHFf0KWl2KJNazLSp4GPtDOaHschtiaVfoWB125k78x48K5w/132', '', '渭南', '0', '陕西', '中国', '1', '1', '这个人很懒,什么也没有留下', '', '2020-06-14 05:35:41');
INSERT INTO `user_message` VALUES (12, 'ェ故酒难温ガ', 0, 'oMyNA5XviVmXgl558yW6niXpCIRQ', 'https://wx.qlogo.cn/mmopen/vi_32/Y4WRUrVYt8sLVnJU6jLkUiad6r54ey0M0sicB58qCIkiaBt1h0lOiaWQExAvRLC0Ovn2bbqlTCegTOibaRyZrzvQDqg/132', '', '', '0', '', '', '1', '1', '这个人很懒,什么也没有留下', '', '2020-06-14 09:02:01');
INSERT INTO `user_message` VALUES (13, 'Passerby', 1, 'oMyNA5aQIdb-09zfjxv8UPV-qDUA', 'https://wx.qlogo.cn/mmopen/vi_32/99B8vcao4j7Ax7fCd3tfSYJ2EOYaNSqLfOqicokFTbOhwEA6GR3Lf8BhZic4YmR0WZGsssnicevcTGDYnDzMiazqpg/132', '', '咸阳', '0', '陕西', '中国', '1', '1', '这个人很懒,什么也没有留下', '', '2020-06-14 11:15:57');
INSERT INTO `user_message` VALUES (14, '芷若初心', 0, 'oMyNA5S1V4nF-ur7YQ99yFgy4BNQ', 'https://wx.qlogo.cn/mmopen/vi_32/2ECkrMyefXJwdrtP0Zb2yKwOEYFWlk7cjf6ve1EwNxkBnZVoQ0PFmHbaicO9KQqaSmSibAPPLV01QG6nby0cVCSA/132', '', '西安', '0', '陕西', '中国', '1', '1', '这个人很懒,什么也没有留下', '', '2020-06-15 03:47:44');
INSERT INTO `user_message` VALUES (15, '李劲华', 0, 'oMyNA5Zz9YnStixlejveXjx9mHTw', 'https://wx.qlogo.cn/mmopen/vi_32/NicMfJ7OzpiaS7S4DdPHicXG1PDjjCIYVSPZdvl5QJ543oZun1ibcvqqickm66icQfWyP6vWNCREbNZWib3zOIp7hWOOQ/132', '', '', '0', '斯图加特', '德国', '1', '1', '这个人很懒,什么也没有留下', '', '2020-07-01 01:50:40');
INSERT INTO `user_message` VALUES (16, 'R.F', 1, 'oMyNA5b3rYRcHTyZerTvmFiM3zEE', 'https://wx.qlogo.cn/mmopen/vi_32/ArTRk9WV8KDkWOdDibmjem9ctI9f7DWpaZQsqPuI1sYRKUZNlIRNYavvb7nzx202rVPXEDBnHibQy9KIKKTOgrhg/132', '', '青岛', '0', '山东', '中国', '1', '1', 'Study hard', '', '2020-07-01 02:01:39');
INSERT INTO `user_message` VALUES (17, 'Sandy', 2, 'oMyNA5R5DgQUiIu6xYoegFTGy0AQ', 'https://wx.qlogo.cn/mmopen/vi_32/XUzvuoBCNx14MJjrWZBM7RWmliafaLp2SuMojAh86dSYEeibqNbyoyG6JQnPYa81XOGfLo9xOskUQpWhLichflgJw/132', '', '长沙', '0', '湖南', '中国', '1', '1', '这个人很懒,什么也没有留下', '', '2020-07-02 03:54:59');
INSERT INTO `user_message` VALUES (18, '运筹帷幄', 1, 'oMyNA5edU3-RINuAt8JWlg2KVjaA', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqeSjRts5ILydN2Ta1LmCf3De0P1KKL1vt9nf8CLDpDTpX2uGHSEjw1DibI7IOJ6iaj7Y3YCBYsxong/132', '', '石景山', '0', '北京', '中国', '1', '1', '这个人很懒,什么也没有留下', '', '2020-07-13 16:11:19');
INSERT INTO `user_message` VALUES (19, '微信用户', 0, 'owlZ_6jgwRtH3yyCmZZ2mApS30gI', 'https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132', '', '', '0', '', '', '1', '1', '这个人很懒,什么也没有留下', '', '2021-04-12 02:55:46');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
