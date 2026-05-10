// src/api/stock.ts
import request from '@/utils/request'

//定义数据类型
export interface StockRecord {
  id?: number | null                 // 库存ID
  productName?: string | null        // 产品名称
  specification?: string | null      // 规格型号
  quantity?: number | null           // 库存数量
  unit?: string | null               // 单位（个、箱、件等）
  manufacturer?: string | null       // 生产日期
  shelfLife?: number | null          // 保质期（天数）
  lastInTime?: string | null         // 最后入库时间
  lastOutTime?: string | null        // 最后出库时间
  createTime?: string                // 创建时间
  updateTime?: string                // 更新时间
  location?: string                  // 库位（重要：区分不同库位）
}

/**
 * 库存查询参数接口
 */
export interface StockQueryParams {
  pageNum: number        // 当前页码
  pageSize: number       // 每页条数
  productName?: string | null    // 产品名称（模糊查询）
  specification?: string | null  // 规格型号（模糊查询）
}

/**
 * 库存列表响应接口
 */
export interface StockListResponse {
  rows: StockRecord[]    // 库存数据列表
  total: number          // 总记录数
  code: number           // 响应状态码（200成功）
  msg: string            // 响应消息
}

// 查询库存列表
export function listStock(query: StockQueryParams): Promise<StockListResponse> {
  return request({
    url: '/system/stock/list',
    method: 'get',
    params: query
  })
}

/**
 * 查询库存详情
 */
export function getStock(id: number): Promise<{ data: StockRecord }> {
  return request({
    url: '/system/stock/' + id,
    method: 'get'
  })
}

/**
 * 新增库存
 * POST /system/stock
 * @param data 库存记录（不需要传id）
 */
export function addStock(data: StockRecord): Promise<any> {
  return request({
    url: '/system/stock',
    method: 'post',
    data: data
  })
}

/**
 * 修改库存
 * PUT /system/stock
 * @param data 库存记录（必须传id）
 */
export function updateStock(data: StockRecord): Promise<any> {
  return request({
    url: '/system/stock',
    method: 'put',
    data: data
  })
}

/**
 * 删除库存
 * DELETE /system/stock/{ids}
 * @param ids 逗号分隔的ID字符串，如 "1,2,3"
 */
export function delStock(ids: string): Promise<any> {
  return request({
    url: '/system/stock/' + ids,
    method: 'delete'
  })
}