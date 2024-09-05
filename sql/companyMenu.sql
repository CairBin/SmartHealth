use db_smarthealth;
-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品公司', '2007', '1', 'company', 'system/company/index', 1, 0, 'C', '0', '0', 'system:company:list', '#', 'admin', sysdate(), '', null, '药品公司菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品公司查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'system:company:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品公司新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'system:company:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品公司修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'system:company:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品公司删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'system:company:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品公司导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'system:company:export',       '#', 'admin', sysdate(), '', null, '');