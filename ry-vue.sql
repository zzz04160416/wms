/*
 Navicat Premium Data Transfer

 Source Server         : ruoyi
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 10/05/2026 16:11:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int(0) DEFAULT 1 COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'purchase_in', '采购入库表', NULL, NULL, 'PurchaseIn', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'in', '采购入库', 'ruoyi', 1, '0', '/', NULL, '110', '2026-04-14 15:19:08', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'stock', '', NULL, NULL, 'Stock', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'stock', NULL, 'ruoyi', 1, '0', '/', NULL, '110', '2026-04-17 11:58:42', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'outbound', '', NULL, NULL, 'Outbound', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'outbound', NULL, 'ruoyi', 1, '0', '/', NULL, '110', '2026-04-17 12:01:07', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'shelf', '货架信息表', NULL, NULL, 'Shelf', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'shelf', '货架信息', 'ruoyi', 1, '0', '/', NULL, '110', '2026-05-06 17:34:28', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(0) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '入库单号', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, 1, 'product_name', '商品名称', 'varchar(100)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, 1, 'specification', '规格型号', 'varchar(100)', 'String', 'specification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, 1, 'quantity', '数量', 'decimal(10,2)', 'BigDecimal', 'quantity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, 1, 'unit', '单位', 'varchar(20)', 'String', 'unit', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, 1, 'unit_price', '单价', 'decimal(10,2)', 'BigDecimal', 'unitPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, 1, 'total_price', '总金额', 'decimal(10,2)', 'BigDecimal', 'totalPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, 1, 'supplier', '供应商', 'varchar(100)', 'String', 'supplier', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, 1, 'storage_date', '入库日期', 'date', 'Date', 'storageDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, '110', '2026-04-14 15:19:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, 2, 'id', NULL, 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, 2, 'product_name', '产品名称', 'varchar(100)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, 2, 'specification', '规格型号', 'varchar(100)', 'String', 'specification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, 2, 'quantity', '当前库存数量', 'decimal(10,2)', 'BigDecimal', 'quantity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, 2, 'unit', '单位', 'varchar(20)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, 2, 'last_in_time', '最近入库时间', 'datetime', 'Date', 'lastInTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, 2, 'last_out_time', '最近出库时间', 'datetime', 'Date', 'lastOutTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, 2, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, 2, 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, '110', '2026-04-17 11:58:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, 3, 'id', NULL, 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, 3, 'product_name', '产品名称', 'varchar(100)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, 3, 'specification', '规格型号', 'varchar(100)', 'String', 'specification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, 3, 'quantity', '出库数量', 'decimal(10,2)', 'BigDecimal', 'quantity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, 3, 'unit', '单位', 'varchar(20)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, 3, 'out_date', '出库日期', 'date', 'Date', 'outDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 7, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, 3, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, 3, 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, '110', '2026-04-17 12:01:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 4, 'id', '货架ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '110', '2026-05-06 17:34:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 4, 'location_code', '库位编码，如：A01、B02', 'varchar(10)', 'String', 'locationCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, '110', '2026-05-06 17:34:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 4, 'location_name', '库位名称（可选）', 'varchar(50)', 'String', 'locationName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, '110', '2026-05-06 17:34:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 4, 'pos_x', '3D场景 X 坐标', 'decimal(10,2)', 'BigDecimal', 'posX', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, '110', '2026-05-06 17:34:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 4, 'pos_z', '3D场景 Z 坐标', 'decimal(10,2)', 'BigDecimal', 'posZ', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, '110', '2026-05-06 17:34:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 4, 'capacity', '最大容量（件数）', 'int', 'Long', 'capacity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, '110', '2026-05-06 17:34:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 4, 'status', '状态：0-禁用 1-正常 2-维修中', 'tinyint', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, '110', '2026-05-06 17:34:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, 4, 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, '110', '2026-05-06 17:34:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, 4, 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, '110', '2026-05-06 17:34:28', '', NULL);

-- ----------------------------
-- Table structure for outbound
-- ----------------------------
DROP TABLE IF EXISTS `outbound`;
CREATE TABLE `outbound`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `shelf_life` int(0) DEFAULT NULL,
  `quantity` int(0) DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `out_date` date DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'normal',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '库位编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of outbound
-- ----------------------------
INSERT INTO `outbound` VALUES (1, '矿泉水', NULL, NULL, NULL, 10, '箱', '2026-05-07', NULL, '2026-05-07 15:20:08', 'normal', NULL, NULL, NULL, NULL);
INSERT INTO `outbound` VALUES (2, '蓝莓', NULL, NULL, NULL, 10, '盒', '2026-05-09', NULL, '2026-05-09 11:16:47', 'normal', NULL, NULL, NULL, NULL);
INSERT INTO `outbound` VALUES (3, '西瓜', NULL, NULL, NULL, 190, '个', '2026-05-09', NULL, '2026-05-09 13:48:34', 'normal', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for purchase_in
-- ----------------------------
DROP TABLE IF EXISTS `purchase_in`;
CREATE TABLE `purchase_in`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品名称',
  `specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '规格型号',
  `production_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life` int(0) DEFAULT NULL COMMENT '保质期（天）',
  `quantity` int(0) DEFAULT NULL COMMENT '数量',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '单位',
  `storage_date` date DEFAULT NULL COMMENT '入库日期',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '库位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '入库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_in
-- ----------------------------
INSERT INTO `purchase_in` VALUES (6, '蓝莓', NULL, '2026-05-06', 30, 10, '盒', '2026-05-07', NULL, NULL, NULL, '2026-05-07 15:12:02', NULL, NULL, 'A1');
INSERT INTO `purchase_in` VALUES (7, '咖啡', NULL, '2026-05-01', 180, 5, '盒', '2026-05-07', NULL, NULL, NULL, '2026-05-07 15:15:33', NULL, NULL, 'A1');
INSERT INTO `purchase_in` VALUES (8, '矿泉水', NULL, '2026-04-01', 360, 10, '箱', '2026-05-07', NULL, NULL, NULL, '2026-05-07 15:19:28', NULL, NULL, 'A1');
INSERT INTO `purchase_in` VALUES (9, '西瓜', NULL, '2026-05-08', 15, 100, '个', '2026-05-09', NULL, NULL, NULL, '2026-05-09 11:17:44', NULL, NULL, 'A3');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shelf
-- ----------------------------
DROP TABLE IF EXISTS `shelf`;
CREATE TABLE `shelf`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '货架ID',
  `location_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库位编码，如：A01、B02',
  `location_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '库位名称（可选）',
  `pos_x` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '3D场景 X 坐标',
  `pos_z` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '3D场景 Z 坐标',
  `capacity` int(0) DEFAULT 1000 COMMENT '最大容量（件数）',
  `status` tinyint(0) DEFAULT 1 COMMENT '状态：0-禁用 1-正常 2-维修中',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_location_code`(`location_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '货架信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `shelf_life` int(0) DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `quantity` int(0) DEFAULT 0,
  `last_in_time` datetime(0) DEFAULT NULL,
  `last_out_time` datetime(0) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '库位',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_product_batch`(`location`, `product_name`, `production_date`, `shelf_life`, `unit`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES (2, '蓝莓', NULL, '2026-05-06', 30, '盒', 0, '2026-05-07 15:12:02', '2026-05-09 11:16:47', NULL, '2026-05-09 11:16:47', 'A1');
INSERT INTO `stock` VALUES (4, '咖啡', NULL, '2026-05-01', 180, '盒', 5, '2026-05-07 15:15:33', NULL, NULL, NULL, 'A1');
INSERT INTO `stock` VALUES (5, '矿泉水', NULL, '2026-04-01', 360, '箱', 10, '2026-05-07 15:19:28', '2026-05-07 15:20:08', NULL, '2026-05-07 15:20:08', 'A1');
INSERT INTO `stock` VALUES (6, '西瓜', NULL, '2026-05-08', 15, '个', 10, '2026-05-09 11:17:44', '2026-05-09 13:48:34', NULL, '2026-05-09 13:48:34', 'A3');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2026-04-12 19:44:49', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-04-12 19:44:49', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-04-12 19:44:49', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2026-04-12 19:44:49', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-04-12 19:44:49', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-04-12 19:44:49', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-04-12 19:44:49', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-04-12 19:44:49', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (100, '', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2026-04-13 20:32:58', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-04-12 19:44:49', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-04-12 19:44:49', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-04-12 19:44:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-04-12 19:44:49', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-04-12 19:44:48', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-04-12 19:44:49', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-04-12 19:44:49', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-04-12 19:44:49', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '异常信息',
  `start_time` datetime(0) DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime(0) DEFAULT NULL COMMENT '执行结束时间',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码已失效', '2026-04-12 20:28:49');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码已失效', '2026-04-12 20:28:49');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码已失效', '2026-04-12 20:28:52');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码已失效', '2026-04-12 20:28:58');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码已失效', '2026-04-12 20:35:34');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '用户不存在/密码错误', '2026-04-12 20:37:56');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-12 20:58:47');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-12 20:59:52');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-12 20:59:59');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '用户不存在/密码错误', '2026-04-12 21:01:43');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-12 21:01:52');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 14:51:11');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 15:01:44');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 15:27:51');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 15:30:39');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 15:34:32');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 15:35:34');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 15:37:41');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 15:39:40');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 15:48:54');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 19:12:04');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 19:39:11');
INSERT INTO `sys_logininfor` VALUES (122, '张三一', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 19:39:40');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 19:46:07');
INSERT INTO `sys_logininfor` VALUES (124, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 19:47:42');
INSERT INTO `sys_logininfor` VALUES (125, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 19:49:55');
INSERT INTO `sys_logininfor` VALUES (126, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 19:50:27');
INSERT INTO `sys_logininfor` VALUES (127, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 19:53:57');
INSERT INTO `sys_logininfor` VALUES (128, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 19:56:16');
INSERT INTO `sys_logininfor` VALUES (129, '15133915833', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:02:43');
INSERT INTO `sys_logininfor` VALUES (130, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:03:11');
INSERT INTO `sys_logininfor` VALUES (131, '17732527577', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:22:57');
INSERT INTO `sys_logininfor` VALUES (132, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:29:25');
INSERT INTO `sys_logininfor` VALUES (133, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:29:38');
INSERT INTO `sys_logininfor` VALUES (134, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:33:50');
INSERT INTO `sys_logininfor` VALUES (135, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码错误', '2026-04-13 20:37:14');
INSERT INTO `sys_logininfor` VALUES (136, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:37:18');
INSERT INTO `sys_logininfor` VALUES (137, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:43:08');
INSERT INTO `sys_logininfor` VALUES (138, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:43:18');
INSERT INTO `sys_logininfor` VALUES (139, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:45:23');
INSERT INTO `sys_logininfor` VALUES (140, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:45:43');
INSERT INTO `sys_logininfor` VALUES (141, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:48:12');
INSERT INTO `sys_logininfor` VALUES (142, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:49:48');
INSERT INTO `sys_logininfor` VALUES (143, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:53:36');
INSERT INTO `sys_logininfor` VALUES (144, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-13 20:55:07');
INSERT INTO `sys_logininfor` VALUES (145, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-14 14:48:04');
INSERT INTO `sys_logininfor` VALUES (146, '17732527577', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-14 14:49:11');
INSERT INTO `sys_logininfor` VALUES (147, '15133975866', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '用户不存在/密码错误', '2026-04-14 14:49:24');
INSERT INTO `sys_logininfor` VALUES (148, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-14 14:49:35');
INSERT INTO `sys_logininfor` VALUES (149, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-14 15:00:51');
INSERT INTO `sys_logininfor` VALUES (150, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-14 15:02:07');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '用户不存在/密码错误', '2026-04-14 15:18:45');
INSERT INTO `sys_logininfor` VALUES (152, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码错误', '2026-04-14 15:18:53');
INSERT INTO `sys_logininfor` VALUES (153, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-14 15:18:58');
INSERT INTO `sys_logininfor` VALUES (154, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码错误', '2026-04-14 15:26:01');
INSERT INTO `sys_logininfor` VALUES (155, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码错误', '2026-04-14 15:26:05');
INSERT INTO `sys_logininfor` VALUES (156, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码错误', '2026-04-14 15:26:11');
INSERT INTO `sys_logininfor` VALUES (157, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-14 15:26:19');
INSERT INTO `sys_logininfor` VALUES (158, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-14 15:31:28');
INSERT INTO `sys_logininfor` VALUES (159, '110', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-14 15:37:49');
INSERT INTO `sys_logininfor` VALUES (160, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-14 15:53:15');
INSERT INTO `sys_logininfor` VALUES (161, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '验证码错误', '2026-04-14 15:56:15');
INSERT INTO `sys_logininfor` VALUES (162, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-14 15:56:19');
INSERT INTO `sys_logininfor` VALUES (163, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-14 19:17:53');
INSERT INTO `sys_logininfor` VALUES (164, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-14 20:03:46');
INSERT INTO `sys_logininfor` VALUES (165, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-14 20:26:07');
INSERT INTO `sys_logininfor` VALUES (166, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '验证码错误', '2026-04-14 20:27:35');
INSERT INTO `sys_logininfor` VALUES (167, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-14 20:27:39');
INSERT INTO `sys_logininfor` VALUES (168, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-16 21:44:40');
INSERT INTO `sys_logininfor` VALUES (169, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-16 21:54:01');
INSERT INTO `sys_logininfor` VALUES (170, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-16 21:55:30');
INSERT INTO `sys_logininfor` VALUES (171, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '验证码错误', '2026-04-17 10:48:23');
INSERT INTO `sys_logininfor` VALUES (172, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 10:48:30');
INSERT INTO `sys_logininfor` VALUES (173, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 10:50:28');
INSERT INTO `sys_logininfor` VALUES (174, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 11:34:19');
INSERT INTO `sys_logininfor` VALUES (175, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 11:44:32');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '用户不存在/密码错误', '2026-04-17 11:58:14');
INSERT INTO `sys_logininfor` VALUES (177, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '验证码错误', '2026-04-17 11:58:21');
INSERT INTO `sys_logininfor` VALUES (178, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 11:58:24');
INSERT INTO `sys_logininfor` VALUES (179, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 12:09:57');
INSERT INTO `sys_logininfor` VALUES (180, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 12:13:20');
INSERT INTO `sys_logininfor` VALUES (181, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 12:24:55');
INSERT INTO `sys_logininfor` VALUES (182, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 12:31:51');
INSERT INTO `sys_logininfor` VALUES (183, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 12:44:02');
INSERT INTO `sys_logininfor` VALUES (184, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 12:45:33');
INSERT INTO `sys_logininfor` VALUES (185, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 13:01:44');
INSERT INTO `sys_logininfor` VALUES (186, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 13:45:29');
INSERT INTO `sys_logininfor` VALUES (187, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '验证码错误', '2026-04-17 16:20:01');
INSERT INTO `sys_logininfor` VALUES (188, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 16:20:05');
INSERT INTO `sys_logininfor` VALUES (189, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 16:43:14');
INSERT INTO `sys_logininfor` VALUES (190, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 16:53:05');
INSERT INTO `sys_logininfor` VALUES (191, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 17:09:56');
INSERT INTO `sys_logininfor` VALUES (192, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 18:17:34');
INSERT INTO `sys_logininfor` VALUES (193, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 19:49:38');
INSERT INTO `sys_logininfor` VALUES (194, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 20:48:37');
INSERT INTO `sys_logininfor` VALUES (195, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-17 21:47:41');
INSERT INTO `sys_logininfor` VALUES (196, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-04-30 14:13:23');
INSERT INTO `sys_logininfor` VALUES (197, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 15:03:03');
INSERT INTO `sys_logininfor` VALUES (198, '17732527577', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 15:03:34');
INSERT INTO `sys_logininfor` VALUES (199, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 15:03:59');
INSERT INTO `sys_logininfor` VALUES (200, '17732527577', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 15:15:41');
INSERT INTO `sys_logininfor` VALUES (201, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 15:25:40');
INSERT INTO `sys_logininfor` VALUES (202, '17732527578', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 15:26:26');
INSERT INTO `sys_logininfor` VALUES (203, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 15:36:16');
INSERT INTO `sys_logininfor` VALUES (204, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 15:38:01');
INSERT INTO `sys_logininfor` VALUES (205, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 15:38:10');
INSERT INTO `sys_logininfor` VALUES (206, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 16:08:36');
INSERT INTO `sys_logininfor` VALUES (207, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 17:00:08');
INSERT INTO `sys_logininfor` VALUES (208, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '验证码已失效', '2026-05-06 17:33:59');
INSERT INTO `sys_logininfor` VALUES (209, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 17:34:02');
INSERT INTO `sys_logininfor` VALUES (210, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-06 18:39:30');
INSERT INTO `sys_logininfor` VALUES (211, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '验证码错误', '2026-05-07 14:50:46');
INSERT INTO `sys_logininfor` VALUES (212, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-07 14:50:49');
INSERT INTO `sys_logininfor` VALUES (213, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-07 16:31:05');
INSERT INTO `sys_logininfor` VALUES (214, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 11:05:21');
INSERT INTO `sys_logininfor` VALUES (215, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 12:14:46');
INSERT INTO `sys_logininfor` VALUES (216, '17732527577', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '1', '验证码已失效', '2026-05-09 13:59:55');
INSERT INTO `sys_logininfor` VALUES (217, '17732527577', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 13:59:55');
INSERT INTO `sys_logininfor` VALUES (218, '110', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 14:11:11');
INSERT INTO `sys_logininfor` VALUES (219, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 13:51:59');
INSERT INTO `sys_logininfor` VALUES (220, '17732527577', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户已封禁，请联系管理员', '2026-05-10 13:53:54');
INSERT INTO `sys_logininfor` VALUES (221, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 13:54:07');
INSERT INTO `sys_logininfor` VALUES (222, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码已失效', '2026-05-10 14:21:20');
INSERT INTO `sys_logininfor` VALUES (223, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 14:21:24');
INSERT INTO `sys_logininfor` VALUES (224, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码已失效', '2026-05-10 14:40:03');
INSERT INTO `sys_logininfor` VALUES (225, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码错误', '2026-05-10 14:40:08');
INSERT INTO `sys_logininfor` VALUES (226, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 14:40:13');
INSERT INTO `sys_logininfor` VALUES (227, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 14:45:06');
INSERT INTO `sys_logininfor` VALUES (228, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 15:03:34');
INSERT INTO `sys_logininfor` VALUES (229, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 15:04:20');
INSERT INTO `sys_logininfor` VALUES (230, '110', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 15:40:13');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '路由名称',
  `is_frame` int(0) DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2023 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-04-12 19:44:47', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-04-12 19:44:47', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-04-12 19:44:47', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2026-04-12 19:44:47', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-04-12 19:44:47', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-04-12 19:44:47', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-04-12 19:44:47', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-04-12 19:44:47', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-04-12 19:44:47', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-04-12 19:44:47', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-04-12 19:44:47', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-04-12 19:44:47', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2026-04-12 19:44:47', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-04-12 19:44:47', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-04-12 19:44:47', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-04-12 19:44:47', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-04-12 19:44:47', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-04-12 19:44:47', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-04-12 19:44:47', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2026-04-12 19:44:47', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2026-04-12 19:44:47', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-04-12 19:44:47', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-04-12 19:44:47', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-04-12 19:44:47', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-04-12 19:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '采购入库', 3, 1, 'in', 'system/in/index', NULL, '', 1, 0, 'C', '0', '0', 'system:in:list', '#', 'admin', '2026-04-14 15:24:53', '', NULL, '采购入库菜单');
INSERT INTO `sys_menu` VALUES (2001, '采购入库查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:in:query', '#', 'admin', '2026-04-14 15:24:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '采购入库新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:in:add', '#', 'admin', '2026-04-14 15:24:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '采购入库修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:in:edit', '#', 'admin', '2026-04-14 15:24:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '采购入库删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:in:remove', '#', 'admin', '2026-04-14 15:24:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '采购入库导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:in:export', '#', 'admin', '2026-04-14 15:24:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '【请填写功能名称】', 3, 1, 'stock', 'system/stock/index', NULL, '', 1, 0, 'C', '0', '0', 'system:stock:list', '#', 'admin', '2026-04-17 12:00:58', '', NULL, '【请填写功能名称】菜单');
INSERT INTO `sys_menu` VALUES (2007, '【请填写功能名称】查询', 2006, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:stock:query', '#', 'admin', '2026-04-17 12:00:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '【请填写功能名称】新增', 2006, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:stock:add', '#', 'admin', '2026-04-17 12:00:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '【请填写功能名称】修改', 2006, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:stock:edit', '#', 'admin', '2026-04-17 12:00:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '【请填写功能名称】删除', 2006, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:stock:remove', '#', 'admin', '2026-04-17 12:00:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '【请填写功能名称】导出', 2006, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:stock:export', '#', 'admin', '2026-04-17 12:00:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '【请填写功能名称】', 3, 1, 'outbound', 'system/outbound/index', NULL, '', 1, 0, 'C', '0', '0', 'system:outbound:list', '#', 'admin', '2026-04-17 12:02:09', '', NULL, '【请填写功能名称】菜单');
INSERT INTO `sys_menu` VALUES (2013, '【请填写功能名称】查询', 2012, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:outbound:query', '#', 'admin', '2026-04-17 12:02:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '【请填写功能名称】新增', 2012, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:outbound:add', '#', 'admin', '2026-04-17 12:02:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '【请填写功能名称】修改', 2012, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:outbound:edit', '#', 'admin', '2026-04-17 12:02:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '【请填写功能名称】删除', 2012, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:outbound:remove', '#', 'admin', '2026-04-17 12:02:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '【请填写功能名称】导出', 2012, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:outbound:export', '#', 'admin', '2026-04-17 12:02:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '货架信息', 3, 1, 'shelf', 'system/shelf/index', NULL, '', 1, 0, 'C', '0', '0', 'system:shelf:list', '#', 'admin', '2026-05-06 18:09:14', '', NULL, '货架信息菜单');
INSERT INTO `sys_menu` VALUES (2019, '货架信息查询', 2018, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:shelf:query', '#', 'admin', '2026-05-06 18:09:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '货架信息新增', 2018, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:shelf:add', '#', 'admin', '2026-05-06 18:09:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '货架信息修改', 2018, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:shelf:edit', '#', 'admin', '2026-05-06 18:09:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '货架信息删除', 2018, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:shelf:remove', '#', 'admin', '2026-05-06 18:09:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '货架信息导出', 2018, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:shelf:export', '#', 'admin', '2026-05-06 18:09:14', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2026-04-12 19:44:49', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2026-04-12 19:44:49', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '若依开源框架介绍', '1', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE9A1B9E79BAEE4BB8BE7BB8D3C2F7370616E3E3C2F703E3C703E3C666F6E7420636F6C6F723D2223333333333333223E52756F5969E5BC80E6BA90E9A1B9E79BAEE698AFE4B8BAE4BC81E4B89AE794A8E688B7E5AE9AE588B6E79A84E5908EE58FB0E8849AE6898BE69EB6E6A186E69EB6EFBC8CE4B8BAE4BC81E4B89AE68993E980A0E79A84E4B880E7AB99E5BC8FE8A7A3E586B3E696B9E6A188EFBC8CE9998DE4BD8EE4BC81E4B89AE5BC80E58F91E68890E69CACEFBC8CE68F90E58D87E5BC80E58F91E69588E78E87E38082E4B8BBE8A681E58C85E68BACE794A8E688B7E7AEA1E79086E38081E8A792E889B2E7AEA1E79086E38081E983A8E997A8E7AEA1E79086E38081E88F9CE58D95E7AEA1E79086E38081E58F82E695B0E7AEA1E79086E38081E5AD97E585B8E7AEA1E79086E380813C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE5B297E4BD8DE7AEA1E790863C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E5AE9AE697B6E4BBBBE58AA13C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE380813C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE69C8DE58AA1E79B91E68EA7E38081E799BBE5BD95E697A5E5BF97E38081E6938DE4BD9CE697A5E5BF97E38081E4BBA3E7A081E7949FE68890E7AD89E58A9FE883BDE38082E585B6E4B8ADEFBC8CE8BF98E694AFE68C81E5A49AE695B0E68DAEE6BA90E38081E695B0E68DAEE69D83E99990E38081E59BBDE99985E58C96E380815265646973E7BC93E5AD98E38081446F636B6572E983A8E7BDB2E38081E6BB91E58AA8E9AA8CE8AF81E7A081E38081E7ACACE4B889E696B9E8AEA4E8AF81E799BBE5BD95E38081E58886E5B883E5BC8FE4BA8BE58AA1E380813C2F7370616E3E3C666F6E7420636F6C6F723D2223333333333333223EE58886E5B883E5BC8FE69687E4BBB6E5AD98E582A83C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E58886E5BA93E58886E8A1A8E5A484E79086E7AD89E68A80E69CAFE789B9E782B9E380823C2F7370616E3E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F666F727564612E67697465652E636F6D2F696D616765732F313737333933313834383334323433393033322F61346432323331335F313831353039352E706E6722207374796C653D2277696474683A20363470783B223E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE5AE98E7BD91E58F8AE6BC94E7A4BA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE5AE98E7BD91E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F72756F79692E7669703C2F613E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E3C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE69687E6A1A3E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F646F632E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F646F632E72756F79692E7669703C2F613E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E4B88DE58886E7A6BBE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F64656D6F2E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F64656D6F2E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E58886E7A6BBE78988E69CACE38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F7675652E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F7675652E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E5BEAEE69C8DE58AA1E78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F636C6F75642E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F636C6F75642E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E7A7BBE58AA8E7ABAFE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F68352E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F68352E72756F79692E7669703C2F613E3C2F703E3C703E3C6272207374796C653D22636F6C6F723A207267622834382C2034392C203531293B20666F6E742D66616D696C793A202671756F743B48656C766574696361204E6575652671756F743B2C2048656C7665746963612C20417269616C2C2073616E732D73657269663B20666F6E742D73697A653A20313270783B223E3C2F703E, '0', 'admin', '2026-04-12 19:44:49', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_read`;
CREATE TABLE `sys_notice_read`  (
  `read_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '已读主键',
  `notice_id` int(0) NOT NULL COMMENT '公告id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `read_time` datetime(0) NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`read_id`) USING BTREE,
  UNIQUE INDEX `uk_user_notice`(`user_id`, `notice_id`) USING BTREE COMMENT '同一用户同一公告只记录一次'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告已读记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '返回参数',
  `status` int(0) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 268 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2],\"status\":\"0\",\"userId\":100,\"userName\":\"张三\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:16:58', 98);
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100', '127.0.0.1', '内网IP', '[100] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:17:02', 1);
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2],\"status\":\"0\",\"userId\":101,\"userName\":\"张三\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:17:15', 82);
INSERT INTO `sys_oper_log` VALUES (103, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"\",\"nickName\":\"张三一\",\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2],\"status\":\"0\",\"userId\":102,\"userName\":\"张三一\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:17:41', 83);
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"\",\"nickName\":\"李四\",\"params\":{},\"phonenumber\":\"17732527577\",\"roleIds\":[2],\"status\":\"0\",\"userId\":103,\"userName\":\"李四\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:20:03', 83);
INSERT INTO `sys_oper_log` VALUES (105, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"\",\"nickName\":\"丽丽\",\"params\":{},\"phonenumber\":\"110\",\"roleIds\":[2],\"status\":\"0\",\"userId\":104,\"userName\":\"丽丽\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:22:29', 77);
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"\",\"nickName\":\"丽丽\",\"params\":{},\"phonenumber\":\"12345664566\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":104,\"userName\":\"丽丽\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:23:46', 26);
INSERT INTO `sys_oper_log` VALUES (107, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/101', '127.0.0.1', '内网IP', '[101] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:27:25', 20);
INSERT INTO `sys_oper_log` VALUES (108, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/102', '127.0.0.1', '内网IP', '[102] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:27:26', 17);
INSERT INTO `sys_oper_log` VALUES (109, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/103', '127.0.0.1', '内网IP', '[103] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:27:28', 23);
INSERT INTO `sys_oper_log` VALUES (110, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/104', '127.0.0.1', '内网IP', '[104] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 16:27:29', 17);
INSERT INTO `sys_oper_log` VALUES (111, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"\",\"nickName\":\"金微\",\"params\":{},\"phonenumber\":\"17732527577\",\"roleIds\":[2],\"status\":\"0\",\"userId\":105,\"userName\":\"金微\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 17:07:53', 78);
INSERT INTO `sys_oper_log` VALUES (112, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":100,\"email\":\"\",\"nickName\":\"金微\",\"params\":{},\"phonenumber\":\"17732527577\",\"roleIds\":[2],\"status\":\"0\",\"userName\":\"金微\"} ', '{\"msg\":\"新增用户\'金微\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2026-04-13 17:08:09', 4);
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":100,\"email\":\"\",\"nickName\":\"金微\",\"params\":{},\"phonenumber\":\"17732527578\",\"roleIds\":[2],\"status\":\"0\",\"userName\":\"金微\"} ', '{\"msg\":\"新增用户\'金微\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2026-04-13 17:08:16', 0);
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"\",\"nickName\":\"李四\",\"params\":{},\"phonenumber\":\"17732527578\",\"roleIds\":[2],\"status\":\"0\",\"userId\":106,\"userName\":\"李四\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 17:08:22', 74);
INSERT INTO `sys_oper_log` VALUES (115, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"17732527579\",\"roleIds\":[2],\"status\":\"0\",\"userId\":107,\"userName\":\"张三\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 17:16:33', 80);
INSERT INTO `sys_oper_log` VALUES (116, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":100,\"email\":\"\",\"nickName\":\"金微\",\"params\":{},\"phonenumber\":\"17732527577\",\"roleIds\":[2],\"status\":\"0\",\"userName\":\"金微\"} ', '{\"msg\":\"新增用户\'金微\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2026-04-13 17:35:03', 2);
INSERT INTO `sys_oper_log` VALUES (117, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/105', '127.0.0.1', '内网IP', '[105] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 19:19:11', 12);
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/106', '127.0.0.1', '内网IP', '[106] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 19:19:37', 21);
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"\",\"nickName\":\"金微\",\"params\":{},\"phonenumber\":\"15533998899\",\"status\":\"0\",\"userId\":108,\"userName\":\"金微\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 19:26:34', 79);
INSERT INTO `sys_oper_log` VALUES (120, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"\",\"nickName\":\"张三一\",\"params\":{},\"phonenumber\":\"15133915833\",\"status\":\"0\",\"userId\":109,\"userName\":\"张三一\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 19:39:32', 61);
INSERT INTO `sys_oper_log` VALUES (121, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, '110', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"110\",\"email\":\"\",\"nickName\":\"金微\",\"params\":{},\"phonenumber\":\"15133985899\",\"status\":\"0\",\"userId\":110,\"userName\":\"15133985899\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 20:02:10', 81);
INSERT INTO `sys_oper_log` VALUES (122, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, '110', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"110\",\"email\":\"\",\"nickName\":\"用户\",\"params\":{},\"phonenumber\":\"15166998899\",\"status\":\"0\",\"userId\":111,\"userName\":\"15166998899\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 20:12:25', 79);
INSERT INTO `sys_oper_log` VALUES (123, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, '110', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"110\",\"email\":\"\",\"nickName\":\"金微\",\"params\":{},\"phonenumber\":\"17732527577\",\"status\":\"0\",\"userId\":112,\"userName\":\"17732527577\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-13 20:21:49', 82);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, '110', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"purchase_in\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 15:19:08', 79);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, '110', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"purchase_in\"}', NULL, 0, NULL, '2026-04-14 15:19:25', 151);
INSERT INTO `sys_oper_log` VALUES (126, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-14 16:03:27\",\"id\":1,\"params\":{},\"productName\":\"水\",\"quantity\":3,\"remark\":\"\",\"specification\":\"箱\",\"storageDate\":\"2026-04-14\",\"supplier\":\"李四\",\"totalPrice\":0,\"unit\":\"箱\",\"unitPrice\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 16:03:27', 18);
INSERT INTO `sys_oper_log` VALUES (127, '采购入库', 3, 'com.ruoyi.system.controller.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/in/1', '127.0.0.1', '内网IP', '[1] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 16:03:37', 12);
INSERT INTO `sys_oper_log` VALUES (128, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-14 19:18:19\",\"id\":2,\"params\":{},\"productName\":\"矿泉水\",\"quantity\":2,\"remark\":\"\",\"specification\":\"\",\"storageDate\":\"2026-04-14\",\"supplier\":\"张三\",\"totalPrice\":0,\"unit\":\"个\",\"unitPrice\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 19:18:19', 31);
INSERT INTO `sys_oper_log` VALUES (129, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-14 19:20:50\",\"id\":3,\"params\":{},\"productName\":\"方便面\",\"quantity\":1,\"remark\":\"\",\"specification\":\"\",\"storageDate\":\"2026-04-14\",\"supplier\":\"李四\",\"totalPrice\":0,\"unit\":\"个\",\"unitPrice\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 19:20:50', 11);
INSERT INTO `sys_oper_log` VALUES (130, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-14 19:21:50\",\"id\":4,\"params\":{},\"productName\":\"水\",\"quantity\":1,\"remark\":\"\",\"specification\":\"\",\"storageDate\":\"2026-04-14\",\"supplier\":\"李四\",\"totalPrice\":0,\"unit\":\"箱\",\"unitPrice\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 19:21:50', 12);
INSERT INTO `sys_oper_log` VALUES (131, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-14 20:07:02\",\"id\":5,\"params\":{},\"productName\":\"饼干\",\"quantity\":1,\"remark\":\"\",\"specification\":\"\",\"storageDate\":\"2026-04-14\",\"supplier\":\"李四\",\"totalPrice\":0,\"unit\":\"箱\",\"unitPrice\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 20:07:02', 15);
INSERT INTO `sys_oper_log` VALUES (132, '采购入库', 3, 'com.ruoyi.system.controller.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/in/2', '127.0.0.1', '内网IP', '[2] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 20:12:06', 17);
INSERT INTO `sys_oper_log` VALUES (133, '采购入库', 3, 'com.ruoyi.system.controller.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/in/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 20:12:14', 11);
INSERT INTO `sys_oper_log` VALUES (134, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-14 20:12:54\",\"id\":6,\"params\":{},\"productName\":\"小熊饼干\",\"quantity\":20,\"remark\":\"\",\"specification\":\"\",\"storageDate\":\"2026-04-14\",\"supplier\":\"李四\",\"totalPrice\":0,\"unit\":\"包\",\"unitPrice\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 20:12:54', 23);
INSERT INTO `sys_oper_log` VALUES (135, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":6,\"params\":{},\"productName\":\"小熊饼干\",\"quantity\":20,\"remark\":\"{\\\"productionDate\\\":\\\"2026-04-01\\\",\\\"expiryDate\\\":\\\"2026-06-30\\\"}\",\"specification\":\"90\",\"storageDate\":\"2026-04-14\",\"supplier\":\"李四\",\"totalPrice\":0,\"unit\":\"包\",\"unitPrice\":0,\"updateTime\":\"2026-04-14 20:21:22\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 20:21:22', 2);
INSERT INTO `sys_oper_log` VALUES (136, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":4,\"params\":{},\"productName\":\"水\",\"quantity\":20,\"remark\":\"{\\\"productionDate\\\":\\\"2026-04-01\\\",\\\"expiryDate\\\":\\\"2026-09-28\\\"}\",\"specification\":\"180\",\"storageDate\":\"2026-04-14\",\"supplier\":\"李四\",\"totalPrice\":0,\"unit\":\"箱\",\"unitPrice\":0,\"updateTime\":\"2026-04-14 20:24:23\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 20:24:23', 15);
INSERT INTO `sys_oper_log` VALUES (137, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":5,\"params\":{},\"productName\":\"饼干\",\"quantity\":1,\"remark\":\"{\\\"productionDate\\\":\\\"2026-04-01\\\",\\\"expiryDate\\\":\\\"2026-04-11\\\"}\",\"specification\":\"10\",\"storageDate\":\"2026-04-14\",\"supplier\":\"李四\",\"totalPrice\":0,\"unit\":\"箱\",\"unitPrice\":0,\"updateTime\":\"2026-04-14 20:24:33\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-14 20:24:33', 19);
INSERT INTO `sys_oper_log` VALUES (138, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-16 21:45:30\",\"params\":{},\"productName\":\"酸奶\",\"quantity\":9,\"remark\":\"{\\\"productionDate\\\":\\\"2026-04-01\\\",\\\"expiryDate\\\":\\\"2026-04-25\\\"}\",\"specification\":\"24\",\"storageDate\":\"2026-04-16\",\"supplier\":\"\",\"totalPrice\":0,\"unit\":\"盒\",\"unitPrice\":0} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier\' doesn\'t have a default value\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,             specification,             quantity,             unit,             unit_price,             total_price,                          storage_date,             remark,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'supplier\' doesn\'t have a default value\n; Field \'supplier\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier\' doesn\'t have a default value', '2026-04-16 21:45:31', 50);
INSERT INTO `sys_oper_log` VALUES (139, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-16 21:45:35\",\"params\":{},\"productName\":\"酸奶\",\"quantity\":9,\"remark\":\"{\\\"productionDate\\\":\\\"2026-04-01\\\",\\\"expiryDate\\\":\\\"2026-04-25\\\"}\",\"specification\":\"24\",\"storageDate\":\"2026-04-16\",\"supplier\":\"\",\"totalPrice\":0,\"unit\":\"盒\",\"unitPrice\":0} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier\' doesn\'t have a default value\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,             specification,             quantity,             unit,             unit_price,             total_price,                          storage_date,             remark,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'supplier\' doesn\'t have a default value\n; Field \'supplier\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier\' doesn\'t have a default value', '2026-04-16 21:45:35', 15);
INSERT INTO `sys_oper_log` VALUES (140, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-16 21:45:42\",\"params\":{},\"productName\":\"酸奶\",\"quantity\":9,\"remark\":\"{\\\"productionDate\\\":\\\"2026-04-01\\\",\\\"expiryDate\\\":\\\"2026-04-25\\\"}\",\"specification\":\"24\",\"storageDate\":\"2026-04-16\",\"supplier\":\"\",\"totalPrice\":0,\"unit\":\"盒\",\"unitPrice\":0} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier\' doesn\'t have a default value\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,             specification,             quantity,             unit,             unit_price,             total_price,                          storage_date,             remark,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'supplier\' doesn\'t have a default value\n; Field \'supplier\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier\' doesn\'t have a default value', '2026-04-16 21:45:42', 0);
INSERT INTO `sys_oper_log` VALUES (141, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-16 21:47:41\",\"id\":7,\"params\":{},\"productName\":\"酸奶\",\"quantity\":9,\"remark\":\"{\\\"productionDate\\\":\\\"2026-04-01\\\",\\\"expiryDate\\\":\\\"2026-04-25\\\"}\",\"specification\":\"24\",\"storageDate\":\"2026-04-16\",\"supplier\":\"\",\"totalPrice\":0,\"unit\":\"盒\",\"unitPrice\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-16 21:47:41', 2);
INSERT INTO `sys_oper_log` VALUES (142, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":7,\"params\":{},\"productName\":\"酸奶\",\"quantity\":8,\"remark\":\"{\\\"productionDate\\\":\\\"2026-04-01\\\",\\\"expiryDate\\\":\\\"2026-04-25\\\"}\",\"specification\":\"24\",\"storageDate\":\"2026-04-16\",\"totalPrice\":0,\"unit\":\"盒\",\"unitPrice\":0,\"updateTime\":\"2026-04-16 21:49:27\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-16 21:49:27', 20);
INSERT INTO `sys_oper_log` VALUES (143, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-16 21:55:14\",\"id\":8,\"params\":{},\"productName\":\"零食\",\"quantity\":10,\"remark\":\"{\\\"productionDate\\\":\\\"2026-04-01\\\",\\\"expiryDate\\\":\\\"2026-05-01\\\"}\",\"specification\":\"30\",\"storageDate\":\"2026-04-16\",\"supplier\":\"\",\"totalPrice\":0,\"unit\":\"箱\",\"unitPrice\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-16 21:55:14', 14);
INSERT INTO `sys_oper_log` VALUES (144, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 11:47:22\",\"params\":{},\"productName\":\"小熊饼干\",\"quantity\":10,\"storageDate\":\"2026-04-17\",\"type\":\"out\",\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'unit_price\' doesn\'t have a default value\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,                          quantity,             unit,                                       storage_date,                          type,                          create_time )           values ( ?,                          ?,             ?,                                       ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'unit_price\' doesn\'t have a default value\n; Field \'unit_price\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'unit_price\' doesn\'t have a default value', '2026-04-17 11:47:22', 26);
INSERT INTO `sys_oper_log` VALUES (145, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 11:48:11\",\"id\":9,\"params\":{},\"productName\":\"小熊饼干\",\"quantity\":10,\"storageDate\":\"2026-04-17\",\"type\":\"out\",\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 11:48:11', 10);
INSERT INTO `sys_oper_log` VALUES (146, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 11:49:44\",\"id\":10,\"params\":{},\"productName\":\"小熊饼干\",\"quantity\":10,\"storageDate\":\"2026-04-17\",\"type\":\"out\",\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 11:49:44', 4);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, '110', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"stock\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 11:58:42', 65);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, '110', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stock\"}', NULL, 0, NULL, '2026-04-17 11:58:46', 148);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, '110', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"outbound\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 12:01:07', 187);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, '110', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"outbound\"}', NULL, 0, NULL, '2026-04-17 12:01:08', 133);
INSERT INTO `sys_oper_log` VALUES (151, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 12:10:43\",\"id\":11,\"params\":{},\"productName\":\"鼠标\",\"quantity\":10,\"storageDate\":\"2026-04-17\",\"totalPrice\":2000,\"type\":\"in\",\"unit\":\"个\",\"unitPrice\":200} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 12:10:43', 18);
INSERT INTO `sys_oper_log` VALUES (152, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 12:25:29\",\"id\":12,\"params\":{},\"productName\":\"水\",\"quantity\":10,\"storageDate\":\"2026-04-17\",\"totalPrice\":200,\"type\":\"in\",\"unit\":\"箱\",\"unitPrice\":20} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 12:25:29', 13);
INSERT INTO `sys_oper_log` VALUES (153, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 12:29:44\",\"id\":13,\"params\":{},\"productName\":\"咖啡\",\"quantity\":10,\"storageDate\":\"2026-04-17\",\"totalPrice\":200,\"type\":\"in\",\"unit\":\"包\",\"unitPrice\":20} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 12:29:44', 163);
INSERT INTO `sys_oper_log` VALUES (154, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 12:32:09\",\"id\":14,\"params\":{},\"productName\":\"手机\",\"quantity\":1,\"storageDate\":\"2026-04-17\",\"totalPrice\":1000,\"type\":\"in\",\"unit\":\"个\",\"unitPrice\":1000} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 12:32:10', 5);
INSERT INTO `sys_oper_log` VALUES (155, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 12:48:57\",\"id\":15,\"params\":{},\"productName\":\"水\",\"quantity\":10,\"storageDate\":\"2026-04-17\",\"totalPrice\":100,\"type\":\"in\",\"unit\":\"箱\",\"unitPrice\":10} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 12:48:57', 16);
INSERT INTO `sys_oper_log` VALUES (156, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":16,\"params\":{},\"productName\":\"饼干\",\"quantity\":20,\"storageDate\":\"2026-04-17\",\"totalPrice\":400,\"type\":\"in\",\"unit\":\"包\",\"unitPrice\":20} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'specification\' not found. Available parameters are [arg1, arg0, param1, param2]', '2026-04-17 13:02:39', 28);
INSERT INTO `sys_oper_log` VALUES (157, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":17,\"params\":{},\"productName\":\"饼干\",\"quantity\":20,\"storageDate\":\"2026-04-17\",\"totalPrice\":400,\"type\":\"in\",\"unit\":\"包\",\"unitPrice\":20} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 13:03:51', 24);
INSERT INTO `sys_oper_log` VALUES (158, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":18,\"params\":{},\"productName\":\"水\",\"quantity\":20,\"storageDate\":\"2026-04-17\",\"totalPrice\":40,\"type\":\"in\",\"unit\":\"箱\",\"unitPrice\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 13:08:16', 23);
INSERT INTO `sys_oper_log` VALUES (159, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":19,\"params\":{},\"productName\":\"测试产品\",\"quantity\":100,\"specification\":\"标准规格\",\"storageDate\":\"2026-04-17\",\"totalPrice\":1000,\"type\":\"in\",\"unit\":\"个\",\"unitPrice\":10} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 13:09:26', 20);
INSERT INTO `sys_oper_log` VALUES (160, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"params\":{},\"productName\":\"咖啡\",\"quantity\":20,\"storageDate\":\"yyyy-04-Fr\",\"totalPrice\":20,\"type\":\"in\",\"unit\":\"包\",\"unitPrice\":1} ', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'yyyy-04-Fr\' for column \'storage_date\' at row 1\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,                          quantity,             unit,             unit_price,             total_price,             storage_date,                          type )           values ( ?,                          ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'yyyy-04-Fr\' for column \'storage_date\' at row 1\n; Data truncation: Incorrect date value: \'yyyy-04-Fr\' for column \'storage_date\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'yyyy-04-Fr\' for column \'storage_date\' at row 1', '2026-04-17 13:32:55', 43);
INSERT INTO `sys_oper_log` VALUES (161, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"params\":{},\"productName\":\"水\",\"quantity\":20,\"storageDate\":\"2026-04-Fr\",\"totalPrice\":40,\"type\":\"in\",\"unit\":\"瓶\",\"unitPrice\":2} ', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'2026-04-Fr\' for column \'storage_date\' at row 1\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,                          quantity,             unit,             unit_price,             total_price,             storage_date,                          type )           values ( ?,                          ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'2026-04-Fr\' for column \'storage_date\' at row 1\n; Data truncation: Incorrect date value: \'2026-04-Fr\' for column \'storage_date\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'2026-04-Fr\' for column \'storage_date\' at row 1', '2026-04-17 13:34:16', 3);
INSERT INTO `sys_oper_log` VALUES (162, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":20,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-15 00:00:00\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-17\",\"type\":\"in\",\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 13:45:09', 27);
INSERT INTO `sys_oper_log` VALUES (163, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"params\":{},\"productName\":\"手机\",\"productionDate\":\"2026-04-17 00:00:00\",\"quantity\":1,\"shelfLife\":10000,\"storageDate\":\"2026-04-16T16:00:00.000Z\",\"type\":\"in\",\"unit\":\"个\"} ', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'2026-04-16T16:00:00.000Z\' for column \'storage_date\' at row 1\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,                          quantity,             unit,             production_date,             shelf_life,             storage_date,                          type )           values ( ?,                          ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'2026-04-16T16:00:00.000Z\' for column \'storage_date\' at row 1\n; Data truncation: Incorrect date value: \'2026-04-16T16:00:00.000Z\' for column \'storage_date\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'2026-04-16T16:00:00.000Z\' for column \'storage_date\' at row 1', '2026-04-17 13:52:58', 4);
INSERT INTO `sys_oper_log` VALUES (164, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"params\":{},\"productName\":\"手机\",\"productionDate\":\"2026-04-17 00:00:00\",\"quantity\":1,\"shelfLife\":100,\"storageDate\":\"2026-04-16T16:00:00.000Z\",\"type\":\"in\",\"unit\":\"个\"} ', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'2026-04-16T16:00:00.000Z\' for column \'storage_date\' at row 1\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,                          quantity,             unit,             production_date,             shelf_life,             storage_date,                          type )           values ( ?,                          ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'2026-04-16T16:00:00.000Z\' for column \'storage_date\' at row 1\n; Data truncation: Incorrect date value: \'2026-04-16T16:00:00.000Z\' for column \'storage_date\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'2026-04-16T16:00:00.000Z\' for column \'storage_date\' at row 1', '2026-04-17 13:53:02', 3);
INSERT INTO `sys_oper_log` VALUES (165, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"params\":{},\"productName\":\"水\",\"productionDate\":\"2026-04-16\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-14\",\"type\":\"in\",\"unit\":\"箱\"} ', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalArgumentException: invalid comparison: java.util.Date and java.lang.String', '2026-04-17 13:55:51', 11);
INSERT INTO `sys_oper_log` VALUES (166, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 16:29:25\",\"id\":1,\"outDate\":\"2026-04-17\",\"params\":{},\"productName\":\"测试出库\",\"quantity\":10,\"specification\":\"规格A\",\"unit\":\"个\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:29:25', 163);
INSERT INTO `sys_oper_log` VALUES (167, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 16:33:03\",\"id\":2,\"outDate\":\"2026-04-20\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":10} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:33:03', 173);
INSERT INTO `sys_oper_log` VALUES (168, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":21,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-14\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-16\",\"type\":\"in\",\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:37:11', 27);
INSERT INTO `sys_oper_log` VALUES (169, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 16:37:36\",\"id\":3,\"outDate\":\"2026-04-16\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":10,\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:37:36', 16);
INSERT INTO `sys_oper_log` VALUES (170, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2026-04-17 13:45:09\",\"id\":20,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-15\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-15\",\"type\":\"in\",\"unit\":\"包\",\"updateBy\":\"\",\"updateTime\":\"2026-04-17 13:45:09\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:38:01', 10);
INSERT INTO `sys_oper_log` VALUES (171, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2026-04-17 16:37:11\",\"id\":21,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-14\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-16\",\"type\":\"in\",\"unit\":\"包\",\"updateBy\":\"\",\"updateTime\":\"2026-04-17 16:37:11\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:38:08', 2);
INSERT INTO `sys_oper_log` VALUES (172, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2026-04-17 13:45:09\",\"id\":20,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-15\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-15\",\"type\":\"in\",\"unit\":\"包\",\"updateBy\":\"\",\"updateTime\":\"2026-04-17 16:38:01\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:38:12', 0);
INSERT INTO `sys_oper_log` VALUES (173, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":22,\"params\":{},\"productName\":\"水\",\"productionDate\":\"2026-04-07\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-17\",\"type\":\"in\",\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:43:46', 24);
INSERT INTO `sys_oper_log` VALUES (174, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2026-04-17 13:45:09\",\"id\":20,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-15\",\"quantity\":1,\"shelfLife\":180,\"storageDate\":\"2026-04-15\",\"type\":\"in\",\"unit\":\"包\",\"updateBy\":\"\",\"updateTime\":\"2026-04-17 16:38:01\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:44:01', 16);
INSERT INTO `sys_oper_log` VALUES (175, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2026-04-17 13:45:09\",\"id\":20,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-15\",\"quantity\":30,\"shelfLife\":180,\"storageDate\":\"2026-04-15\",\"type\":\"in\",\"unit\":\"包\",\"updateBy\":\"\",\"updateTime\":\"2026-04-17 16:44:01\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:47:04', 18);
INSERT INTO `sys_oper_log` VALUES (176, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2026-04-17 13:45:09\",\"id\":20,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-15\",\"quantity\":1,\"shelfLife\":180,\"storageDate\":\"2026-04-15\",\"type\":\"in\",\"unit\":\"包\",\"updateBy\":\"\",\"updateTime\":\"2026-04-17 16:47:03\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:51:20', 32);
INSERT INTO `sys_oper_log` VALUES (177, '采购入库', 2, 'com.ruoyi.system.controller.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2026-04-17 13:45:09\",\"id\":20,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-15\",\"quantity\":100,\"shelfLife\":180,\"storageDate\":\"2026-04-15\",\"type\":\"in\",\"unit\":\"包\",\"updateBy\":\"\",\"updateTime\":\"2026-04-17 16:51:19\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:52:44', 15);
INSERT INTO `sys_oper_log` VALUES (178, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"id\":23,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-14\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-17\",\"type\":\"in\",\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 16:53:48', 26);
INSERT INTO `sys_oper_log` VALUES (179, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-07\",\"quantity\":10,\"shelfLife\":180,\"type\":\"in\",\"unit\":\"箱\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'storage_date\' doesn\'t have a default value\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,                          quantity,             unit,             production_date,             shelf_life,                                       type )           values ( ?,                          ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'storage_date\' doesn\'t have a default value\n; Field \'storage_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'storage_date\' doesn\'t have a default value', '2026-04-17 17:05:35', 181);
INSERT INTO `sys_oper_log` VALUES (180, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-15\",\"quantity\":10,\"type\":\"in\",\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'storage_date\' doesn\'t have a default value\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PurchaseInMapper.insertPurchaseIn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into purchase_in          ( product_name,                          quantity,             unit,             production_date,                                                    type )           values ( ?,                          ?,             ?,             ?,                                                    ? )\r\n### Cause: java.sql.SQLException: Field \'storage_date\' doesn\'t have a default value\n; Field \'storage_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'storage_date\' doesn\'t have a default value', '2026-04-17 17:08:16', 0);
INSERT INTO `sys_oper_log` VALUES (181, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"productName\":\"水\",\"productionDate\":\"2026-04-15 00:00:00\",\"quantity\":1,\"storageDate\":\"2026-04-17 18:22:55.47\",\"type\":\"in\",\"unit\":\"瓶\"} ', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createTime\' in \'class com.ruoyi.system.domain.PurchaseIn\'', '2026-04-17 18:22:55', 17);
INSERT INTO `sys_oper_log` VALUES (182, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"productName\":\"咖啡\",\"productionDate\":\"2026-04-07 00:00:00\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-17 19:49:56.375\",\"type\":\"in\",\"unit\":\"包\"} ', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createTime\' in \'class com.ruoyi.system.domain.PurchaseIn\'', '2026-04-17 19:49:56', 15);
INSERT INTO `sys_oper_log` VALUES (183, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"productName\":\"咖啡\",\"productionDate\":\"2026-04-07 00:00:00\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-17 19:51:32.146\",\"type\":\"in\",\"unit\":\"包\"} ', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createTime\' in \'class com.ruoyi.system.domain.PurchaseIn\'', '2026-04-17 19:51:32', 1);
INSERT INTO `sys_oper_log` VALUES (184, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"productName\":\"咖啡\",\"productionDate\":\"2026-04-07 00:00:00\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-17 19:51:37.805\",\"type\":\"in\",\"unit\":\"包\"} ', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createTime\' in \'class com.ruoyi.system.domain.PurchaseIn\'', '2026-04-17 19:51:37', 2);
INSERT INTO `sys_oper_log` VALUES (185, '采购入库', 1, 'com.ruoyi.system.controller.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/in', '127.0.0.1', '内网IP', '{\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-07 00:00:00\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-17 19:55:08.878\",\"type\":\"in\",\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\PurchaseInMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO purchase_in(             product_name,             specification,             production_date,             shelf_life,             quantity,             unit,             storage_date,             type,             remark,             create_by,             create_time         )         VALUES(                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   NOW()               )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2026-04-17 19:55:09', 174);
INSERT INTO `sys_oper_log` VALUES (186, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-14 00:00:00\",\"quantity\":10,\"shelfLife\":180,\"type\":\"in\",\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:06:47', 171);
INSERT INTO `sys_oper_log` VALUES (187, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 20:14:43.287\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":5,\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'outbound_no\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\OutboundMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO outbound(             outbound_no,             product_name,             specification,             quantity,             unit,             outbound_type,             recipient,             remark,             create_by,             create_time,             status         )         VALUES (                    ?,                    ?,                    ?,                    ?,                    ?,                    ?,                    ?,                    ?,                    ?,                    NOW(),                    \'0\'                )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'outbound_no\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'outbound_no\' in \'field list\'', '2026-04-17 20:14:43', 181);
INSERT INTO `sys_oper_log` VALUES (188, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 20:17:53.722\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":5,\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\OutboundMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO outbound(             product_name,             specification,             quantity,             unit,             out_date,             remark,             create_by,             create_time         )         VALUES(                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   NOW()               )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2026-04-17 20:17:53', 174);
INSERT INTO `sys_oper_log` VALUES (189, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 20:18:08.288\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":5,\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\OutboundMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO outbound(             product_name,             specification,             quantity,             unit,             out_date,             remark,             create_by,             create_time         )         VALUES(                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   NOW()               )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2026-04-17 20:18:08', 16);
INSERT INTO `sys_oper_log` VALUES (190, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 20:18:48.622\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":5,\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\OutboundMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO outbound(             product_name,             specification,             quantity,             unit,             out_date,             remark,             create_by,             create_time         )         VALUES(                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   NOW()               )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2026-04-17 20:18:48', 15);
INSERT INTO `sys_oper_log` VALUES (191, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 20:19:05.478\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":5,\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\OutboundMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO outbound(             product_name,             specification,             quantity,             unit,             out_date,             remark,             create_by,             create_time         )         VALUES(                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   NOW()               )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2026-04-17 20:19:05', 173);
INSERT INTO `sys_oper_log` VALUES (192, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 20:19:15.322\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":5,\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\OutboundMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO outbound(             product_name,             specification,             quantity,             unit,             out_date,             remark,             create_by,             create_time         )         VALUES(                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   NOW()               )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2026-04-17 20:19:15', 0);
INSERT INTO `sys_oper_log` VALUES (193, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":1,\"outDate\":\"2026-04-17 20:20:38.549\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":5,\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:20:38', 171);
INSERT INTO `sys_oper_log` VALUES (194, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":10,\"unit\":\"包\"} ', NULL, 1, '库存不足！当前库存：0', '2026-04-17 20:28:37', 24);
INSERT INTO `sys_oper_log` VALUES (195, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"咖啡\",\"quantity\":1,\"unit\":\"包\"} ', NULL, 1, '库存不足！当前库存：0', '2026-04-17 20:28:49', 0);
INSERT INTO `sys_oper_log` VALUES (196, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":2,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-16 00:00:00\",\"quantity\":5,\"shelfLife\":180,\"type\":\"in\",\"unit\":\"包\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\StockMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO stock(             product_name,             specification,             quantity,             unit,             production_date,             shelf_life,             last_in_time,             create_time         )         VALUES(                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   NOW(),                   NOW()               )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'', '2026-04-17 20:29:19', 50);
INSERT INTO `sys_oper_log` VALUES (197, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":3,\"params\":{},\"productName\":\"咖啡\",\"productionDate\":\"2026-04-16 00:00:00\",\"quantity\":5,\"shelfLife\":180,\"type\":\"in\",\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:30:00', 14);
INSERT INTO `sys_oper_log` VALUES (198, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/1', '127.0.0.1', '内网IP', '[1] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:30:10', 16);
INSERT INTO `sys_oper_log` VALUES (199, '出库管理', 3, 'com.ruoyi.system.controller.OutboundController.remove()', 'DELETE', 1, '110', NULL, '/system/outbound/1', '127.0.0.1', '内网IP', '[1] ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_time\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\StockMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE stock         SET quantity = quantity + ?,          last_in_time = NOW(),                    update_time = NOW()         WHERE product_name = ?         AND specification = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_time\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'update_time\' in \'field list\'', '2026-04-17 20:30:16', 7);
INSERT INTO `sys_oper_log` VALUES (200, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":4,\"params\":{},\"productName\":\"水\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":5,\"shelfLife\":5,\"type\":\"in\",\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:30:32', 23);
INSERT INTO `sys_oper_log` VALUES (201, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":2,\"unit\":\"瓶\"} ', NULL, 1, '库存不足！当前库存：0', '2026-04-17 20:30:46', 0);
INSERT INTO `sys_oper_log` VALUES (202, '出库管理', 3, 'com.ruoyi.system.controller.OutboundController.remove()', 'DELETE', 1, '110', NULL, '/system/outbound/1', '127.0.0.1', '内网IP', '[1] ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_time\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\StockMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE stock         SET quantity = quantity + ?,          last_in_time = NOW(),                    update_time = NOW()         WHERE product_name = ?         AND specification = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_time\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'update_time\' in \'field list\'', '2026-04-17 20:31:00', 0);
INSERT INTO `sys_oper_log` VALUES (203, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":5,\"params\":{},\"productName\":\"水\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":5,\"shelfLife\":3,\"type\":\"in\",\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:34:11', 151);
INSERT INTO `sys_oper_log` VALUES (204, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":1,\"unit\":\"瓶\"} ', NULL, 1, '库存不足！当前库存：0', '2026-04-17 20:34:24', 0);
INSERT INTO `sys_oper_log` VALUES (205, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":1,\"unit\":\"瓶\"} ', NULL, 1, '未找到该产品的库存记录，请先入库！产品名：水，规格：null', '2026-04-17 20:36:12', 16);
INSERT INTO `sys_oper_log` VALUES (206, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":1,\"unit\":\"瓶\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\OutboundMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO outbound(             product_name,             quantity,             unit,             out_date,             remark,             create_by,             create_time         )         VALUES(                   ?,                   ?,                   ?,                   NOW(),                   ?,                   ?,                   NOW()               )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2026-04-17 20:45:44', 177);
INSERT INTO `sys_oper_log` VALUES (207, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":2,\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":1,\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:47:05', 161);
INSERT INTO `sys_oper_log` VALUES (208, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":6,\"params\":{},\"productName\":\"水\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":1,\"shelfLife\":3,\"type\":\"in\",\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:57:21', 162);
INSERT INTO `sys_oper_log` VALUES (209, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":3,\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":1,\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:57:48', 18);
INSERT INTO `sys_oper_log` VALUES (210, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/6', '127.0.0.1', '内网IP', '[6] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:58:15', 9);
INSERT INTO `sys_oper_log` VALUES (211, '出库管理', 3, 'com.ruoyi.system.controller.OutboundController.remove()', 'DELETE', 1, '110', NULL, '/system/outbound/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:58:20', 20);
INSERT INTO `sys_oper_log` VALUES (212, '出库管理', 3, 'com.ruoyi.system.controller.OutboundController.remove()', 'DELETE', 1, '110', NULL, '/system/outbound/2', '127.0.0.1', '内网IP', '[2] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:58:30', 15);
INSERT INTO `sys_oper_log` VALUES (213, '出库管理', 3, 'com.ruoyi.system.controller.OutboundController.remove()', 'DELETE', 1, '110', NULL, '/system/outbound/1', '127.0.0.1', '内网IP', '[1] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:58:35', 23);
INSERT INTO `sys_oper_log` VALUES (214, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:58:40', 9);
INSERT INTO `sys_oper_log` VALUES (215, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/5', '127.0.0.1', '内网IP', '[5] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:58:51', 14);
INSERT INTO `sys_oper_log` VALUES (216, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/4', '127.0.0.1', '内网IP', '[4] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:58:55', 19);
INSERT INTO `sys_oper_log` VALUES (217, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":4,\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":3,\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:59:06', 12);
INSERT INTO `sys_oper_log` VALUES (218, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":10,\"unit\":\"瓶\"} ', NULL, 1, '库存不足！当前总库存：5', '2026-04-17 20:59:22', 17);
INSERT INTO `sys_oper_log` VALUES (219, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":7,\"params\":{},\"productName\":\"手机\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":20,\"shelfLife\":1000,\"type\":\"in\",\"unit\":\"台\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 20:59:47', 0);
INSERT INTO `sys_oper_log` VALUES (220, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":5,\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"手机\",\"quantity\":1,\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:00:09', 16);
INSERT INTO `sys_oper_log` VALUES (221, '出库管理', 3, 'com.ruoyi.system.controller.OutboundController.remove()', 'DELETE', 1, '110', NULL, '/system/outbound/5', '127.0.0.1', '内网IP', '[5] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:00:46', 3);
INSERT INTO `sys_oper_log` VALUES (222, '出库管理', 2, 'com.ruoyi.system.controller.OutboundController.edit()', 'PUT', 1, '110', NULL, '/system/outbound', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 20:59:06\",\"id\":4,\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":2,\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:01:02', 3);
INSERT INTO `sys_oper_log` VALUES (223, '出库管理', 2, 'com.ruoyi.system.controller.OutboundController.edit()', 'PUT', 1, '110', NULL, '/system/outbound', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 20:59:06\",\"id\":4,\"outDate\":\"2026-04-17 00:00:00\",\"params\":{},\"productName\":\"水\",\"quantity\":4,\"unit\":\"瓶\",\"updateTime\":\"2026-04-17 21:01:02\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:01:14', 10);
INSERT INTO `sys_oper_log` VALUES (224, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":8,\"params\":{},\"productName\":\"水\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":20,\"shelfLife\":3,\"type\":\"in\",\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:03:24', 6);
INSERT INTO `sys_oper_log` VALUES (225, '入库管理', 2, 'com.ruoyi.web.controller.system.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":8,\"productName\":\"水\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":50,\"shelfLife\":3,\"storageDate\":\"2026-04-17 00:00:00\",\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:09:41', 34);
INSERT INTO `sys_oper_log` VALUES (226, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/8', '127.0.0.1', '内网IP', '[8] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:09:46', 8);
INSERT INTO `sys_oper_log` VALUES (227, '出库管理', 2, 'com.ruoyi.system.controller.OutboundController.edit()', 'PUT', 1, '110', NULL, '/system/outbound', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 20:59:06\",\"id\":4,\"outDate\":\"2026-04-17 00:00:00\",\"productName\":\"水\",\"quantity\":1,\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:09:54', 20);
INSERT INTO `sys_oper_log` VALUES (228, '出库管理', 2, 'com.ruoyi.system.controller.OutboundController.edit()', 'PUT', 1, '110', NULL, '/system/outbound', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-04-17 20:59:06\",\"id\":4,\"outDate\":\"2026-04-17 00:00:00\",\"productName\":\"水\",\"quantity\":4,\"unit\":\"瓶\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:10:00', 22);
INSERT INTO `sys_oper_log` VALUES (229, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/7', '127.0.0.1', '内网IP', '[7] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:10:10', 16);
INSERT INTO `sys_oper_log` VALUES (230, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":9,\"productName\":\"矿泉水\",\"productionDate\":\"2025-05-01 00:00:00\",\"quantity\":100,\"shelfLife\":360,\"unit\":\"箱\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:12:00', 16);
INSERT INTO `sys_oper_log` VALUES (231, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-04-17 00:00:00\",\"productName\":\"矿泉水\",\"quantity\":1,\"remark\":\"自己喝\",\"unit\":\"瓶\"} ', NULL, 1, '未找到该产品的库存记录，请检查产品名称和单位是否匹配！', '2026-04-17 21:13:37', 11);
INSERT INTO `sys_oper_log` VALUES (232, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":6,\"outDate\":\"2026-04-17 00:00:00\",\"productName\":\"矿泉水\",\"quantity\":1,\"remark\":\"自己喝\",\"unit\":\"箱\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:13:58', 1);
INSERT INTO `sys_oper_log` VALUES (233, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":10,\"productName\":\"饼干\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":10,\"shelfLife\":180,\"storageDate\":\"2026-04-17 00:00:00\",\"unit\":\"包\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-17 21:48:10', 18);
INSERT INTO `sys_oper_log` VALUES (234, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":11,\"productName\":\"鸡蛋\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":100,\"shelfLife\":180,\"storageDate\":\"2026-04-30 00:00:00\",\"unit\":\"盘\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-30 14:15:58', 18);
INSERT INTO `sys_oper_log` VALUES (235, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":7,\"outDate\":\"2026-04-30 00:00:00\",\"productName\":\"矿泉水\",\"quantity\":5,\"unit\":\"箱\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-30 14:16:52', 17);
INSERT INTO `sys_oper_log` VALUES (236, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":8,\"outDate\":\"2026-04-30 00:00:00\",\"productName\":\"矿泉水\",\"quantity\":94,\"unit\":\"箱\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-04-30 14:17:21', 14);
INSERT INTO `sys_oper_log` VALUES (237, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, '110', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"\",\"nickName\":\"莹莹\",\"params\":{},\"phonenumber\":\"17732527577\",\"status\":\"0\",\"userName\":\"17732527577\"} ', '{\"msg\":\"新增用户\'17732527577\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2026-05-06 15:26:01', 1);
INSERT INTO `sys_oper_log` VALUES (238, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, '110', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"110\",\"email\":\"\",\"nickName\":\"莹莹\",\"params\":{},\"phonenumber\":\"17732527578\",\"status\":\"0\",\"userId\":113,\"userName\":\"17732527578\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-06 15:26:06', 81);
INSERT INTO `sys_oper_log` VALUES (239, '出库管理', 3, 'com.ruoyi.system.controller.OutboundController.remove()', 'DELETE', 1, '110', NULL, '/system/outbound/8', '127.0.0.1', '内网IP', '[8] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-06 17:10:37', 49);
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, '110', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"shelf\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-06 17:34:28', 57);
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, '110', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"shelf\"}', NULL, 0, NULL, '2026-05-06 17:34:35', 161);
INSERT INTO `sys_oper_log` VALUES (242, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":12,\"location\":\"A1\",\"productName\":\"手机\",\"productionDate\":\"2026-05-06 00:00:00\",\"quantity\":10,\"shelfLife\":10000,\"storageDate\":\"2026-05-06 00:00:00\",\"unit\":\"部\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'手机-2026-05-06-10000-部\' for key \'stock.uk_product_batch\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\StockMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO stock(             location,             product_name,             quantity,             unit,             production_date,             shelf_life,             last_in_time         )         VALUES(                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   NOW()               )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'手机-2026-05-06-10000-部\' for key \'stock.uk_product_batch\'\n; Duplicate entry \'手机-2026-05-06-10000-部\' for key \'stock.uk_product_batch\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'手机-2026-05-06-10000-部\' for key \'stock.uk_product_batch\'', '2026-05-06 18:39:50', 74);
INSERT INTO `sys_oper_log` VALUES (243, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":13,\"location\":\"A1\",\"productName\":\"手机pro\",\"productionDate\":\"2026-05-06 00:00:00\",\"quantity\":10,\"shelfLife\":10000,\"storageDate\":\"2026-05-06 00:00:00\",\"unit\":\"部\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'手机pro-2026-05-06-10000-部\' for key \'stock.uk_product_batch\'\r\n### The error may exist in file [D:\\vue3\\RuoYi-Vue-springboot2\\ruoyi-admin\\target\\classes\\mapper\\system\\StockMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO stock(             location,             product_name,             quantity,             unit,             production_date,             shelf_life,             last_in_time         )         VALUES(                   ?,                   ?,                   ?,                   ?,                   ?,                   ?,                   NOW()               )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'手机pro-2026-05-06-10000-部\' for key \'stock.uk_product_batch\'\n; Duplicate entry \'手机pro-2026-05-06-10000-部\' for key \'stock.uk_product_batch\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'手机pro-2026-05-06-10000-部\' for key \'stock.uk_product_batch\'', '2026-05-06 18:40:44', 29);
INSERT INTO `sys_oper_log` VALUES (244, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":14,\"location\":\"A1\",\"productName\":\"手机pro\",\"productionDate\":\"2026-05-06 00:00:00\",\"quantity\":10,\"shelfLife\":10000,\"storageDate\":\"2026-05-06 00:00:00\",\"unit\":\"部\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-06 18:42:50', 194);
INSERT INTO `sys_oper_log` VALUES (245, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/13', '127.0.0.1', '内网IP', '[13] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-06 18:42:54', 33);
INSERT INTO `sys_oper_log` VALUES (246, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/14', '127.0.0.1', '内网IP', '[14] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-06 18:43:07', 13);
INSERT INTO `sys_oper_log` VALUES (247, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/12', '127.0.0.1', '内网IP', '[12] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-06 18:43:14', 16);
INSERT INTO `sys_oper_log` VALUES (248, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"outDate\":\"2026-05-06 00:00:00\",\"productName\":\"手机\",\"quantity\":5,\"unit\":\"部\"} ', NULL, 1, '未找到该产品的库存记录，请检查产品名称和单位是否匹配！', '2026-05-06 18:43:33', 9);
INSERT INTO `sys_oper_log` VALUES (249, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":9,\"outDate\":\"2026-05-06 00:00:00\",\"productName\":\"手机pro\",\"quantity\":5,\"unit\":\"部\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-06 18:43:48', 15);
INSERT INTO `sys_oper_log` VALUES (250, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":10,\"outDate\":\"2026-05-06 00:00:00\",\"productName\":\"手机pro\",\"quantity\":5,\"unit\":\"部\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-06 18:44:02', 24);
INSERT INTO `sys_oper_log` VALUES (251, '入库管理', 2, 'com.ruoyi.web.controller.system.PurchaseInController.edit()', 'PUT', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":11,\"productName\":\"鸡蛋\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":50,\"shelfLife\":180,\"storageDate\":\"2026-04-30 00:00:00\",\"unit\":\"盘\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 14:51:18', 32);
INSERT INTO `sys_oper_log` VALUES (252, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":15,\"location\":\"A1\",\"productName\":\"蓝莓\",\"productionDate\":\"2026-05-01 00:00:00\",\"quantity\":10,\"shelfLife\":30,\"storageDate\":\"2026-05-07 00:00:00\",\"unit\":\"盒\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 14:52:01', 43);
INSERT INTO `sys_oper_log` VALUES (253, '入库管理', 3, 'com.ruoyi.web.controller.system.PurchaseInController.remove()', 'DELETE', 1, '110', NULL, '/system/purchaseIn/15', '127.0.0.1', '内网IP', '[15] ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'location\' not found. Available parameters are [unit, productionDate, shelfLife, param3, param4, productName, param1, param2]', '2026-05-07 14:55:44', 11);
INSERT INTO `sys_oper_log` VALUES (254, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":1,\"location\":\"A1\",\"productName\":\"蓝莓\",\"productionDate\":\"2026-05-07 00:00:00\",\"quantity\":10,\"shelfLife\":30,\"storageDate\":\"2026-05-07 00:00:00\",\"unit\":\"盒\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'location\' not found. Available parameters are [unit, productionDate, shelfLife, param3, param4, productName, param1, param2]', '2026-05-07 14:57:18', 32);
INSERT INTO `sys_oper_log` VALUES (255, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":2,\"location\":\"A1\",\"productName\":\"蓝莓\",\"productionDate\":\"2026-05-07 00:00:00\",\"quantity\":10,\"shelfLife\":30,\"storageDate\":\"2026-05-07 00:00:00\",\"unit\":\"盒\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'location\' not found. Available parameters are [unit, productionDate, shelfLife, param3, param4, productName, param1, param2]', '2026-05-07 14:57:41', 166);
INSERT INTO `sys_oper_log` VALUES (256, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":3,\"location\":\"A10\",\"productName\":\"蓝莓\",\"productionDate\":\"2026-05-07 00:00:00\",\"quantity\":8,\"shelfLife\":30,\"storageDate\":\"2026-05-07 00:00:00\",\"unit\":\"盒\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'location\' not found. Available parameters are [unit, productionDate, shelfLife, param3, param4, productName, param1, param2]', '2026-05-07 14:58:01', 7);
INSERT INTO `sys_oper_log` VALUES (257, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":4,\"location\":\"A1\",\"productName\":\"蓝莓\",\"productionDate\":\"2026-05-07 00:00:00\",\"quantity\":8,\"shelfLife\":30,\"storageDate\":\"2026-05-07 00:00:00\",\"unit\":\"盒\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'location\' not found. Available parameters are [unit, productionDate, shelfLife, param3, param4, productName, param1, param2]', '2026-05-07 14:58:05', 17);
INSERT INTO `sys_oper_log` VALUES (258, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":5,\"location\":\"A1\",\"productName\":\"蓝莓\",\"productionDate\":\"2026-05-07 00:00:00\",\"quantity\":10,\"shelfLife\":30,\"storageDate\":\"2026-05-07 00:00:00\",\"unit\":\"盒\"} ', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'location\' not found. Available parameters are [unit, productionDate, shelfLife, param3, param4, productName, param1, param2]', '2026-05-07 14:58:50', 16);
INSERT INTO `sys_oper_log` VALUES (259, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":6,\"location\":\"A1\",\"productName\":\"蓝莓\",\"productionDate\":\"2026-05-06 00:00:00\",\"quantity\":10,\"shelfLife\":30,\"storageDate\":\"2026-05-07 00:00:00\",\"unit\":\"盒\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 15:12:02', 165);
INSERT INTO `sys_oper_log` VALUES (260, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":7,\"location\":\"A1\",\"productName\":\"咖啡\",\"productionDate\":\"2026-05-01 00:00:00\",\"quantity\":5,\"shelfLife\":180,\"storageDate\":\"2026-05-07 00:00:00\",\"unit\":\"盒\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 15:15:33', 165);
INSERT INTO `sys_oper_log` VALUES (261, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":8,\"location\":\"A1\",\"productName\":\"矿泉水\",\"productionDate\":\"2026-04-01 00:00:00\",\"quantity\":10,\"shelfLife\":360,\"storageDate\":\"2026-05-07 00:00:00\",\"unit\":\"箱\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 15:19:28', 163);
INSERT INTO `sys_oper_log` VALUES (262, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":1,\"outDate\":\"2026-05-07 00:00:00\",\"productName\":\"矿泉水\",\"quantity\":10,\"unit\":\"箱\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 15:20:08', 28);
INSERT INTO `sys_oper_log` VALUES (263, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":2,\"outDate\":\"2026-05-09 00:00:00\",\"productName\":\"蓝莓\",\"quantity\":10,\"unit\":\"盒\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 11:16:47', 34);
INSERT INTO `sys_oper_log` VALUES (264, '入库管理', 1, 'com.ruoyi.web.controller.system.PurchaseInController.add()', 'POST', 1, '110', NULL, '/system/purchaseIn', '127.0.0.1', '内网IP', '{\"id\":9,\"location\":\"A3\",\"productName\":\"西瓜\",\"productionDate\":\"2026-05-08 00:00:00\",\"quantity\":100,\"shelfLife\":15,\"storageDate\":\"2026-05-09 00:00:00\",\"unit\":\"个\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 11:17:44', 36);
INSERT INTO `sys_oper_log` VALUES (265, '出库管理', 1, 'com.ruoyi.system.controller.OutboundController.add()', 'POST', 1, '110', NULL, '/system/outbound/add', '127.0.0.1', '内网IP', '{\"id\":3,\"outDate\":\"2026-05-09 00:00:00\",\"productName\":\"西瓜\",\"quantity\":190,\"unit\":\"个\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 13:48:34', 184);
INSERT INTO `sys_oper_log` VALUES (266, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, '110', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"\",\"params\":{},\"phonenumber\":\"17732527577\",\"status\":\"1\",\"updateBy\":\"110\",\"userId\":112,\"userName\":\"17732527577\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 13:53:42', 19);
INSERT INTO `sys_oper_log` VALUES (267, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, '110', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"\",\"params\":{},\"phonenumber\":\"17732527577\",\"status\":\"0\",\"updateBy\":\"110\",\"userId\":112,\"userName\":\"17732527577\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 14:06:55', 34);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2026-04-12 19:44:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2026-04-12 19:44:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2026-04-12 19:44:47', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `idx_phonenumber`(`phonenumber`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, NULL, '110', '管理员', '00', '', '', '0', '', '$2a$10$7qZpyTLcA2hVBGW6SZ5zzuC.9egp/EIX4fp3Ki0HIKyE0EMLAS3JC', '0', '0', '127.0.0.1', '2026-05-10 15:40:13', NULL, 'admin', '2026-04-13 15:23:16', 'admin', '2026-04-13 15:23:16', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (107, 2);

SET FOREIGN_KEY_CHECKS = 1;
