<template>
  <div class="app-container">
  <div class="box">
      <!-- 搜索栏 -->
    <el-form :model="queryParams" ref="queryFormRef" size="small" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="产品名称" prop="productName" class="big-label">
        <el-input v-model="queryParams.productName" placeholder="请输入产品名称" clearable @keyup.enter="handleQuery" style="height: 30px;"/>
      </el-form-item>
      
      <el-form-item>
        <el-button type="primary"  size="mini" @click="handleQuery">搜索</el-button>
        <el-button  size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 按钮栏 -->
  <div class="box2">
      <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain  size="mini" @click="handleAdd">新增出库</el-button>
      </el-col>
    </el-row>
  </div>
  </div>

    <!-- 数据表格 -->
    <el-table v-loading="loading" :data="outboundList" border>
      <el-table-column label="序号" type="index" width="60" align="center" />
      <el-table-column label="产品名称" align="center" prop="productName" min-width="150" />
      <el-table-column label="出库数量" align="center" prop="quantity" width="100">
        <template #default="{ row }">
          <span style="color: #f56c6c; font-weight: bold;">{{ row.quantity }}</span>
        </template>
      </el-table-column>
      <el-table-column label="单位" align="center" prop="unit" width="80" />
      <el-table-column label="出库日期" align="center" width="120">
        <template #default="{ row }">
          {{ row.outDate ? formatDate(row.outDate) : '-' }}
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" min-width="150" show-overflow-tooltip />
      <el-table-column label="操作" align="center" width="150" fixed="right">
        <template #default="{ row }">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(row)">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <div class="pagination-container" v-show="total > 0">
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

    <!-- 新增/修改弹窗 -->
    <el-dialog :title="title" v-model="open" width="550px" append-to-body>
      <el-form ref="formRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="产品名称" prop="productName">
          <el-input v-model="form.productName" placeholder="请输入产品名称" />
        </el-form-item>
        <el-form-item label="出库数量" prop="quantity">
          <el-input-number v-model="form.quantity" :min="1" style="width: 100%" />
        </el-form-item>
        <el-form-item label="单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="出库日期" prop="outDate">
          <el-date-picker 
            v-model="form.outDate" 
            type="date" 
            placeholder="选择出库日期" 
            style="width: 100%" 
          />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" :rows="3" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="cancel">取消</el-button>
          <el-button type="primary" @click="submitForm">确定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { useOutbound } from '@/composables/useOutbound'
import dayjs from 'dayjs'

const {
  loading,
  outboundList,
  total,
  showSearch,
  open,
  title,
  queryParams,
  form,
  rules,
  handleCurrentChange,
  handleSizeChange,
  handleQuery,
  resetQuery,
  handleAdd,
  handleUpdate,
  submitForm,
  handleDelete,
  cancel
} = useOutbound()

// 格式化日期
const formatDate = (date: any) => {
  if (!date) return '-'
  return dayjs(date).format('YYYY-MM-DD')
}
</script>

<style scoped>
.mb8 { margin-bottom: 8px; }
.pagination-container { margin-top: 20px; display: flex; justify-content: flex-end; }
.box{
  margin-top: 10px;
  display: flex;
  justify-content: space-between;
}
.box2{
  
  margin-right: 20px;
}
.big-label :deep(.el-form-item__label) {
  font-size: 15px;
  font-weight: bold;
}
</style>