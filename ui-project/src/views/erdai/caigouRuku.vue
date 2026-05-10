<template>
  <div class="app-container">
   <div class="box">
     <!-- 搜索栏 -->
   <div >
     <el-form :model="queryParams" ref="queryFormRef" size="small" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="产品名称" prop="productName" class="big-label">
        <el-input v-model="queryParams.productName" placeholder="请输入产品名称" clearable @keyup.enter="handleQuery" style="height: 30px;"/>
      </el-form-item>
      
      <el-form-item>
        <el-button type="primary" size="mini" @click="handleQuery">搜索</el-button>
        <el-button  size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
   </div>

   <div class="box2">
     <!-- 按钮栏 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain size="mini" @click="handleAdd">新增入库</el-button>
      </el-col>
    </el-row>
   </div>
   </div>

    <!-- 数据表格 -->
    <el-table v-loading="loading" :data="purchaseList" @selection-change="handleSelectionChange" border>
      <el-table-column label="序号" type="index" width="60" align="center" />
      <el-table-column label="产品名称" align="center" prop="productName" min-width="150" />
      <el-table-column label="入库数量" align="center" prop="quantity" width="100" />
      <el-table-column label="单位" align="center" prop="unit" width="80" />
      <el-table-column label="生产日期" align="center" width="120">
        <template #default="{ row }">
          {{ row.productionDate ? formatDate(row.productionDate) : '-' }}
        </template>
      </el-table-column>
      <el-table-column label="保质期(天)" align="center" prop="shelfLife" width="100" />
      <el-table-column label="入库日期" align="center" width="120">
        <template #default="{ row }">
          {{ row.storageDate ? formatDate(row.storageDate) : '-' }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="200" fixed="right">
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
        <el-form-item label="入库数量" prop="quantity">
          <el-input-number v-model="form.quantity" :min="1" style="width: 100%" />
        </el-form-item>
        <el-form-item label="单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="库位" prop="location" required>
  <el-input v-model="form.location" placeholder="请输入库位,如:A01" />
</el-form-item>
        <el-form-item label="生产日期" prop="productionDate">
          <el-date-picker 
            v-model="form.productionDate" 
            type="date" 
            placeholder="选择生产日期" 
            style="width: 100%" 
          />
        </el-form-item>
        <el-form-item label="保质期(天)" prop="shelfLife">
          <el-input-number v-model="form.shelfLife" :min="0" style="width: 100%" placeholder="请输入保质期天数" />
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
import { usePurchaseIn } from '@/composables/usePurchase'
import dayjs from 'dayjs'

const {
  loading,
  purchaseList,
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
  cancel,
  handleSelectionChange,
  handleDelete
} = usePurchaseIn()

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