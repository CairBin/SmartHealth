import request from '@/utils/request'

// 查询必备材料列表
export function listMaterial(query) {
  return request({
    url: '/system/material/list',
    method: 'get',
    params: query
  })
}

// 查询必备材料详细
export function getMaterial(id) {
  return request({
    url: '/system/material/' + id,
    method: 'get'
  })
}

// 新增必备材料
export function addMaterial(data) {
  return request({
    url: '/system/material',
    method: 'post',
    data: data
  })
}

// 修改必备材料
export function updateMaterial(data) {
  return request({
    url: '/system/material',
    method: 'put',
    data: data
  })
}

// 删除必备材料
export function delMaterial(id) {
  return request({
    url: '/system/material/' + id,
    method: 'delete'
  })
}
