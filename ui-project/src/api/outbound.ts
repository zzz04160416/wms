import request from '@/utils/request'

export interface OutboundRecord {
  id?: number | null
  productName?: string | null
  specification?: string | null
  quantity?: number | null
  unit?: string | null
  outDate?: string | null
  remark?: string | null
  createBy?: string
  createTime?: string
  updateBy?: string
  updateTime?: string
}

export interface OutboundQueryParams {
  pageNum: number
  pageSize: number
  productName?: string | null
  specification?: string | null
  outDate?: string | null
}

export interface OutboundListResponse {
  rows: OutboundRecord[]
  total: number
  code: number
  msg: string
}

// 查询出库列表
export function listOutbound(query: OutboundQueryParams): Promise<OutboundListResponse> {
  return request({
    url: '/system/outbound/list',
    method: 'get',
    params: query
  })
}

// 查询出库详细
export function getOutbound(id: number): Promise<{ data: OutboundRecord }> {
  return request({
    url: '/system/outbound/' + id,
    method: 'get'
  })
}

// 新增出库（修改这里）
export function addOutbound(data: OutboundRecord): Promise<any> {
  return request({
    url: '/system/outbound/add', 
    method: 'post',
    data: data
  })
}

// 修改出库
export function updateOutbound(data: OutboundRecord): Promise<any> {
  return request({
    url: '/system/outbound',
    method: 'put',
    data: data
  })
}

// 删除出库
export function delOutbound(ids: string): Promise<any> {
  return request({
    url: '/system/outbound/' + ids,
    method: 'delete'
  })
}