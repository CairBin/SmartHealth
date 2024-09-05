use db_smarthealth;

CREATE TABLE `db_smarthealth`.`t_material` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` VARCHAR(255) NULL COMMENT '标题',
  `message` TEXT NULL COMMENT '材料信息',
  `create_time` DATETIME NULL COMMENT '创建时间',
  `update_time` DATETIME NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));
