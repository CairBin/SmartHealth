-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('中国省/市/县', '2026', '1', 'china', 'system/china/index', 1, 0, 'C', '0', '0', 'system:china:list', '#', 'admin', sysdate(), '', null, '中国省/市/县菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('中国省/市/县查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'system:china:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('中国省/市/县新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'system:china:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('中国省/市/县修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'system:china:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('中国省/市/县删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'system:china:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('中国省/市/县导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'system:china:export',       '#', 'admin', sysdate(), '', null, '');