import request from '@/utils/request'

// 查询医保政策管理列表
export function listPolicy(query) {
  return request({
    url: '/system/policy/list',
    method: 'get',
    params: query
  })
}

// 查询医保政策管理详细
export function getPolicy(id) {
  return request({
    url: '/system/policy/' + id,
    method: 'get'
  })
}

// 新增医保政策管理
export function addPolicy(data) {
  return request({
    url: '/system/policy',
    method: 'post',
    data: data
  })
}

// 修改医保政策管理
export function updatePolicy(data) {
  return request({
    url: '/system/policy',
    method: 'put',
    data: data
  })
}

// 删除医保政策管理
export function delPolicy(id) {
  return request({
    url: '/system/policy/' + id,
    method: 'delete'
  })
}
