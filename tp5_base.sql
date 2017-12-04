/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50633
 Source Host           : localhost
 Source Database       : tp5_base

 Target Server Type    : MySQL
 Target Server Version : 50633
 File Encoding         : utf-8

 Date: 12/04/2017 11:35:32 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `ad`
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `ad`
-- ----------------------------
BEGIN;
INSERT INTO `ad` VALUES ('1', '首页轮播图片', 'ad_index_slider', '1', null, null, null, null), ('2', '111111', '11', '1', '2017-09-14 11:38:54', '2017-09-14 11:38:54', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `ad_item`
-- ----------------------------
DROP TABLE IF EXISTS `ad_item`;
CREATE TABLE `ad_item` (
  `ad_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad_item_title` varchar(256) DEFAULT NULL,
  `ad_item_path` varchar(256) DEFAULT NULL,
  `ad_item_href` varchar(256) DEFAULT NULL,
  `ad_item_type` varchar(64) DEFAULT NULL,
  `ad_item_desc` text,
  `ad_item_sort` int(11) DEFAULT NULL,
  `ad_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`ad_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `ad_item`
-- ----------------------------
BEGIN;
INSERT INTO `ad_item` VALUES ('1', '1', '/assets/front/images/ad1.jpg', 'introduction.html', 'image', null, null, '1', null, null, null, null), ('2', '2', '/assets/front/images/ad2.jpg', null, 'image', null, null, '1', null, null, null, null), ('3', '3', '/assets/front/images/ad3.jpg', null, 'image', null, null, '1', null, null, null, null), ('4', '4', '/assets/front/images/ad4.jpg', null, 'image', null, null, '1', null, null, null, null), ('5', '22', '/upload/image/201707/10/20170710161258575.jpg', '22', null, '2', '2', '3', '2017-07-10 16:19:12', '2017-07-10 16:13:02', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `sub_title` varchar(256) DEFAULT NULL,
  `summary` text,
  `content` text,
  `logo` varchar(256) DEFAULT NULL,
  `keyword` varchar(256) DEFAULT NULL,
  `tags` varchar(256) DEFAULT NULL,
  `source` varchar(256) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `visibility` varchar(64) DEFAULT 'PUBLIC',
  `allow_comment` int(4) DEFAULT '1',
  `is_top` int(4) DEFAULT '0',
  `hit_count` int(11) DEFAULT '0',
  `comment_count` int(11) DEFAULT '0',
  `close_time` datetime DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `cms_article`
-- ----------------------------
BEGIN;
INSERT INTO `cms_article` VALUES ('1', '1', '阿斯达舒服撒发顺丰固定收入供热', '111', '111', '<p>1111111</p>', null, null, null, null, '1', 'PUBLISHED', 'LOCK', '0', '1', '0', '0', null, '2017-04-08 11:30:05', '2017-04-08 07:18:37', null, '2017-07-10 13:49:46', null), ('2', '1', '333', '333', '333', '<p>222</p>\r\n', '', null, null, null, '3', 'PUBLISHED', 'PUBLIC', '0', '0', '0', '0', null, '2017-07-10 14:36:54', '2017-07-10 14:29:46', null, '2017-07-10 14:36:54', null);
COMMIT;

-- ----------------------------
--  Table structure for `cms_catalog`
-- ----------------------------
DROP TABLE IF EXISTS `cms_catalog`;
CREATE TABLE `cms_catalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_leaf` int(4) DEFAULT NULL,
  `template_index` varchar(256) DEFAULT NULL,
  `template_list` varchar(256) DEFAULT NULL,
  `template_detail` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `cms_catalog`
-- ----------------------------
BEGIN;
INSERT INTO `cms_catalog` VALUES ('1', null, '分类2', 'cat2', '1', '1', null, '0', '1', null, null, null, '2017-04-07 11:26:15', '2017-07-10 14:14:31', null, null), ('5', null, '分类3', 'cat3', '2', '1', null, '0', '1', null, null, null, '2017-07-10 14:09:12', '2017-07-10 14:14:47', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `cms_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `visibility` int(4) DEFAULT '1',
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `system_log`
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
--  Records of `system_log`
-- ----------------------------
BEGIN;
INSERT INTO `system_log` VALUES ('1', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2017-12-02 09:39:50'), ('2', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 09:41:46'), ('3', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2017-12-02 09:42:20'), ('4', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:09:21'), ('5', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:10:05'), ('6', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:10:21'), ('7', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:13:15'), ('8', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:17:13'), ('9', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2017-12-02 10:17:19'), ('10', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:17:26'), ('11', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:18:20'), ('12', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:18:42'), ('13', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:37:17'), ('14', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:39:53'), ('15', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:40:30'), ('16', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:42:16'), ('17', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:43:49'), ('18', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 10:57:16'), ('19', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 11:04:10'), ('20', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 11:06:11'), ('21', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 11:14:03'), ('22', '127.0.0.1', 'admin/login/logout', 'admin', '系统管理', '用户退出系统成功', '2017-12-02 11:29:54'), ('23', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2017-12-02 11:29:59');
COMMIT;

-- ----------------------------
--  Table structure for `system_menu`
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `menu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_text` varchar(64) DEFAULT NULL,
  `menu_url` varchar(256) DEFAULT NULL,
  `menu_css` varchar(64) DEFAULT NULL,
  `menu_sort` int(11) DEFAULT NULL,
  `menu_parent` int(11) DEFAULT NULL,
  `menu_leaf` int(11) DEFAULT NULL,
  `menu_desc` varchar(256) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `system_menu`
-- ----------------------------
BEGIN;
INSERT INTO `system_menu` VALUES ('1', '管理面板', '/admin', 'fa fa-home', '1', '0', '1', null, '2017-05-25 14:31:29', '2017-04-07 07:54:30', null, null), ('4', '会员管理', '/admin/user', 'fa fa-user', '4', '0', '1', '用户管理', '2017-07-04 15:10:22', '2017-05-25 14:21:44', null, null), ('6', '内容管理', '', 'fa fa-send', '6', '0', '0', null, '2017-07-07 11:47:26', '2017-05-25 14:30:31', null, null), ('7', '权限管理', null, 'fa fa-key', '7', '0', '0', null, '2017-05-25 14:21:44', '2017-05-25 14:21:44', null, null), ('8', '系统配置', '', 'fa fa-cog', '8', '0', '0', null, '2017-05-25 14:21:44', '2017-05-25 14:02:32', null, null), ('62', '文章管理', '/admin/article', '', '5', '6', '1', null, '2017-04-07 07:58:20', '2017-04-07 07:58:20', null, null), ('63', '文章分类', '/admin/catalog', '', '6', '6', '1', null, '2017-04-07 07:57:47', '2017-04-07 07:57:47', null, null), ('64', '文章评论', '/admin/comment', '', '7', '6', '1', null, '2017-04-07 07:58:53', '2017-04-07 07:58:53', null, null), ('70', '菜单管理', '/admin/menu', '', '1', '7', '1', null, '2017-05-25 14:05:14', '2017-05-25 14:05:14', null, null), ('71', '角色管理', '/admin/role', '', '2', '7', '1', null, '2017-05-25 14:06:37', '2017-05-25 14:06:37', null, null), ('72', '角色成员管理', '/admin/roleMember', '', '3', '7', '1', null, '2017-05-25 14:08:36', '2017-05-25 14:08:36', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `system_role`
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `s_role_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `s_role_name` varchar(128) DEFAULT NULL,
  `s_role_desc` varchar(256) DEFAULT NULL,
  `s_role_sort` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `system_role`
-- ----------------------------
BEGIN;
INSERT INTO `system_role` VALUES ('1', '超级管理员', '超级管理员', '1', '2017-03-30 05:59:32', '2017-03-30 05:59:32', null, null), ('2', '管理员', '管理员', '2', '2017-03-30 05:59:49', '2017-03-30 05:59:49', null, null), ('4', '商品录入员', null, '3', '2017-07-09 09:32:21', '2017-07-09 09:32:21', null, null), ('5', '订单管理员', null, '4', '2017-07-09 09:34:04', '2017-07-09 09:34:04', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `system_role_member`
-- ----------------------------
DROP TABLE IF EXISTS `system_role_member`;
CREATE TABLE `system_role_member` (
  `s_role_id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `system_role_member`
-- ----------------------------
BEGIN;
INSERT INTO `system_role_member` VALUES ('1', '1', '2017-03-30 12:23:42', '2017-03-30 12:23:42', null, null), ('2', '1', null, null, null, null), ('4', '1', '2017-07-09 09:41:09', '2017-07-09 09:41:09', null, null), ('5', '1', null, null, null, null), ('5', '10004', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `system_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu` (
  `s_role_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_role_id`,`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `system_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `system_role_menu` VALUES ('1', '1', null, null, null, null), ('1', '4', null, null, null, null), ('1', '6', null, null, null, null), ('1', '7', null, null, null, null), ('1', '62', null, null, null, null), ('1', '63', null, null, null, null), ('1', '64', null, null, null, null), ('1', '70', null, null, null, null), ('1', '71', null, null, null, null), ('1', '72', null, null, null, null), ('2', '1', '2017-10-20 08:01:14', '2017-10-20 08:01:14', null, null), ('2', '4', '2017-10-20 08:01:14', '2017-10-20 08:01:14', null, null), ('2', '6', '2017-10-20 08:01:14', '2017-10-20 08:01:14', null, null), ('2', '7', '2017-10-20 08:01:14', '2017-10-20 08:01:14', null, null), ('2', '70', '2017-10-20 08:01:14', '2017-10-20 08:01:14', null, null), ('2', '71', '2017-10-20 08:01:14', '2017-10-20 08:01:14', null, null), ('2', '72', '2017-10-20 08:01:14', '2017-10-20 08:01:14', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `system_user`
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `sex` int(11) DEFAULT NULL,
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` datetime DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
--  Records of `system_user`
-- ----------------------------
BEGIN;
INSERT INTO `system_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '22222222', 'sdfsd@Qq.com1', '13888888855', null, 'dfgsdfgsfd', '27059', '2017-12-02 11:29:59', '1', '301,302,303,304', '0', null, '2015-11-13 15:14:22'), ('10004', 'test1', '6512bd43d9caa6e02c990b0a82652dca', null, null, '15135168660', '1', '', '0', null, '1', null, '0', null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
