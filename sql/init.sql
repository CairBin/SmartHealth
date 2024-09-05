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
