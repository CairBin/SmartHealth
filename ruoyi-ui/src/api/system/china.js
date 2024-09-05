import request from '@/utils/request'

// 查询中国省/市/县列表
export function listChina(query) {
  return request({
    url: '/system/china/list',
    method: 'get',
    params: query
  })
}

// 查询中国省/市/县详细
export function getChina(id) {
  return request({
    url: '/system/china/' + id,
    method: 'get'
  })
}

// 新增中国省/市/县
export function addChina(data) {
  return request({
    url: '/system/china',
    method: 'post',
    data: data
  })
}

// 修改中国省/市/县
export function updateChina(data) {
  return request({
    url: '/system/china',
    method: 'put',
    data: data
  })
}

// 删除中国省/市/县
export function delChina(id) {
  return request({
    url: '/system/china/' + id,
    method: 'delete'
  })
}
