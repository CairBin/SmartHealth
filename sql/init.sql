use db_smarthealth;

CREATE TABLE `db_smarthealth`.`t_material` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` VARCHAR(255) NULL COMMENT '标题',
  `message` TEXT NULL COMMENT '材料信息',
  `create_time` DATETIME NULL COMMENT '创建时间',
  `update_time` DATETIME NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

CREATE TABLE `db_smarthealth`.`t_company_policy` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '政策ID',
  `company_id` BIGINT(20) NULL COMMENT '公司ID',
  `title` VARCHAR(255) NULL COMMENT '政策标题',
  `message` TEXT NULL COMMENT '政策内容',
  `create_time` DATETIME NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));


CREATE TABLE `db_smarthealth`.`t_company` (
  `company_id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `company_name` VARCHAR(255) NULL COMMENT '公司名称',
  `company_phone` VARCHAR(255) NULL COMMENT '公司电话',
  `create_time` DATETIME NULL COMMENT '创建时间',
  `update_time` DATETIME NULL COMMENT '更新时间',
  PRIMARY KEY (`company_id`),
  UNIQUE INDEX `company_id_UNIQUE` (`company_id` ASC));

CREATE TABLE `db_smarthealth`.`t_drug` (
  `drug_id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '药品ID',
  `drug_img` VARCHAR(255) NULL COMMENT '药品图片URL',
  `drug_info` VARCHAR(255) NULL COMMENT '药品成分',
  `drug_effect` VARCHAR(255) NULL COMMENT '药品功效',
  `drug_name` VARCHAR(255) NULL COMMENT '药品名称',
  `create_time` DATETIME NULL COMMENT '创建时间',
  PRIMARY KEY (`drug_id`),
  UNIQUE INDEX `drug_id_UNIQUE` (`drug_id` ASC));

CREATE TABLE `db_smarthealth`.`t_sale` (
  `sale_id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '药店ID',
  `sale_name` VARCHAR(255) NULL COMMENT '药店名称',
  `sale_phone` VARCHAR(255) NULL COMMENT '联系电话',
  `create_time` DATETIME NULL COMMENT '创建时间',
  `update_time` DATETIME NULL COMMENT '更新时间',
  PRIMARY KEY (`sale_id`),
  UNIQUE INDEX `sale_id_UNIQUE` (`sale_id` ASC));


CREATE TABLE `db_smarthealth`.`t_drug_sale` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sale_id` BIGINT(20) NULL COMMENT '药店ID',
  `drug_id` BIGINT(20) NULL COMMENT '药品ID',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));
