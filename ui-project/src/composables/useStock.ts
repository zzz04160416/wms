import { reactive, ref, computed } from 'vue'
import { listStock, type StockRecord, type StockQueryParams } from '@/api/stock'

//类型定义 
/**
 * 预警类型
 * 把可能出现的预警情况都定义成字符串，方便统一管理
 * 
 * 'out_of_stock'    : 缺货（数量 <= 0）
 * 'low_stock'       : 库存不足（数量 < 10）
 * 'expired'         : 已过期（到期日期 <= 今天）
 * 'expiring_soon'   : 即将过期（剩余时间 <= 7天）
 * 'normal'          : 正常
 */
export type WarningType = 'out_of_stock' | 'low_stock' | 'expired' | 'expiring_soon' | 'normal'

/**
 * 筛选类型
 * 用户在页面上可以选择不同的筛选条件
 * 
 * ''                : 显示全部
 * 'warning'         : 显示预警的（库存不足或即将过期）
 * 'out_of_stock'    : 只显示缺货的
 * 'expired'         : 只显示已过期的
 * 'expiring_soon'   : 只显示即将过期的
 */
export type FilterType = '' | 'warning' | 'out_of_stock' | 'expired' | 'expiring_soon'

//日期函数
export const formatDate = (dateStr: string | null | undefined): string => {
  // 如果没有传入日期，或者日期是空的，就返回 "-"
  if (!dateStr) return '-'

  // 把字符串转成日期对象
  const date = new Date(dateStr)

  // 获取年份
  const year = date.getFullYear()

  // 获取月份（getMonth 返回 0-11，所以要 +1）
  // padStart(2, '0') 意思是：如果不足2位，就在前面补0
  // 比如 5 变成 '05'
  const month = String(date.getMonth() + 1).padStart(2, '0')

  // 获取日期
  const day = String(date.getDate()).padStart(2, '0')

  // 拼成 YYYY-MM-DD 格式返回
  return `${year}-${month}-${day}`
}

//计算到期日期
export const calculateExpiryDate = (productionDate: any, shelfLife: any): string => {
  // 如果生产日期或保质期没有传，就返回 "-"
  if (!productionDate || !shelfLife) return '-'
  const date = new Date(productionDate)
  // 把保质期天数加到生产日期上
  // setDate 是设置日期，getDate 是获取当前日期
  // 当前日期 + 保质期天数 = 到期日期
  date.setDate(date.getDate() + Number(shelfLife))

  // 获取年份
  const year = date.getFullYear()

  // 获取月份（补0）
  const month = String(date.getMonth() + 1).padStart(2, '0')

  // 获取日期（补0）
  const day = String(date.getDate()).padStart(2, '0')

  // 返回格式化后的到期日期
  return `${year}-${month}-${day}`
}

/**
 * 获取库存css类名
 * 根据库存数量，返回不同的 CSS 类名，用于在表格中高亮显示
 */
export const getStockClass = (quantity: number): string => {
  // 如果数量 <= 0，返回危险样式（红色）
  if (quantity <= 0) return 'stock-danger'

  // 如果数量 < 10，返回警告样式（黄色）
  if (quantity < 10) return 'stock-warning'

  // 其他情况，返回空字符串（没有特殊样式）
  return ''
}

/**
 * 获取预警类型
 * 根据库存数量和到期日期，判断属于哪种预警情况
 */
export const getWarningType = (quantity: number, expiryDate: string): WarningType => {

  // 先检查库存情况

  // 如果数量 <= 0，说明缺货了
  if (quantity <= 0) return 'out_of_stock'

  // 如果数量 < 10，说明库存不足（比如只剩几个了）
  if (quantity < 10) return 'low_stock'


  // ========== 再检查到期情况 ==========
  if (expiryDate && expiryDate !== '-') {

    // 获取今天的日期（把时间部分清零，只保留年月日）
    const today = new Date()
    today.setHours(0, 0, 0, 0)

    // 获取到期日期（也把时间部分清零）
    const expiry = new Date(expiryDate)
    expiry.setHours(0, 0, 0, 0)

    // 计算距离到期还有多少天
    const daysLeft = Math.ceil((expiry.getTime() - today.getTime()) / (1000 * 60 * 60 * 24))

    // 如果剩余天数 <= 0，说明已经过期了
    if (daysLeft <= 0) return 'expired'

    // 如果剩余天数 <= 7，说明即将过期（7天内）
    if (daysLeft <= 7) return 'expiring_soon'
  }

  // 如果库存充足也没有过期，返回正常
  return 'normal'
}

/**
 * 获取预警文本
 * 根据预警类型，返回显示在页面上的中文文字
 */
export const getWarningText = (type: WarningType): string => {
  // 根据不同的类型，返回不同的文字
  switch (type) {
    case 'out_of_stock': return '缺货'      // 缺货
    case 'low_stock': return '库存不足'     // 库存不足
    case 'expired': return '已过期'         // 已过期
    case 'expiring_soon': return '即将过期' // 即将过期
    default: return '正常'                  // 正常
  }
}

/**
 * 获取Element Plus标签颜色类型
 * 根据预警类型，返回 Element Plus 组件的颜色配置

 */
export const getWarningTagType = (type: WarningType): 'danger' | 'warning' | 'success' | 'info' => {
  switch (type) {
    case 'out_of_stock': return 'danger'   // 缺货 → 红色
    case 'low_stock': return 'warning'     // 库存不足 → 橙色
    case 'expired': return 'danger'        // 已过期 → 红色
    case 'expiring_soon': return 'warning' // 即将过期 → 橙色
    default: return 'success'              // 正常 → 绿色
  }
}

