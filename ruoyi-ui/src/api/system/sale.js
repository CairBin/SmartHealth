import request from '@/utils/request'

// 查询商店信息列表
export function listSale(query) {
  return request({
    url: '/system/sale/list',
    method: 'get',
    params: query
  })
}

// 查询商店信息详细
export function getSale(saleId) {
  return request({
    url: '/system/sale/' + saleId,
    method: 'get'
  })
}

// 新增商店信息
export function addSale(data) {
  return request({
    url: '/system/sale',
    method: 'post',
    data: data
  })
}

// 修改商店信息
export function updateSale(data) {
  return request({
    url: '/system/sale',
    method: 'put',
    data: data
  })
}

// 删除商店信息
export function delSale(saleId) {
  return request({
    url: '/system/sale/' + saleId,
    method: 'delete'
  })
}
