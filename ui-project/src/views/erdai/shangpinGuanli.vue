<template>
  <div class="app-container">
    
   <div class="box1">
   

    <!--筛选按钮栏-->
    <div>
      <el-radio-group v-model="filterType">
        <el-radio-button label="">全部</el-radio-button>
        <el-radio-button label="warning">⚠️ 预警（库存不足/即将到期）</el-radio-button>
        <el-radio-button label="out_of_stock">❌ 缺货</el-radio-button>
        <el-radio-button label="expiring_soon">⏰ 即将到期（7天内）</el-radio-button>
        <el-radio-button label="expired">💀 已过期</el-radio-button>
      </el-radio-group>
    </div>
      <!-- 搜索栏-->
    <div>
      <el-form 
      :model="queryParams" 
      size="mini" 
      :inline="true" 
      v-show="showSearch" 
    >
      
      <el-form-item label="产品名称" prop="productName" class="big-label">
        <el-input
          v-model="queryParams.productName"
          placeholder="请输入产品名称"
          clearable
          @keydown.enter="handleQuery"
          style="height: 30px;"

        />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" size="mini" @click="handleQuery">搜索</el-button>
        <el-button size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    </div>
   </div>

    <!-- ==================== 数据表格 ==================== -->
    <!-- 
      el-table: Element Plus 的表格组件
      v-loading="loading": 加载时显示加载动画（loading 为 true 时显示转圈圈）
      :data="filteredStockList": 表格绑定的数据源，是筛选后的库存列表
      border: 显示表格边框
    -->
    <el-table v-loading="loading" :data="filteredStockList" border>
      <!-- 
        el-table-column: 表格列
        label="序号": 列头显示的文字
        type="index": 类型为索引，自动显示行号（1,2,3...）
        width="60": 列宽度 60 像素
        align="center": 文字水平居中
      -->
      <el-table-column label="序号" type="index" width="60" align="center" />
      
      <!-- 产品名称列 -->
      <el-table-column label="产品名称" align="center" prop="productName" width="155" />
     
      <!-- 
        当前库存列
        prop="quantity": 直接显示数据中的 quantity 字段
      -->
      <el-table-column label="当前库存" align="center" prop="quantity" width="100">
        <!-- 
          template: 自定义列内容的模板
          #default="scope": 作用域插槽，scope 包含当前行的数据
          scope.row: 当前行的数据对象
        -->
        <template #default="scope">
          <!-- 
            :class="getStockClass(scope.row.quantity)": 动态绑定 CSS 类名
            根据数量返回 'stock-danger'(红色) 或 'stock-warning'(橙色)
            {{ scope.row.quantity || 0 }}: 显示数量，没有则显示 0
          -->
          <span :class="getStockClass(scope.row.quantity)">
            {{ scope.row.quantity || 0 }}
          </span>
        </template>
      </el-table-column>
      
      <!-- 单位列 -->
      <el-table-column label="单位" align="center" prop="unit" width="70" />
      
      <!-- 
        生产日期列
        prop="productionDate": 数据中的字段名
      -->
      <el-table-column label="生产日期" align="center" prop="productionDate" width="110">
        <template #default="scope">
          <!-- 
            formatDate(scope.row.productionDate): 调用格式化函数
            把后端返回的日期字符串转成 YYYY-MM-DD 格式
            例如：'2026-05-07T10:30:00' → '2026-05-07'
          -->
          <span>{{ formatDate(scope.row.productionDate) }}</span>
        </template>
      </el-table-column>
      
      <!-- 保质期列 -->
      <el-table-column label="保质期(天)" align="center" prop="shelfLife" width="90" />
      
      <!-- 到期日期列（计算出来的，不是数据库直接存的） -->
      <el-table-column label="到期日期" align="center" width="110">
        <template #default="scope">
          <!-- 
            :class="getExpiryClass(...)": 根据剩余天数返回样式类
            calculateExpiryDate(...): 计算到期日期（生产日期 + 保质期）
          -->
          <span :class="getExpiryClass(scope.row.productionDate, scope.row.shelfLife)">
            {{ calculateExpiryDate(scope.row.productionDate, scope.row.shelfLife) }}
          </span>
        </template>
      </el-table-column>
      
      <!-- 预警状态列 -->
      <el-table-column label="预警状态" align="center" width="110">
        <template #default="scope">
          <!-- 
            el-tag: Element Plus 的标签组件
            :type="...": 标签颜色类型（danger红色、warning橙色、success绿色）
            size="small": 小尺寸
            
            这段代码比较长，拆解一下：
            1. getWarningType(数量, 到期日期) → 返回警告类型字符串
            2. 把警告类型传给 getWarningTagType → 返回 el-tag 的 type
            3. 同样的警告类型传给 getWarningText → 返回显示的中文文字
          -->
          <el-tag 
            :type="getWarningTagType(getWarningType(scope.row.quantity || 0, calculateExpiryDate(scope.row.productionDate, scope.row.shelfLife)))" 
            size="small"
          >
            {{ getWarningText(getWarningType(scope.row.quantity || 0, calculateExpiryDate(scope.row.productionDate, scope.row.shelfLife))) }}
          </el-tag>
        </template>
      </el-table-column>
      
      <!-- 最近入库时间列 -->
      <el-table-column label="最近入库时间" align="center" prop="lastInTime" width="110">
        <template #default="scope">
          <span>{{ formatDate(scope.row.lastInTime) }}</span>
        </template>
      </el-table-column>
      
      <!-- 最近出库时间列 -->
      <el-table-column label="最近出库时间" align="center" prop="lastOutTime" width="110">
        <template #default="scope">
          <span>{{ formatDate(scope.row.lastOutTime) }}</span>
        </template>
      </el-table-column>
      
      <!-- 库位列 -->
      <el-table-column label="库位" align="center" prop="location" width="110">
        <template #default="scope">
          <!-- 
            location 可能为空，为空时显示 '-'
          -->
          <span>{{ scope.row.location || '-' }}</span>
        </template>
      </el-table-column>
    </el-table>

    <!-- ==================== 分页组件 ==================== -->
    <!-- 
      v-show="total > 0": 只有当总记录数大于 0 时才显示分页
    -->
    <div class="pagination-container" v-show="total > 0">
      <!-- 
        el-pagination: Element Plus 的分页组件
        :current-page: 当前页码（双向绑定到 queryParams.pageNum）
        :page-size: 每页条数（双向绑定到 queryParams.pageSize）
        :page-sizes: 每页条数的选项 [10,20,30,50]
        :total: 总记录数
        layout: 分页组件显示的控件布局
          - total: 显示总条数
          - sizes: 显示每页条数选择器
          - prev: 上一页按钮
          - pager: 页码按钮
          - next: 下一页按钮
          - jumper: 跳转输入框
        @current-change: 页码改变时触发
        @size-change: 每页条数改变时触发
      -->
      <el-pagination
        :current-page="queryParams.pageNum"
        :page-size="queryParams.pageSize"
        :page-sizes="[10, 20, 30, 50]"
        :total="total"
        layout="total, sizes, prev, pager, next, jumper"
        @current-change="handleCurrentChange"
        @size-change="handleSizeChange"
      />
    </div>
  </div>