// ==================== 组合式函数 ====================
export function useStock() {
  // loading 状态：是否正在加载数据
  const loading = ref<boolean>(false)
  // 原始库存列表：从后端查询回来的数据，没有经过筛选
  const stockList = ref<StockRecord[]>([])
  // 总记录数：后端总共有多少条数据（用于分页组件显示总数）
  const total = ref<number>(0)
  // 是否显示搜索栏：控制页面上的搜索表单是否显示
  const showSearch = ref<boolean>(true)
  // 当前筛选类型：用户选择了哪种预警筛选（全部/缺货/过期等）
  const filterType = ref<FilterType>('')
  // 查询参数：发送给后端的请求参数
  const queryParams = reactive<StockQueryParams>({
    pageNum: 1,           // 当前第几页，默认第1页
    pageSize: 10,         // 每页显示多少条，默认10条
    productName: null,    // 按产品名称搜索，默认没有
    specification: null   // 按规格搜索，默认没有
  })


  // 计算属性
  const filteredStockList = computed<StockRecord[]>(() => {

    // 如果没有选择筛选条件（filterType 是空字符串），直接返回原始数据
    if (!filterType.value) return stockList.value

    // 如果选择了筛选条件，就过滤数据
    // filter 方法会遍历数组，只保留符合条件的项
    return stockList.value.filter((item: StockRecord) => {

      // 先计算这个商品的到期日期
      const expiryDate = calculateExpiryDate(item.manufacturer, item.shelfLife)

      // 再获取预警类型
      const warningType = getWarningType(item.quantity || 0, expiryDate)

      // 根据用户选择的筛选类型做判断
      switch (filterType.value) {

        case 'warning':
          // 预警：库存不足 或者 即将过期
          // 只要满足其中一个就返回 true（保留）
          return warningType === 'low_stock' || warningType === 'expiring_soon'

        case 'out_of_stock':
          // 只显示缺货的
          return warningType === 'out_of_stock'

        case 'expired':
          // 只显示已过期的
          return warningType === 'expired'

        case 'expiring_soon':
          // 只显示即将过期的
          return warningType === 'expiring_soon'

        default:
          // 其他情况都保留
          return true
      }
    })
  })


  const getList = (): void => {
    // 开始加载，显示加载动画
    loading.value = true

    // 调用 listStock 函数，把查询参数传给它
    // response 是后端返回的数据
    listStock(queryParams).then((response: any) => {

      // 把后端返回的数据存到 stockList 中
      // response.rows 是列表数据
      stockList.value = response.rows || []

      // 把总记录数存到 total 中
      total.value = response.total || 0

      // 加载完成，隐藏加载动画
      loading.value = false

    }).catch(() => {
      loading.value = false
    })
  }

  /**
   * 分页：页码改变
   * 当用户点击分页组件的页码时，会触发这个方法
  
   */
  const handleCurrentChange = (page: number): void => {
    // 更新查询参数中的页码
    queryParams.pageNum = page

    // 重新加载数据
    getList()
  }

  /**
   * 分页：每页条数改变
   * 当用户改变每页显示多少条时，会触发这个方法
   */
  const handleSizeChange = (size: number): void => {
    // 更新每页条数
    queryParams.pageSize = size

    // 重置到第一页（改变每页条数后，应该回到第一页）
    queryParams.pageNum = 1

    // 重新加载数据
    getList()
  }

  /**
   * 查询按钮点击
   * 用户点击"搜索"按钮时调用
   */
 const handleQuery = (e?: Event): void => {
  // 阻止默认行为（防止页面刷新）
  if (e) {
    e.preventDefault()
    e.stopPropagation()
  }
  
  // 重置到第一页
  queryParams.pageNum = 1
  console.log('搜索执行了');

  // 重新加载数据
  getList()
}

  /**
   * 重置查询条件
   * 用户点击"重置"按钮时调用，清空所有搜索条件
   */
  const resetQuery = (): void => {
    // 清空产品名称
    queryParams.productName = null

    // 清空规格
    queryParams.specification = null

    // 重置到第一页
    queryParams.pageNum = 1

    // 清空预警筛选
    filterType.value = ''

    // 重新加载数据
    getList()
  }

  /**
   * 设置预警筛选类型
   * 用户点击预警筛选按钮时调用
  
   * 调用方式：
   * setFilterType('out_of_stock')  // 只显示缺货商品
   * setFilterType('')              // 显示全部
   */
  const setFilterType = (type: FilterType): void => {
    // 更新筛选类型
    filterType.value = type
    // 注意：这里不需要重新调用 getList()
    // 因为 filteredStockList 是计算属性，会自动重新计算
  }



  return {
    loading,           // 加载状态
    stockList,         // 原始库存列表（一般用下面那个筛选后的）
    filteredStockList, // 筛选后的库存列表（页面直接绑定这个）
    total,             // 总记录数（给分页组件用）
    showSearch,        // 是否显示搜索栏
    queryParams,       // 查询参数（一般不需要直接操作）
    filterType,        // 当前筛选类型

    // 方法（组件可以调用）
    getList,               // 获取数据
    handleCurrentChange,   // 分页页码改变
    handleSizeChange,      // 分页每页条数改变
    handleQuery,           // 查询
    resetQuery,            // 重置查询
    setFilterType          // 设置筛选类型
  }
}