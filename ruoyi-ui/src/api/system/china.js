import request from '@/utils/request'

// 查询城市管理列表
export function listChina(query) {
  return request({
    url: '/system/china/list',
    method: 'get',
    params: query
  })
}

// 查询城市管理详细
export function getChina(cityId) {
  return request({
    url: '/system/china/' + cityId,
    method: 'get'
  })
}

// 新增城市管理
export function addChina(data) {
  return request({
    url: '/system/china',
    method: 'post',
    data: data
  })
}

// 修改城市管理
export function updateChina(data) {
  return request({
    url: '/system/china',
    method: 'put',
    data: data
  })
}

// 删除城市管理
export function delChina(cityId) {
  return request({
    url: '/system/china/' + cityId,
    method: 'delete'
  })
}