</template>

<script lang="ts" setup>
// ==================== 导入 ====================
// 
// import ... from ... : 从其他文件导入内容
// 
// useStock: 组合式函数，里面封装了库存相关的数据和方法
// formatDate: 格式化日期函数，把日期转成 YYYY-MM-DD 格式
// getStockClass: 获取库存样式，根据数量返回 'stock-danger' 或 'stock-warning'
// calculateExpiryDate: 计算到期日期，生产日期 + 保质期
// getWarningType: 获取预警类型，返回 'out_of_stock'/'low_stock'/'expired'/'expiring_soon'/'normal'
// getWarningText: 获取预警文字，返回'缺货'/'库存不足'/'已过期'/'即将过期'/'正常'
// getWarningTagType: 获取标签颜色，返回 'danger'/'warning'/'success'
import { 
  useStock, 
  formatDate, 
  getStockClass, 
  calculateExpiryDate, 
  getWarningType, 
  getWarningText, 
  getWarningTagType 
} from '@/composables/useStock'

// onMounted: Vue 生命周期函数，组件挂载到页面后自动执行
import { onMounted } from 'vue'

// ==================== 自定义函数 ====================

/**
 * 获取到期日期的样式类名
 * 
 * @param productionDate - 生产日期（字符串）
 * @param shelfLife - 保质期（天数）
 * @returns 样式类名：'expiry-danger'(红色) / 'expiry-warning'(橙色) / ''(无色)
 * 
 * 单词含义：
 * - expiry: 到期、过期
 * - danger: 危险（红色）
 * - warning: 警告（橙色）
 */
