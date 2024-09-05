import request from '@/utils/request'

// 查询药品公司列表
export function listCompany(query) {
  return request({
    url: '/system/company/list',
    method: 'get',
    params: query
  })
}

// 查询药品公司详细
export function getCompany(companyId) {
  return request({
    url: '/system/company/' + companyId,
    method: 'get'
  })
}

// 新增药品公司
export function addCompany(data) {
  return request({
    url: '/system/company',
    method: 'post',
    data: data
  })
}

// 修改药品公司
export function updateCompany(data) {
  return request({
    url: '/system/company',
    method: 'put',
    data: data
  })
}

// 删除药品公司
export function delCompany(companyId) {
  return request({
    url: '/system/company/' + companyId,
    method: 'delete'
  })
}
