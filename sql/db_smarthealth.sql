-- MySQL dump 10.13  Distrib 5.7.44, for osx10.19 (x86_64)
--
-- Host: localhost    Database: db_smarthealth
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'t_material','必备材料信息',NULL,NULL,'Material','crud','element-ui','com.ruoyi.system','system','material','必备材料','cairbin','0','/','{\"parentMenuId\":2000}','admin','2024-09-05 23:30:01','','2024-09-05 23:34:35','必备材料信息'),(2,'t_company','药品公司信息','t_company_policy','company_id','Company','sub','element-ui','com.ruoyi.system','system','company','药品公司','cairbin','0','/','{\"parentMenuId\":\"2007\"}','admin','2024-09-06 00:16:08','','2024-09-06 00:21:20','药品公司信息'),(3,'t_company_policy','公司政策',NULL,NULL,'CompanyPolicy','crud','element-ui','com.ruoyi.system','system','policy','公司政策','cairbin','0','/','{}','admin','2024-09-06 00:16:08','','2024-09-06 00:17:49','公司政策'),(4,'t_drug','药品信息',NULL,NULL,'Drug','crud','element-ui','com.ruoyi.system','system','drug','药物信息','cairbin','0','/','{\"parentMenuId\":2007}','admin','2024-09-06 01:10:14','','2024-09-06 01:12:19','药品信息'),(5,'t_drug_sale','药品商店关系',NULL,NULL,'DrugSale','crud','element-ui','com.ruoyi.system','system','sale','药品商店关系','cairbin','0','/','{}','admin','2024-09-06 01:10:14','','2024-09-06 01:13:12','药品商店关系'),(6,'t_sale','商店信息',NULL,NULL,'Sale','crud','element-ui','com.ruoyi.system','system','sale','商店信息','cairbin','0','/','{\"parentMenuId\":\"2007\"}','admin','2024-09-06 01:10:14','','2024-09-06 01:39:01','商店信息'),(11,'t_china','城市信息管理','','','China','tree','element-ui','com.ruoyi.system','system','china','城市管理','ruoyi','0','/','{\"treeCode\":\"city_id\",\"treeName\":\"name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"2026\"}','admin','2024-09-06 03:45:40','','2024-09-06 03:46:52','城市信息管理'),(12,'t_medical_policy','医保政策管理','t_china','city_id','MedicalPolicy','sub','element-ui','com.ruoyi.system','system','policy','医保政策管理','cairbin','0','/','{\"parentMenuId\":2000}','admin','2024-09-06 03:51:49','','2024-09-06 03:58:33','医保政策管理');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'id','编号','bigint(20)','Long','id','1','1','0','0','1',NULL,NULL,'EQ','input','',1,'admin','2024-09-05 23:30:01','','2024-09-05 23:34:35'),(2,1,'title','标题','varchar(255)','String','title','0','0','0','1','1','1','1','EQ','input','',2,'admin','2024-09-05 23:30:01','','2024-09-05 23:34:35'),(3,1,'message','材料信息','text','String','message','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2024-09-05 23:30:01','','2024-09-05 23:34:35'),(4,1,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2024-09-05 23:30:01','','2024-09-05 23:34:35'),(5,1,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',5,'admin','2024-09-05 23:30:01','','2024-09-05 23:34:35'),(6,2,'company_id','公司ID','bigint(20)','Long','companyId','1','1','0','0','1',NULL,NULL,'EQ','input','',1,'admin','2024-09-06 00:16:08','','2024-09-06 00:21:20'),(7,2,'company_name','公司名称','varchar(255)','String','companyName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2024-09-06 00:16:08','','2024-09-06 00:21:20'),(8,2,'company_phone','公司电话','varchar(255)','String','companyPhone','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-09-06 00:16:08','','2024-09-06 00:21:20'),(9,2,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2024-09-06 00:16:08','','2024-09-06 00:21:20'),(10,2,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',5,'admin','2024-09-06 00:16:08','','2024-09-06 00:21:20'),(11,3,'id','政策ID','bigint(20)','Long','id','1','1','0','0','1',NULL,NULL,'EQ','input','',1,'admin','2024-09-06 00:16:08','','2024-09-06 00:17:49'),(12,3,'company_id','公司ID','bigint(20)','Long','companyId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2024-09-06 00:16:08','','2024-09-06 00:17:49'),(13,3,'title','政策标题','varchar(255)','String','title','0','0','0','1','1','1','1','LIKE','input','',3,'admin','2024-09-06 00:16:08','','2024-09-06 00:17:49'),(14,3,'message','政策内容','text','String','message','0','0','0','1','1','1','1','LIKE','textarea','',4,'admin','2024-09-06 00:16:08','','2024-09-06 00:17:49'),(15,3,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2024-09-06 00:16:08','','2024-09-06 00:17:49'),(16,4,'drug_id','药品ID','bigint(20)','Long','drugId','1','1','0','0','1',NULL,NULL,'EQ','input','',1,'admin','2024-09-06 01:10:14','','2024-09-06 01:12:19'),(17,4,'drug_img','药品图片URL','varchar(255)','String','drugImg','0','0','0','1','1','1','0','EQ','input','',2,'admin','2024-09-06 01:10:14','','2024-09-06 01:12:19'),(18,4,'drug_info','药品成分','varchar(255)','String','drugInfo','0','0','0','1','1','1','1','LIKE','input','',3,'admin','2024-09-06 01:10:14','','2024-09-06 01:12:19'),(19,4,'drug_effect','药品功效','varchar(255)','String','drugEffect','0','0','0','1','1','1','1','LIKE','input','',4,'admin','2024-09-06 01:10:14','','2024-09-06 01:12:19'),(20,4,'drug_name','药品名称','varchar(255)','String','drugName','0','0','0','1','1','1','1','LIKE','input','',5,'admin','2024-09-06 01:10:14','','2024-09-06 01:12:19'),(21,4,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2024-09-06 01:10:14','','2024-09-06 01:12:19'),(22,5,'id','ID','bigint(20)','Long','id','1','1','0','0','1',NULL,NULL,'EQ','input','',1,'admin','2024-09-06 01:10:14','','2024-09-06 01:13:12'),(23,5,'sale_id','药店ID','bigint(20)','Long','saleId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2024-09-06 01:10:14','','2024-09-06 01:13:12'),(24,5,'drug_id','药品ID','bigint(20)','Long','drugId','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-09-06 01:10:14','','2024-09-06 01:13:12'),(25,6,'sale_id','药店ID','bigint(20)','Long','saleId','1','1','0','0','1',NULL,NULL,'EQ','input','',1,'admin','2024-09-06 01:10:14','','2024-09-06 01:39:01'),(26,6,'sale_name','药店名称','varchar(255)','String','saleName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2024-09-06 01:10:14','','2024-09-06 01:39:01'),(27,6,'sale_phone','联系电话','varchar(255)','String','salePhone','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-09-06 01:10:14','','2024-09-06 01:39:01'),(28,6,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2024-09-06 01:10:14','','2024-09-06 01:39:01'),(29,6,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',5,'admin','2024-09-06 01:10:14','','2024-09-06 01:39:01'),(48,11,'city_id','省/市/县ID','bigint(20)','Long','cityId','1','1','0','0','1',NULL,NULL,'EQ','input','',1,'admin','2024-09-06 03:45:40','','2024-09-06 03:46:52'),(49,11,'name','名称','varchar(40)','String','name','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2024-09-06 03:45:40','','2024-09-06 03:46:52'),(50,11,'parent_id','父级ID','bigint(20)','Long','parentId','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-09-06 03:45:40','','2024-09-06 03:46:52'),(51,12,'id','ID','bigint(20)','Long','id','1','1','0','0','1',NULL,NULL,'EQ','input','',1,'admin','2024-09-06 03:51:49','','2024-09-06 03:58:33'),(52,12,'code','政策编号','int(11)','Long','code','0','0','0','1','1','1','1','EQ','input','',2,'admin','2024-09-06 03:51:49','','2024-09-06 03:58:33'),(53,12,'title','政策标题','varchar(255)','String','title','0','0','0','1','1','1','1','LIKE','input','',3,'admin','2024-09-06 03:51:49','','2024-09-06 03:58:33'),(54,12,'message','政策内容','text','String','message','0','0','0','1','1','1','1','LIKE','textarea','',4,'admin','2024-09-06 03:51:49','','2024-09-06 03:58:33'),(55,12,'city_id','城市ID','bigint(20)','Long','cityId','0','0','0','0','0','1','1','EQ','select','',5,'admin','2024-09-06 03:51:49','','2024-09-06 03:58:33'),(56,12,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2024-09-06 03:51:49','','2024-09-06 03:58:33'),(57,12,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',7,'admin','2024-09-06 03:51:49','','2024-09-06 03:58:33');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-09-05 23:16:18','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-09-05 23:16:18','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-09-05 23:16:18','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-09-05 23:16:18','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-09-05 23:16:18','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-09-05 23:16:18','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','Jvav医院',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-05 23:16:17','admin','2024-09-06 06:00:50'),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-05 23:16:17','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-09-05 23:16:17','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-05 23:16:17','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-09-05 23:16:17','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-05 23:16:17','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','2','admin','2024-09-05 23:16:17','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2024-09-05 23:16:17','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2024-09-05 23:16:17','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-09-05 23:16:17','',NULL),(200,100,'0,100','门诊部',1,'cairbin','13132113121','exp@exp.com','0','0','admin','2024-09-06 06:01:49','',NULL),(201,100,'0,100','管理中心',2,'cairbin','13111111111','exp@exp.com','0','0','admin','2024-09-06 06:02:17','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-09-05 23:16:18','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-09-05 23:16:18','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-09-05 23:16:18','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-09-05 23:16:18','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-09-05 23:16:18','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-09-05 23:16:18','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-09-05 23:16:18','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-09-05 23:16:18','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-09-05 23:16:18','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-09-05 23:16:18','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-09-05 23:16:18','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-09-05 23:16:18','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-09-05 23:16:18','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-09-05 23:16:18','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-09-05 23:16:18','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-09-05 23:16:18','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-09-05 23:16:18','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-09-05 23:16:18','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-09-05 23:16:18','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-09-05 23:16:18','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-09-05 23:16:18','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-09-05 23:16:18','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-09-05 23:16:18','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-09-05 23:16:18','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-09-05 23:16:18','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-09-05 23:16:18','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-09-05 23:16:18','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-09-05 23:16:18','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-09-05 23:16:18','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-09-05 23:16:18','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-09-05 23:16:18','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-09-05 23:16:18','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-09-05 23:16:18','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-09-05 23:16:18','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-09-05 23:16:18','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-09-05 23:16:18','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-09-05 23:16:18','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-09-05 23:16:18','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-09-05 23:16:18','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-09-05 23:16:18','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-09-05 23:16:18','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-09-05 23:16:18','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-05 23:29:51'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-06 00:14:43'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-06 01:09:42'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-06 02:46:51'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','退出成功','2024-09-06 05:19:14'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-06 05:19:24'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-06 05:57:28'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','退出成功','2024-09-06 06:06:01'),(108,'doctor','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-06 06:06:16'),(109,'doctor','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','退出成功','2024-09-06 06:13:44'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-06 06:13:48'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','退出成功','2024-09-06 06:18:22'),(112,'manager','127.0.0.1','内网IP','Chrome 12','Mac OS X','1','用户不存在/密码错误','2024-09-06 06:18:30'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-06 06:18:42'),(114,'manager','127.0.0.1','内网IP','Chrome 12','Mac OS X','1','用户不存在/密码错误','2024-09-06 06:18:56'),(115,'manager','127.0.0.1','内网IP','Chrome 12','Mac OS X','1','验证码错误','2024-09-06 06:19:01'),(116,'manager','127.0.0.1','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-09-06 06:19:04');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2051 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2024-09-05 23:16:18','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2024-09-05 23:16:18','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2024-09-05 23:16:18','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','0','1','','guide','admin','2024-09-05 23:16:18','admin','2024-09-05 23:33:31','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2024-09-05 23:16:18','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2024-09-05 23:16:18','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-09-05 23:16:18','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2024-09-05 23:16:18','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2024-09-05 23:16:18','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2024-09-05 23:16:18','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2024-09-05 23:16:18','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2024-09-05 23:16:18','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2024-09-05 23:16:18','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2024-09-05 23:16:18','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2024-09-05 23:16:18','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-09-05 23:16:18','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2024-09-05 23:16:18','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-09-05 23:16:18','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-09-05 23:16:18','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2024-09-05 23:16:18','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2024-09-05 23:16:18','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-09-05 23:16:18','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-09-05 23:16:18','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-09-05 23:16:18','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2024-09-05 23:16:18','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2024-09-05 23:16:18','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2024-09-05 23:16:18','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-09-05 23:16:18','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2024-09-05 23:16:18','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2024-09-05 23:16:18','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2024-09-05 23:16:18','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2024-09-05 23:16:18','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2024-09-05 23:16:18','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2024-09-05 23:16:18','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2024-09-05 23:16:18','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2024-09-05 23:16:18','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2024-09-05 23:16:18','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2024-09-05 23:16:18','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2024-09-05 23:16:18','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-09-05 23:16:18','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-09-05 23:16:18','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-09-05 23:16:18','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-09-05 23:16:18','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-09-05 23:16:18','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-09-05 23:16:18','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-09-05 23:16:18','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-09-05 23:16:18','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-09-05 23:16:18','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-09-05 23:16:18','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-09-05 23:16:18','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-09-05 23:16:18','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-09-05 23:16:18','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-09-05 23:16:18','',NULL,''),(2000,'材料管理',0,5,'documentation',NULL,NULL,'',1,0,'M','0','0',NULL,'documentation','admin','2024-09-05 23:33:23','',NULL,''),(2001,'必备材料',2000,1,'material','system/material/index',NULL,'',1,0,'C','0','0','system:material:list','#','admin','2024-09-05 23:35:24','',NULL,'必备材料菜单'),(2002,'必备材料查询',2001,1,'#','',NULL,'',1,0,'F','0','0','system:material:query','#','admin','2024-09-05 23:35:24','',NULL,''),(2003,'必备材料新增',2001,2,'#','',NULL,'',1,0,'F','0','0','system:material:add','#','admin','2024-09-05 23:35:24','',NULL,''),(2004,'必备材料修改',2001,3,'#','',NULL,'',1,0,'F','0','0','system:material:edit','#','admin','2024-09-05 23:35:24','',NULL,''),(2005,'必备材料删除',2001,4,'#','',NULL,'',1,0,'F','0','0','system:material:remove','#','admin','2024-09-05 23:35:24','',NULL,''),(2006,'必备材料导出',2001,5,'#','',NULL,'',1,0,'F','0','0','system:material:export','#','admin','2024-09-05 23:35:24','',NULL,''),(2007,'药物信息',0,6,'drug',NULL,NULL,'',1,0,'M','0','0',NULL,'button','admin','2024-09-06 00:15:50','',NULL,''),(2008,'药品公司',2007,1,'company','system/company/index',NULL,'',1,0,'C','0','0','system:company:list','#','admin','2024-09-06 00:25:26','',NULL,'药品公司菜单'),(2009,'药品公司查询',2008,1,'#','',NULL,'',1,0,'F','0','0','system:company:query','#','admin','2024-09-06 00:25:26','',NULL,''),(2010,'药品公司新增',2008,2,'#','',NULL,'',1,0,'F','0','0','system:company:add','#','admin','2024-09-06 00:25:26','',NULL,''),(2011,'药品公司修改',2008,3,'#','',NULL,'',1,0,'F','0','0','system:company:edit','#','admin','2024-09-06 00:25:26','',NULL,''),(2012,'药品公司删除',2008,4,'#','',NULL,'',1,0,'F','0','0','system:company:remove','#','admin','2024-09-06 00:25:26','',NULL,''),(2013,'药品公司导出',2008,5,'#','',NULL,'',1,0,'F','0','0','system:company:export','#','admin','2024-09-06 00:25:26','',NULL,''),(2014,'药物信息',2007,1,'drug','system/drug/index',NULL,'',1,0,'C','0','0','system:drug:list','#','admin','2024-09-06 01:22:25','',NULL,'药物信息菜单'),(2015,'药物信息查询',2014,1,'#','',NULL,'',1,0,'F','0','0','system:drug:query','#','admin','2024-09-06 01:22:25','',NULL,''),(2016,'药物信息新增',2014,2,'#','',NULL,'',1,0,'F','0','0','system:drug:add','#','admin','2024-09-06 01:22:25','',NULL,''),(2017,'药物信息修改',2014,3,'#','',NULL,'',1,0,'F','0','0','system:drug:edit','#','admin','2024-09-06 01:22:25','',NULL,''),(2018,'药物信息删除',2014,4,'#','',NULL,'',1,0,'F','0','0','system:drug:remove','#','admin','2024-09-06 01:22:25','',NULL,''),(2019,'药物信息导出',2014,5,'#','',NULL,'',1,0,'F','0','0','system:drug:export','#','admin','2024-09-06 01:22:25','',NULL,''),(2020,'商店信息',2007,1,'sale','system/sale/index',NULL,'',1,0,'C','0','0','system:sale:list','#','admin','2024-09-06 01:47:14','',NULL,'商店信息菜单'),(2021,'商店信息查询',2020,1,'#','',NULL,'',1,0,'F','0','0','system:sale:query','#','admin','2024-09-06 01:47:14','',NULL,''),(2022,'商店信息新增',2020,2,'#','',NULL,'',1,0,'F','0','0','system:sale:add','#','admin','2024-09-06 01:47:14','',NULL,''),(2023,'商店信息修改',2020,3,'#','',NULL,'',1,0,'F','0','0','system:sale:edit','#','admin','2024-09-06 01:47:14','',NULL,''),(2024,'商店信息删除',2020,4,'#','',NULL,'',1,0,'F','0','0','system:sale:remove','#','admin','2024-09-06 01:47:14','',NULL,''),(2025,'商店信息导出',2020,5,'#','',NULL,'',1,0,'F','0','0','system:sale:export','#','admin','2024-09-06 01:47:14','',NULL,''),(2026,'地区管理',0,7,'area',NULL,NULL,'',1,0,'M','0','0',NULL,'international','admin','2024-09-06 02:48:36','',NULL,''),(2033,'城市管理',2026,1,'china','system/china/index',NULL,'',1,0,'C','0','0','system:china:list','#','admin','2024-09-06 03:47:28','',NULL,'城市管理菜单'),(2034,'城市管理查询',2033,1,'#','',NULL,'',1,0,'F','0','0','system:china:query','#','admin','2024-09-06 03:47:28','',NULL,''),(2035,'城市管理新增',2033,2,'#','',NULL,'',1,0,'F','0','0','system:china:add','#','admin','2024-09-06 03:47:28','',NULL,''),(2036,'城市管理修改',2033,3,'#','',NULL,'',1,0,'F','0','0','system:china:edit','#','admin','2024-09-06 03:47:28','',NULL,''),(2037,'城市管理删除',2033,4,'#','',NULL,'',1,0,'F','0','0','system:china:remove','#','admin','2024-09-06 03:47:28','',NULL,''),(2038,'城市管理导出',2033,5,'#','',NULL,'',1,0,'F','0','0','system:china:export','#','admin','2024-09-06 03:47:28','',NULL,''),(2045,'医保政策管理',2000,1,'policy','system/policy/index',NULL,'',1,0,'C','0','0','system:policy:list','#','admin','2024-09-06 03:58:59','',NULL,'医保政策管理菜单'),(2046,'医保政策管理查询',2045,1,'#','',NULL,'',1,0,'F','0','0','system:policy:query','#','admin','2024-09-06 03:58:59','',NULL,''),(2047,'医保政策管理新增',2045,2,'#','',NULL,'',1,0,'F','0','0','system:policy:add','#','admin','2024-09-06 03:58:59','',NULL,''),(2048,'医保政策管理修改',2045,3,'#','',NULL,'',1,0,'F','0','0','system:policy:edit','#','admin','2024-09-06 03:58:59','',NULL,''),(2049,'医保政策管理删除',2045,4,'#','',NULL,'',1,0,'F','0','0','system:policy:remove','#','admin','2024-09-06 03:58:59','',NULL,''),(2050,'医保政策管理导出',2045,5,'#','',NULL,'',1,0,'F','0','0','system:policy:export','#','admin','2024-09-06 03:58:59','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_material\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-05 23:30:01',61),(101,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_material\"}',NULL,0,NULL,'2024-09-05 23:30:03',135),(102,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"材料管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"documentation\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-05 23:33:23',15),(103,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-09-05 23:16:18\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-05 23:33:31',10),(104,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"material\",\"className\":\"Material\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-05 23:30:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":2,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-05 23:30:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"材料信息\",\"columnId\":3,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-09-05 23:30:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"message\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":4,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-05 23:30:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-05 23:34:35',32),(105,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_material\"}',NULL,0,NULL,'2024-09-05 23:34:37',42),(106,'必备材料',1,'com.ruoyi.web.controller.system.MaterialController.add()','POST',1,'admin','研发部门','/system/material','127.0.0.1','内网IP','{\"createTime\":\"2024-09-05 23:39:15\",\"id\":1,\"message\":\"材料\",\"params\":{},\"title\":\"材料测试1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-05 23:39:15',11),(107,'必备材料',1,'com.ruoyi.web.controller.system.MaterialController.add()','POST',1,'admin','研发部门','/system/material','127.0.0.1','内网IP','{\"createTime\":\"2024-09-05 23:39:21\",\"id\":2,\"message\":\"22\",\"params\":{},\"title\":\"材料2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-05 23:39:21',5),(108,'必备材料',3,'com.ruoyi.web.controller.system.MaterialController.remove()','DELETE',1,'admin','研发部门','/system/material/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-05 23:39:24',6),(109,'必备材料',2,'com.ruoyi.web.controller.system.MaterialController.edit()','PUT',1,'admin','研发部门','/system/material','127.0.0.1','内网IP','{\"createTime\":\"2024-09-05 23:39:16\",\"id\":1,\"message\":\"材料2121\",\"params\":{},\"title\":\"材料测试1\",\"updateTime\":\"2024-09-05 23:39:27\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-05 23:39:27',11),(110,'必备材料',1,'com.ruoyi.web.controller.system.MaterialController.add()','POST',1,'admin','研发部门','/system/material','127.0.0.1','内网IP','{\"createTime\":\"2024-09-05 23:39:33\",\"id\":3,\"message\":\"材料33\",\"params\":{},\"title\":\"材料33\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-05 23:39:33',6),(111,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"药物信息\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"drug\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:15:50',14),(112,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_company,t_company_policy\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:16:08',204),(113,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"company\",\"className\":\"TCompany\",\"columns\":[{\"capJavaField\":\"CompanyId\",\"columnComment\":\"公司ID\",\"columnId\":6,\"columnName\":\"company_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CompanyName\",\"columnComment\":\"公司名称\",\"columnId\":7,\"columnName\":\"company_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CompanyPhone\",\"columnComment\":\"公司电话\",\"columnId\":8,\"columnName\":\"company_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyPhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":9,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:17:02',30),(114,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"policy\",\"className\":\"CompanyPolicy\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"政策ID\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"公司ID\",\"columnId\":12,\"columnName\":\"company_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"政策标题\",\"columnId\":13,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"政策内容\",\"columnId\":14,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:17:49',13),(115,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"company\",\"className\":\"Company\",\"columns\":[{\"capJavaField\":\"CompanyId\",\"columnComment\":\"公司ID\",\"columnId\":6,\"columnName\":\"company_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 00:17:02\",\"usableColumn\":false},{\"capJavaField\":\"CompanyName\",\"columnComment\":\"公司名称\",\"columnId\":7,\"columnName\":\"company_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 00:17:02\",\"usableColumn\":false},{\"capJavaField\":\"CompanyPhone\",\"columnComment\":\"公司电话\",\"columnId\":8,\"columnName\":\"company_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyPhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 00:17:02\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":9,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:18:00',17),(116,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"company\",\"className\":\"Company\",\"columns\":[{\"capJavaField\":\"CompanyId\",\"columnComment\":\"公司ID\",\"columnId\":6,\"columnName\":\"company_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 00:18:00\",\"usableColumn\":false},{\"capJavaField\":\"CompanyName\",\"columnComment\":\"公司名称\",\"columnId\":7,\"columnName\":\"company_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 00:18:00\",\"usableColumn\":false},{\"capJavaField\":\"CompanyPhone\",\"columnComment\":\"公司电话\",\"columnId\":8,\"columnName\":\"company_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyPhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 00:18:00\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":9,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 00:16:08\",\"dictType\":\"\",\"edit\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:21:20',10),(117,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_company\"}',NULL,0,NULL,'2024-09-06 00:21:23',117),(118,'药品公司',1,'com.ruoyi.web.controller.system.CompanyController.add()','POST',1,'admin','研发部门','/system/company','127.0.0.1','内网IP','{\"companyId\":1,\"companyPolicyList\":[{\"companyId\":1,\"message\":\"\",\"params\":{},\"title\":\"adasd\"}],\"createTime\":\"2024-09-06 00:27:47\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:27:47',82),(119,'药品公司',3,'com.ruoyi.web.controller.system.CompanyController.remove()','DELETE',1,'admin','研发部门','/system/company/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:27:52',7),(120,'药品公司',1,'com.ruoyi.web.controller.system.CompanyController.add()','POST',1,'admin','研发部门','/system/company','127.0.0.1','内网IP','{\"companyId\":2,\"companyName\":\"23123\",\"companyPhone\":\"2132131\",\"companyPolicyList\":[{\"companyId\":2,\"message\":\"\",\"params\":{},\"title\":\"2131\"}],\"createTime\":\"2024-09-06 00:27:57\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:27:57',13),(121,'药品公司',2,'com.ruoyi.web.controller.system.CompanyController.edit()','PUT',1,'admin','研发部门','/system/company','127.0.0.1','内网IP','{\"companyId\":2,\"companyName\":\"23123\",\"companyPhone\":\"2132131\",\"companyPolicyList\":[{\"companyId\":2,\"id\":2,\"message\":\"\",\"params\":{},\"title\":\"2131\"},{\"companyId\":2,\"message\":\"\",\"params\":{},\"title\":\"sad\"}],\"createTime\":\"2024-09-06 00:27:58\",\"params\":{},\"updateTime\":\"2024-09-06 00:28:13\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:28:13',17),(122,'药品公司',1,'com.ruoyi.web.controller.system.CompanyController.add()','POST',1,'admin','研发部门','/system/company','127.0.0.1','内网IP','{\"companyId\":3,\"companyName\":\"231\",\"companyPhone\":\"123\",\"companyPolicyList\":[],\"createTime\":\"2024-09-06 00:28:29\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:28:29',8),(123,'药品公司',2,'com.ruoyi.web.controller.system.CompanyController.edit()','PUT',1,'admin','研发部门','/system/company','127.0.0.1','内网IP','{\"companyId\":3,\"companyName\":\"231\",\"companyPhone\":\"123\",\"companyPolicyList\":[{\"companyId\":3,\"message\":\"\",\"params\":{},\"title\":\"123123\"}],\"createTime\":\"2024-09-06 00:28:29\",\"params\":{},\"updateTime\":\"2024-09-06 00:28:33\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:28:33',13),(124,'药品公司',3,'com.ruoyi.web.controller.system.CompanyController.remove()','DELETE',1,'admin','研发部门','/system/company/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:33:07',5),(125,'药品公司',2,'com.ruoyi.web.controller.system.CompanyController.edit()','PUT',1,'admin','研发部门','/system/company','127.0.0.1','内网IP','{\"companyId\":2,\"companyName\":\"23123\",\"companyPhone\":\"2132131\",\"companyPolicyList\":[{\"companyId\":2,\"id\":2,\"message\":\"helloworld\",\"params\":{},\"title\":\"2131\"},{\"companyId\":2,\"id\":3,\"message\":\"asdsda\",\"params\":{},\"title\":\"sad\"}],\"createTime\":\"2024-09-06 00:27:58\",\"params\":{},\"updateTime\":\"2024-09-06 00:39:14\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 00:39:14',7),(126,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_drug_sale,t_sale,t_drug\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:10:15',226),(127,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"drug\",\"className\":\"Drug\",\"columns\":[{\"capJavaField\":\"DrugId\",\"columnComment\":\"药品ID\",\"columnId\":16,\"columnName\":\"drug_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"drugId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DrugImg\",\"columnComment\":\"药品图片URL\",\"columnId\":17,\"columnName\":\"drug_img\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"drugImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DrugInfo\",\"columnComment\":\"药品成分\",\"columnId\":18,\"columnName\":\"drug_info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"drugInfo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DrugEffect\",\"columnComment\":\"药品功效\",\"columnId\":19,\"columnName\":\"drug_effect\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQu','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:12:19',35),(128,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"sale\",\"className\":\"DrugSale\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleId\",\"columnComment\":\"药店ID\",\"columnId\":23,\"columnName\":\"sale_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DrugId\",\"columnComment\":\"药品ID\",\"columnId\":24,\"columnName\":\"drug_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"drugId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"cairbin\",\"functionName\":\"药品商店关系\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"remark\":\"药品商店关系\",\"sub\":false,\"tableComment\":\"药品商店关系\",\"tableId\":5,\"tableName\":\"t_drug_sale\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:13:12',10),(129,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"sale\",\"className\":\"Sale\",\"columns\":[{\"capJavaField\":\"SaleId\",\"columnComment\":\"药店ID\",\"columnId\":25,\"columnName\":\"sale_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleName\",\"columnComment\":\"药店名称\",\"columnId\":26,\"columnName\":\"sale_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SalePhone\",\"columnComment\":\"联系电话\",\"columnId\":27,\"columnName\":\"sale_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"salePhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":28,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:14:06',17),(130,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_drug\"}',NULL,0,NULL,'2024-09-06 01:20:50',122),(131,'药物信息',1,'com.ruoyi.web.controller.system.DrugController.add()','POST',1,'admin','研发部门','/system/drug','127.0.0.1','内网IP','{\"createTime\":\"2024-09-06 01:33:31\",\"drugEffect\":\"解热镇痛功效，用于因感冒引起的头痛，发热，鼻塞，流涕，咽痛等症状。\",\"drugId\":1,\"drugImg\":\"https://img.alicdn.com/bao/uploaded/O1CN01RSMZJV1RJGWZt9kLs_!!6000000002090-0-yinhe.jpg\",\"drugInfo\":\"三叉苦、岗梅、金盏银盘、薄荷油、野菊花、马来酸氯苯那敏、咖啡因、对乙酰氨基酚。辅料为蔗糖粉。\",\"drugName\":\"999感冒灵\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:33:31',78),(132,'药物信息',2,'com.ruoyi.web.controller.system.DrugController.edit()','PUT',1,'admin','研发部门','/system/drug','127.0.0.1','内网IP','{\"createTime\":\"2024-09-06 01:33:32\",\"drugEffect\":\"解热镇痛功效，用于因感冒引起的头痛，发热，鼻，流涕，咽痛等症状。\",\"drugId\":1,\"drugImg\":\"https://img.alicdn.com/bao/uploaded/O1CN01RSMZJV1RJGWZt9kLs_!!6000000002090-0-yinhe.jpg\",\"drugInfo\":\"三叉苦、岗梅、金盏银盘、薄荷油、野菊花、马来酸氯苯那敏、咖啡因、对乙酰氨基酚。辅料为蔗糖粉。\",\"drugName\":\"999感冒灵\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:33:39',8),(133,'药物信息',2,'com.ruoyi.web.controller.system.DrugController.edit()','PUT',1,'admin','研发部门','/system/drug','127.0.0.1','内网IP','{\"createTime\":\"2024-09-06 01:33:32\",\"drugEffect\":\"解热镇痛功效，用于因感冒引起的头痛，发热，鼻塞，流涕，咽痛等症状。\",\"drugId\":1,\"drugImg\":\"https://img.alicdn.com/bao/uploaded/O1CN01RSMZJV1RJGWZt9kLs_!!6000000002090-0-yinhe.jpg\",\"drugInfo\":\"三叉苦、岗梅、金盏银盘、薄荷油、野菊花、马来酸氯苯那敏、咖啡因、对乙酰氨基酚。辅料为蔗糖粉。\",\"drugName\":\"999感冒灵\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:33:43',5),(134,'药物信息',1,'com.ruoyi.web.controller.system.DrugController.add()','POST',1,'admin','研发部门','/system/drug','127.0.0.1','内网IP','{\"createTime\":\"2024-09-06 01:37:02\",\"drugEffect\":\"布洛芬缓释胶囊，适应症为用于缓解轻至中度疼痛如头痛、关节痛、偏头痛、牙痛、肌肉痛、神经痛、痛经。也用于普通感冒或流行性感冒引起的发热。\",\"drugId\":2,\"drugImg\":\"https://img0.miaoshoucdn.com/product/watermark/c/3a/c3aff7ea50ac6aac46a6626f17969a6a.jpg\",\"drugInfo\":\"本品每粒含主要成份布洛芬0.3克。辅料为：糖、淀粉、硬脂酸、聚乙烯吡咯烷酮。\",\"drugName\":\"布洛芬缓释胶囊\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:37:02',10),(135,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"sale\",\"className\":\"Sale\",\"columns\":[{\"capJavaField\":\"SaleId\",\"columnComment\":\"药店ID\",\"columnId\":25,\"columnName\":\"sale_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 01:14:06\",\"usableColumn\":false},{\"capJavaField\":\"SaleName\",\"columnComment\":\"药店名称\",\"columnId\":26,\"columnName\":\"sale_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 01:14:06\",\"usableColumn\":false},{\"capJavaField\":\"SalePhone\",\"columnComment\":\"联系电话\",\"columnId\":27,\"columnName\":\"sale_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"salePhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 01:14:06\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":28,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 01:10:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:39:01',31),(136,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_sale\"}',NULL,0,NULL,'2024-09-06 01:39:04',130),(137,'商店信息',1,'com.ruoyi.web.controller.system.SaleController.add()','POST',1,'admin','研发部门','/system/sale','127.0.0.1','内网IP','{\"createTime\":\"2024-09-06 01:48:08\",\"params\":{},\"saleId\":1,\"saleName\":\"springboot大药房\",\"salePhone\":\"1145142222\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:48:08',72),(138,'商店信息',2,'com.ruoyi.web.controller.system.SaleController.edit()','PUT',1,'admin','研发部门','/system/sale','127.0.0.1','内网IP','{\"createTime\":\"2024-09-06 01:48:08\",\"params\":{},\"saleId\":1,\"saleName\":\"springboot大药房\",\"salePhone\":\"11451422223\",\"updateTime\":\"2024-09-06 01:48:13\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 01:48:13',7),(139,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_china,t_city\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 02:47:05',66),(140,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地区管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"area\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 02:48:36',12),(141,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"china\",\"className\":\"China\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"省/市/县ID\",\"columnId\":30,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 02:47:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":31,\"columnName\":\"name\",\"columnType\":\"varchar(40)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 02:47:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父级ID\",\"columnId\":32,\"columnName\":\"parent_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 02:47:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":true}],\"crud\":true,\"functionAuthor\":\"cairbin\",\"functionName\":\"中国省/市/县\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"parentMenuId\\\":2026}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"parentMenuId\":2026},\"parentMenuId\":\"2026\",\"remark\":\"中国省/市/县数据信息维护\",\"sub\":false,\"tableComment\":\"中国省/市/县数据信息维护\",\"tableId\":7,\"tableName\":\"t_china\",\"tplCategory\":\"crud\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 02:50:10',18),(142,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"china\",\"className\":\"China\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"省/市/县ID\",\"columnId\":30,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 02:47:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 02:50:10\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":31,\"columnName\":\"name\",\"columnType\":\"varchar(40)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 02:47:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 02:50:10\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父级ID\",\"columnId\":32,\"columnName\":\"parent_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 02:47:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 02:50:10\",\"usableColumn\":true}],\"crud\":false,\"functionAuthor\":\"cairbin\",\"functionName\":\"中国省/市/县\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\",\\\"treeName\\\":\\\"name\\\",\\\"treeParentCode\\\":\\\"parent_id\\\",\\\"parentMenuId\\\":\\\"2026\\\"}\",\"packageName\":\"com.ruoy','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 02:57:48',12),(143,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_china\"}',NULL,0,NULL,'2024-09-06 02:57:51',126),(144,'中国省/市/县',1,'com.ruoyi.web.controller.system.ChinaController.add()','POST',1,'admin','研发部门','/system/china','127.0.0.1','内网IP','{\"children\":[],\"id\":1,\"name\":\"山东省\",\"params\":{},\"parentId\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:00:43',15),(145,'中国省/市/县',1,'com.ruoyi.web.controller.system.ChinaController.add()','POST',1,'admin','研发部门','/system/china','127.0.0.1','内网IP','{\"children\":[],\"id\":2,\"name\":\"济南市\",\"params\":{},\"parentId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:00:55',3),(146,'中国省/市/县',1,'com.ruoyi.web.controller.system.ChinaController.add()','POST',1,'admin','研发部门','/system/china','127.0.0.1','内网IP','{\"children\":[],\"id\":3,\"name\":\"历下区\",\"params\":{},\"parentId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:01:10',4),(147,'中国省/市/县',1,'com.ruoyi.web.controller.system.ChinaController.add()','POST',1,'admin','研发部门','/system/china','127.0.0.1','内网IP','{\"children\":[],\"id\":4,\"name\":\"济宁市\",\"params\":{},\"parentId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:01:19',5),(148,'中国省/市/县',1,'com.ruoyi.web.controller.system.ChinaController.add()','POST',1,'admin','研发部门','/system/china','127.0.0.1','内网IP','{\"children\":[],\"id\":5,\"name\":\"市中区\",\"params\":{},\"parentId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:01:31',9),(149,'中国省/市/县',1,'com.ruoyi.web.controller.system.ChinaController.add()','POST',1,'admin','研发部门','/system/china','127.0.0.1','内网IP','{\"children\":[],\"id\":6,\"name\":\"任城区\",\"params\":{},\"parentId\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:01:57',6),(150,'中国省/市/县',2,'com.ruoyi.web.controller.system.ChinaController.edit()','PUT',1,'admin','研发部门','/system/china','127.0.0.1','内网IP','{\"children\":[],\"id\":1,\"name\":\"山东省\",\"params\":{},\"parentId\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:02:02',3),(151,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_medical_policy\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:26:27',152),(152,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/t_city','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:29:15',19),(153,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/8','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:33:18',8),(154,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_city\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:33:22',37),(155,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/9','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:41:47',9),(156,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/10','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:41:49',11),(157,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/7','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:45:35',7),(158,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_china\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:45:40',28),(159,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"china\",\"className\":\"China\",\"columns\":[{\"capJavaField\":\"CityId\",\"columnComment\":\"省/市/县ID\",\"columnId\":48,\"columnName\":\"city_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:45:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"cityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":49,\"columnName\":\"name\",\"columnType\":\"varchar(40)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:45:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父级ID\",\"columnId\":50,\"columnName\":\"parent_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:45:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":true}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"城市管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"parentMenuId\\\":2026}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"parentMenuId\":2026},\"parentMenuId\":\"2026\",\"remark\":\"城市信息管理\",\"sub\":false,\"tableComment\":\"城市信息管理\",\"tableId\":11,\"tableName\":\"t_china\",\"tplCategory\":\"crud\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:46:35',13),(160,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"china\",\"className\":\"China\",\"columns\":[{\"capJavaField\":\"CityId\",\"columnComment\":\"省/市/县ID\",\"columnId\":48,\"columnName\":\"city_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:45:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"cityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 03:46:35\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":49,\"columnName\":\"name\",\"columnType\":\"varchar(40)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:45:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 03:46:35\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父级ID\",\"columnId\":50,\"columnName\":\"parent_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:45:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 03:46:35\",\"usableColumn\":true}],\"crud\":false,\"functionAuthor\":\"ruoyi\",\"functionName\":\"城市管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"treeCode\\\":\\\"city_id\\\",\\\"treeName\\\":\\\"name\\\",\\\"treeParentCode\\\":\\\"parent_id\\\",\\\"parentMenuId\\\":\\\"2026\\\"}\",\"packa','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:46:52',13),(161,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_china\"}',NULL,0,NULL,'2024-09-06 03:46:57',99),(162,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2028','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:49:54',11),(163,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2029','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:49:56',5),(164,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2030','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:49:58',11),(165,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2031','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:50:00',7),(166,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2032','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:50:02',8),(167,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2027','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:50:08',10),(168,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_medical_policy\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:51:49',52),(169,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"policy\",\"className\":\"MedicalPolicy\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":51,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"政策编号\",\"columnId\":52,\"columnName\":\"code\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"政策标题\",\"columnId\":53,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"政策内容\",\"columnId\":54,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"messa','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:53:04',27),(170,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"policy\",\"className\":\"MedicalPolicy\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":51,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 03:53:04\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"政策编号\",\"columnId\":52,\"columnName\":\"code\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 03:53:04\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"政策标题\",\"columnId\":53,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 03:53:04\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"政策内容\",\"columnId\":54,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:53:26',21),(171,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_medical_policy\"}',NULL,0,NULL,'2024-09-06 03:53:28',112),(172,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2039','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-09-06 03:57:57',7),(173,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2040','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:58:01',8),(174,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2041','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:58:03',10),(175,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2042','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:58:06',11),(176,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2043','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:58:07',6),(177,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2044','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:58:09',11),(178,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2039','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:58:11',8),(179,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"policy\",\"className\":\"MedicalPolicy\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":51,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 03:53:26\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"政策编号\",\"columnId\":52,\"columnName\":\"code\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 03:53:26\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"政策标题\",\"columnId\":53,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2024-09-06 03:53:26\",\"usableColumn\":false},{\"capJavaField\":\"Message\",\"columnComment\":\"政策内容\",\"columnId\":54,\"columnName\":\"message\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-09-06 03:51:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 03:58:33',20),(180,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_medical_policy\"}',NULL,0,NULL,'2024-09-06 03:58:35',66),(181,'医保政策管理',1,'com.ruoyi.web.controller.system.MedicalPolicyController.add()','POST',1,'admin','研发部门','/system/policy','127.0.0.1','内网IP','{\"chinaList\":[],\"cityId\":3,\"code\":114514,\"createTime\":\"2024-09-06 04:41:49\",\"id\":1,\"message\":\"hello policy\",\"params\":{},\"title\":\"hello\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 04:41:49',83),(182,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2045,2007,2008,2014,2020,2026,2033,2001,2002,2003,2004,2005,2006,2046,2050,2009,2013,2015,2019,2021,2025,2034,2038],\"params\":{},\"roleId\":100,\"roleKey\":\"doctor\",\"roleName\":\"医师\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 05:59:10',15),(183,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/108','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 05:59:25',13),(184,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/109','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 05:59:29',8),(185,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/102','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 05:59:36',5),(186,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/103','127.0.0.1','内网IP','{}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2024-09-06 05:59:41',13),(187,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 05:59:42',13),(188,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/106','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 05:59:44',8),(189,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 05:59:46',12),(190,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/105','127.0.0.1','内网IP','{}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2024-09-06 05:59:47',8),(191,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/103','127.0.0.1','内网IP','{}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2024-09-06 05:59:50',5),(192,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/101','127.0.0.1','内网IP','{}','{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}',0,NULL,'2024-09-06 05:59:52',4),(193,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"Jvav医院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:00:50',10),(194,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"门诊部\",\"email\":\"exp@exp.com\",\"leader\":\"cairbin\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"13132113121\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:01:49',14),(195,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"管理中心\",\"email\":\"exp@exp.com\",\"leader\":\"cairbin\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"phone\":\"13111111111\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:02:17',13),(196,'岗位管理',3,'com.ruoyi.web.controller.system.SysPostController.remove()','DELETE',1,'admin','研发部门','/system/post/1','127.0.0.1','内网IP','{}',NULL,1,'董事长已分配,不能删除','2024-09-06 06:02:39',9),(197,'通知公告',3,'com.ruoyi.web.controller.system.SysNoticeController.remove()','DELETE',1,'admin','研发部门','/system/notice/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:02:45',6),(198,'通知公告',3,'com.ruoyi.web.controller.system.SysNoticeController.remove()','DELETE',1,'admin','研发部门','/system/notice/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:02:47',6),(199,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-09-05 23:16:17\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":201,\"email\":\"ry@163.com\",\"loginDate\":\"2024-09-06 05:57:29\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}',NULL,1,'不允许操作超级管理员用户','2024-09-06 06:03:42',0),(200,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:03:53',9),(201,'岗位管理',3,'com.ruoyi.web.controller.system.SysPostController.remove()','DELETE',1,'admin','研发部门','/system/post/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:04:32',11),(202,'岗位管理',3,'com.ruoyi.web.controller.system.SysPostController.remove()','DELETE',1,'admin','研发部门','/system/post/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:04:34',7),(203,'岗位管理',3,'com.ruoyi.web.controller.system.SysPostController.remove()','DELETE',1,'admin','研发部门','/system/post/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:04:35',7),(204,'岗位管理',1,'com.ruoyi.web.controller.system.SysPostController.add()','POST',1,'admin','研发部门','/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"10086\",\"postId\":5,\"postName\":\"就诊医师\",\"postSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:04:54',11),(205,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"email\":\"exp@exp.com\",\"nickName\":\"test_doctor\",\"params\":{},\"phonenumber\":\"13111111111\",\"postIds\":[5],\"remark\":\"医师测试用户\",\"roleIds\":[100],\"sex\":\"2\",\"status\":\"0\",\"userId\":100,\"userName\":\"doctor\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:05:48',100),(206,'必备材料',2,'com.ruoyi.web.controller.system.MaterialController.edit()','PUT',1,'doctor','门诊部','/system/material','127.0.0.1','内网IP','{\"createTime\":\"2024-09-05 23:39:16\",\"id\":1,\"message\":\"材料2121\",\"params\":{},\"title\":\"材料测试1\",\"updateTime\":\"2024-09-06 06:06:24\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:06:24',10),(207,'必备材料',2,'com.ruoyi.web.controller.system.MaterialController.edit()','PUT',1,'doctor','门诊部','/system/material','127.0.0.1','内网IP','{\"createTime\":\"2024-09-05 23:39:16\",\"id\":1,\"message\":\"材料21213\",\"params\":{},\"title\":\"材料测试1\",\"updateTime\":\"2024-09-06 06:06:28\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:06:28',8),(208,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2045,2046,2047,2048,2049,2050,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2033,2034,2035,2036,2037,2038],\"params\":{},\"roleId\":101,\"roleKey\":\"manager\",\"roleName\":\"管理者\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:15:19',12),(209,'岗位管理',1,'com.ruoyi.web.controller.system.SysPostController.add()','POST',1,'admin','研发部门','/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"1123\",\"postId\":6,\"postName\":\"管理者\",\"postSort\":2,\"remark\":\"管理者\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:16:47',4),(210,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin','研发部门','/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-09-06 06:16:47\",\"flag\":false,\"params\":{},\"postCode\":\"1123\",\"postId\":6,\"postName\":\"管理人员\",\"postSort\":2,\"remark\":\"管理者\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:16:55',11),(211,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"deptId\":201,\"email\":\"exp@exp.com\",\"nickName\":\"manager\",\"params\":{},\"phonenumber\":\"13111111111\",\"postIds\":[6],\"remark\":\"普通管理员测试\",\"roleIds\":[101],\"sex\":\"2\",\"status\":\"0\",\"userName\":\"manager\"}','{\"msg\":\"新增用户\'manager\'失败，手机号码已存在\",\"code\":500}',0,NULL,'2024-09-06 06:17:40',6),(212,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"deptId\":201,\"email\":\"exp@exp.com\",\"nickName\":\"manager\",\"params\":{},\"phonenumber\":\"13111111123\",\"postIds\":[6],\"remark\":\"普通管理员测试\",\"roleIds\":[101],\"sex\":\"2\",\"status\":\"0\",\"userName\":\"manager\"}','{\"msg\":\"新增用户\'manager\'失败，邮箱账号已存在\",\"code\":500}',0,NULL,'2024-09-06 06:17:46',12),(213,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":201,\"email\":\"exp1@exp.com\",\"nickName\":\"manager\",\"params\":{},\"phonenumber\":\"13111111123\",\"postIds\":[6],\"remark\":\"普通管理员测试\",\"roleIds\":[101],\"sex\":\"2\",\"status\":\"0\",\"userId\":101,\"userName\":\"manager\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:17:51',106),(214,'医保政策管理',1,'com.ruoyi.web.controller.system.MedicalPolicyController.add()','POST',1,'manager','管理中心','/system/policy','127.0.0.1','内网IP','{\"chinaList\":[],\"cityId\":4,\"code\":11420,\"createTime\":\"2024-09-06 06:21:40\",\"id\":2,\"message\":\"114515\",\"params\":{},\"title\":\"114515\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-06 06:21:40',6);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-09-05 23:16:17','',NULL,''),(5,'10086','就诊医师',2,'0','admin','2024-09-06 06:04:54','',NULL,NULL),(6,'1123','管理人员',2,'0','admin','2024-09-06 06:16:47','admin','2024-09-06 06:16:55','管理者');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-09-05 23:16:18','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-09-05 23:16:18','',NULL,'普通角色'),(100,'医师','doctor',3,'1',1,1,'0','0','admin','2024-09-06 05:59:10','',NULL,NULL),(101,'管理者','manager',4,'1',1,1,'0','0','admin','2024-09-06 06:15:19','',NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(100,2000),(100,2001),(100,2002),(100,2003),(100,2004),(100,2005),(100,2006),(100,2007),(100,2008),(100,2009),(100,2013),(100,2014),(100,2015),(100,2019),(100,2020),(100,2021),(100,2025),(100,2026),(100,2033),(100,2034),(100,2038),(100,2045),(100,2046),(100,2050),(101,2000),(101,2001),(101,2002),(101,2003),(101,2004),(101,2005),(101,2006),(101,2007),(101,2008),(101,2009),(101,2010),(101,2011),(101,2012),(101,2013),(101,2014),(101,2015),(101,2016),(101,2017),(101,2018),(101,2019),(101,2020),(101,2021),(101,2022),(101,2023),(101,2024),(101,2025),(101,2026),(101,2033),(101,2034),(101,2035),(101,2036),(101,2037),(101,2038),(101,2045),(101,2046),(101,2047),(101,2048),(101,2049),(101,2050);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-09-06 06:18:42','admin','2024-09-05 23:16:17','','2024-09-06 06:18:42','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','2','127.0.0.1','2024-09-05 23:16:17','admin','2024-09-05 23:16:17','',NULL,'测试员'),(100,200,'doctor','test_doctor','00','exp@exp.com','13111111111','2','','$2a$10$d.NNYx9i48LGsdaCLaI03.Mp0sLDGS7io6fi2VdWs4jE4NXSuYibC','0','0','127.0.0.1','2024-09-06 06:06:16','admin','2024-09-06 06:05:48','','2024-09-06 06:06:16','医师测试用户'),(101,201,'manager','manager','00','exp1@exp.com','13111111123','2','','$2a$10$yk/M8X/voumdCwUwLYEb4e5AAZC1yQYA/tXjy8qLz433gRs8dRe8e','0','0','127.0.0.1','2024-09-06 06:19:04','admin','2024-09-06 06:17:51','','2024-09-06 06:19:04','普通管理员测试');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(100,5),(101,6);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(100,100),(101,101);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_china`
--

DROP TABLE IF EXISTS `t_china`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_china` (
  `city_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '省/市/县ID',
  `name` varchar(40) DEFAULT NULL COMMENT '名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级ID',
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `id_UNIQUE` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_china`
--

LOCK TABLES `t_china` WRITE;
/*!40000 ALTER TABLE `t_china` DISABLE KEYS */;
INSERT INTO `t_china` VALUES (1,'山东省',0),(2,'济南市',1),(3,'历下区',2),(4,'济宁市',1),(5,'市中区',2),(6,'任城区',4);
/*!40000 ALTER TABLE `t_china` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_city`
--

DROP TABLE IF EXISTS `t_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_city` (
  `city_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '城市ID',
  `city_number` bigint(20) DEFAULT NULL COMMENT '城市编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_id_UNIQUE` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_city`
--

LOCK TABLES `t_city` WRITE;
/*!40000 ALTER TABLE `t_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_company`
--

DROP TABLE IF EXISTS `t_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_company` (
  `company_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `company_phone` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_id_UNIQUE` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_company`
--

LOCK TABLES `t_company` WRITE;
/*!40000 ALTER TABLE `t_company` DISABLE KEYS */;
INSERT INTO `t_company` VALUES (2,'23123','2132131','2024-09-06 00:27:58','2024-09-06 00:39:15');
/*!40000 ALTER TABLE `t_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_company_policy`
--

DROP TABLE IF EXISTS `t_company_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_company_policy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '政策ID',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司ID',
  `title` varchar(255) DEFAULT NULL COMMENT '政策标题',
  `message` text COMMENT '政策内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_company_policy`
--

LOCK TABLES `t_company_policy` WRITE;
/*!40000 ALTER TABLE `t_company_policy` DISABLE KEYS */;
INSERT INTO `t_company_policy` VALUES (2,2,'2131','helloworld',NULL),(3,2,'sad','asdsda',NULL);
/*!40000 ALTER TABLE `t_company_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_drug`
--

DROP TABLE IF EXISTS `t_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_drug` (
  `drug_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '药品ID',
  `drug_img` varchar(255) DEFAULT NULL COMMENT '药品图片URL',
  `drug_info` varchar(255) DEFAULT NULL COMMENT '药品成分',
  `drug_effect` varchar(255) DEFAULT NULL COMMENT '药品功效',
  `drug_name` varchar(255) DEFAULT NULL COMMENT '药品名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`drug_id`),
  UNIQUE KEY `drug_id_UNIQUE` (`drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_drug`
--

LOCK TABLES `t_drug` WRITE;
/*!40000 ALTER TABLE `t_drug` DISABLE KEYS */;
INSERT INTO `t_drug` VALUES (1,'https://img.alicdn.com/bao/uploaded/O1CN01RSMZJV1RJGWZt9kLs_!!6000000002090-0-yinhe.jpg','三叉苦、岗梅、金盏银盘、薄荷油、野菊花、马来酸氯苯那敏、咖啡因、对乙酰氨基酚。辅料为蔗糖粉。','解热镇痛功效，用于因感冒引起的头痛，发热，鼻塞，流涕，咽痛等症状。','999感冒灵','2024-09-06 01:33:32'),(2,'https://img0.miaoshoucdn.com/product/watermark/c/3a/c3aff7ea50ac6aac46a6626f17969a6a.jpg','本品每粒含主要成份布洛芬0.3克。辅料为：糖、淀粉、硬脂酸、聚乙烯吡咯烷酮。','布洛芬缓释胶囊，适应症为用于缓解轻至中度疼痛如头痛、关节痛、偏头痛、牙痛、肌肉痛、神经痛、痛经。也用于普通感冒或流行性感冒引起的发热。','布洛芬缓释胶囊','2024-09-06 01:37:03');
/*!40000 ALTER TABLE `t_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_drug_sale`
--

DROP TABLE IF EXISTS `t_drug_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_drug_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sale_id` bigint(20) DEFAULT NULL COMMENT '药店ID',
  `drug_id` bigint(20) DEFAULT NULL COMMENT '药品ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_drug_sale`
--

LOCK TABLES `t_drug_sale` WRITE;
/*!40000 ALTER TABLE `t_drug_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_drug_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_material`
--

DROP TABLE IF EXISTS `t_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `message` text COMMENT '材料信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_material`
--

LOCK TABLES `t_material` WRITE;
/*!40000 ALTER TABLE `t_material` DISABLE KEYS */;
INSERT INTO `t_material` VALUES (1,'材料测试1','材料21213','2024-09-05 23:39:16','2024-09-06 06:06:28'),(3,'材料33','材料33','2024-09-05 23:39:34',NULL);
/*!40000 ALTER TABLE `t_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_medical_policy`
--

DROP TABLE IF EXISTS `t_medical_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_medical_policy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` int(11) DEFAULT NULL COMMENT '政策编号',
  `title` varchar(255) DEFAULT NULL COMMENT '政策标题',
  `message` text COMMENT '政策内容',
  `city_id` bigint(20) DEFAULT NULL COMMENT '城市ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_medical_policy`
--

LOCK TABLES `t_medical_policy` WRITE;
/*!40000 ALTER TABLE `t_medical_policy` DISABLE KEYS */;
INSERT INTO `t_medical_policy` VALUES (1,114514,'hello','hello policy',3,'2024-09-06 04:41:49',NULL),(2,11420,'114515','114515',4,'2024-09-06 06:21:41',NULL);
/*!40000 ALTER TABLE `t_medical_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_region`
--

DROP TABLE IF EXISTS `t_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `city_code` varchar(255) DEFAULT NULL COMMENT '城市编号',
  `lat` float DEFAULT NULL COMMENT '纬度',
  `lng` float DEFAULT NULL COMMENT '经度',
  `level` int(11) DEFAULT NULL COMMENT '区域等级',
  `mer_name` varchar(100) DEFAULT NULL COMMENT '组合名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_region`
--

LOCK TABLES `t_region` WRITE;
/*!40000 ALTER TABLE `t_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sale`
--

DROP TABLE IF EXISTS `t_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sale` (
  `sale_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '药店ID',
  `sale_name` varchar(255) DEFAULT NULL COMMENT '药店名称',
  `sale_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `sale_id_UNIQUE` (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sale`
--

LOCK TABLES `t_sale` WRITE;
/*!40000 ALTER TABLE `t_sale` DISABLE KEYS */;
INSERT INTO `t_sale` VALUES (1,'springboot大药房','11451422223','2024-09-06 01:48:08','2024-09-06 01:48:14');
/*!40000 ALTER TABLE `t_sale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-06  6:53:03