const getExpiryClass = (productionDate: string, shelfLife: number) => {
  // 1. 调用 calculateExpiryDate 计算到期日期
  const expiryDate = calculateExpiryDate(productionDate, shelfLife)
  
  // 如果计算出来是 '-'，说明没有有效日期，不添加样式
  if (expiryDate === '-') return ''
  
  // 2. 获取今天的日期（把时间部分清零，只比较年月日）
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  
  // 3. 获取到期日期（也把时间部分清零）
  const expiry = new Date(expiryDate)
  expiry.setHours(0, 0, 0, 0)
  
  // 4. 计算距离到期还有多少天
  // .getTime() 是 JavaScript 的日期方法，返回毫秒数（从1970年开始的毫秒）
  // 相减得到毫秒差
  // 除以 (1000 * 60 * 60 * 24) 把毫秒转成天数
  // Math.ceil 向上取整（比如 0.3 天也算 1 天）
  const daysLeft = Math.ceil((expiry.getTime() - today.getTime()) / (1000 * 60 * 60 * 24))
  
  // 5. 根据剩余天数返回不同的样式类名
  if (daysLeft < 0) return 'expiry-danger'    // 已过期 → 红色
  if (daysLeft <= 7) return 'expiry-warning'  // 7天内到期 → 橙色
  return ''                                    // 正常 → 无样式
}


const {
  loading,              // 加载状态（loading: 加载中）
  filteredStockList,    // 筛选后的库存列表（filtered: 被筛选的）
  total,                // 总记录数（total: 总数）
  showSearch,           // 是否显示搜索栏（show: 显示，Search: 搜索）
  queryParams,          // 查询参数（query: 查询，Params: 参数）
  filterType,           // 筛选类型（filter: 筛选，Type: 类型）
  getList,              // 获取数据方法
  handleCurrentChange,  // 页码改变方法（handle: 处理，Current: 当前，Change: 改变）
  handleSizeChange,     // 每页条数改变方法（Size: 大小/条数）
  handleQuery,          // 搜索方法
  resetQuery,           // 重置方法（reset: 重置）
 
} = useStock()

// ==================== 事件处理函数 ====================

/**
 * 筛选变化时的处理函数
 * 当用户点击预警筛选按钮时触发
 * 
 * @change 事件由 el-radio-group 触发
 * 
 * 注意：这里不需要调用 getList() 重新请求后端
 * 因为 filteredStockList 是计算属性（computed），会自动根据 filterType 重新过滤数据
 * 这是一种前端筛选，不需要重新向服务器请求
 */
const handleFilterChange = () => {
  // console.log: 在浏览器控制台输出信息（调试用）
  // 这里输出当前选中的筛选类型，方便调试
  console.log('筛选类型:', filterType.value)
}

// ==================== 生命周期 ====================

/**
 * onMounted: Vue 的生命周期钩子函数
 * 
 * mounted 意思是"挂载完成"
 * 当组件被加载到 DOM 树上后，会自动执行这里的代码
 * 
 * 相当于"页面一打开，自动查询库存数据"
 */
onMounted(() => {
  getList()  // 调用 getList()，从后端获取库存数据并显示
})
</script>

<style scoped>
.box1{
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
}
.pagination-container {
  margin-top: 17px;
  display: flex;
  justify-content: flex-end;
}

.box3 {
 margin: 20px 0 10px 0;
}
.filter-radio-group :deep(.el-radio-button__inner) {
  width: 100%;
  text-align: center;
  padding: 10px 0;
  font-size: 15px;
}
.stock-danger {
  color: #f56c6c;
  font-weight: bold;
}

.stock-warning {
  color: #e6a23c;
  font-weight: bold;
}


.expiry-danger {
  color: #f56c6c;
  font-weight: bold;
}

.expiry-warning {
  color: #e6a23c;
  font-weight: bold;
}
.search-form :deep(.el-input__inner) {
  height: 40px;
  font-size: 16px;
}


.box2{
  margin: 10px 0;
}
.big-label :deep(.el-form-item__label) {
  font-size: 15px;
  font-weight: bold;
}
</style>