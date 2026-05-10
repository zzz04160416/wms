import request from '@/utils/request'
// 获取当天日期
const getToday = (): string => {
  const today = new Date()
  const year = today.getFullYear()
  const month = String(today.getMonth() + 1).padStart(2, '0')
  const day = String(today.getDate()).padStart(2, '0')
  return `${year}-${month}-${day}`
}
export interface PurchaseInRecord {
  id?: number | null
  productName?: string | null
  specification?: string | null
  quantity?: number | null
  unit?: string | null
  productionDate?: string | null
  shelfLife?: number | null
  storageDate?: string | null
  remark?: string | null
  type?: string
  createBy?: string
  createTime?: string
  updateBy?: string
  updateTime?: string
  location?: string | null
}

export interface PurchaseInQueryParams {
  pageNum: number
  pageSize: number
  productName?: string | null
  specification?: string | null
  storageDate?: string | null
}

// 定义响应类型
export interface PurchaseInListResponse {
  rows: PurchaseInRecord[]
  total: number
  code: number
  msg: string
}

// 查询入库列表 - 修改 URL
export function listPurchaseIn(query: PurchaseInQueryParams): Promise<PurchaseInListResponse> {
  return request({
    url: '/system/purchaseIn/list',
    method: 'get',
    params: { ...query, type: 'in' }
  })
}

// 查询入库详细
export function getPurchaseIn(id: number): Promise<{ data: PurchaseInRecord }> {
  return request({
    url: '/system/purchaseIn/' + id,
    method: 'get'
  })
}

// 新增入库
export function addPurchaseIn(data: PurchaseInRecord): Promise<any> {
  return request({
    url: '/system/purchaseIn',
    method: 'post',
    data: {
      ...data,
      type: 'in',
      storageDate: getToday()  // ← 加上这行
    }
  })
}

// 修改入库
export function updatePurchaseIn(data: PurchaseInRecord): Promise<any> {
  return request({
    url: '/system/purchaseIn',  // ← 改这里
    method: 'put',
    data
  })
}

// 删除入库
export function delPurchaseIn(ids: string): Promise<any> {
  return request({
    url: '/system/purchaseIn/' + ids,  // ← 改这里
    method: 'delete'
  })
}