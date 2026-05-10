import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { listOutbound, addOutbound, updateOutbound, getOutbound, delOutbound, type OutboundRecord, type OutboundQueryParams } from '@/api/outbound'

export function useOutbound() {
  const loading = ref(false)
  const outboundList = ref<OutboundRecord[]>([])
  const total = ref(0)
  const showSearch = ref(true)
  const open = ref(false)
  const title = ref('')

  const queryParams = reactive<OutboundQueryParams>({
    pageNum: 1,
    pageSize: 10,
    productName: null,
    specification: null,
    outDate: null
  })

  const form = reactive<OutboundRecord>({
    id: null,
    productName: null,
    specification: null,
    quantity: null,
    unit: null,
    outDate: null,
    remark: null
  })

  const rules = {
    productName: [{ required: true, message: '产品名称不能为空', trigger: 'blur' }],
    quantity: [{ required: true, message: '出库数量不能为空', trigger: 'blur' }],
    outDate: [{ required: true, message: '出库日期不能为空', trigger: 'change' }]
  }

  /**
   * 日期格式化函数 - 只显示年月日
   */
  const dateFormatter = (row: any, column: any, cellValue: string) => {
    if (!cellValue) return '-'
    return cellValue.substring(0, 10)
  }

  const getList = () => {
    loading.value = true
    listOutbound(queryParams).then(response => {
      outboundList.value = response.rows || []
      total.value = response.total || 0
      loading.value = false
    }).catch(() => {
      loading.value = false
    })
  }

  const handleCurrentChange = (page: number) => {
    queryParams.pageNum = page
    getList()
  }

  const handleSizeChange = (size: number) => {
    queryParams.pageSize = size
    getList()
  }

  const handleQuery = () => {
    queryParams.pageNum = 1
    getList()
  }

  const resetQuery = () => {
    queryParams.productName = null
    queryParams.specification = null
    queryParams.outDate = null
    queryParams.pageNum = 1
    getList()
  }

  const reset = () => {
    form.id = null
    form.productName = null
    form.specification = null
    form.quantity = null
    form.unit = null
    form.outDate = null
    form.remark = null
  }

  const handleAdd = () => {
    reset()
    open.value = true
    title.value = '新增出库'
  }

  const handleUpdate = (row: OutboundRecord) => {
    reset()
    const id = row.id
    if (!id) return
    getOutbound(id).then(response => {
      Object.assign(form, response.data)
      open.value = true
      title.value = '修改出库'
    }).catch(() => {
      ElMessage.error('获取详情失败')
    })
  }

  const submitForm = () => {
    if (!form.productName || !form.quantity || !form.outDate) {
      ElMessage.warning('请填写必填项')
      return
    }
    
    if (form.id != null) {
      updateOutbound(form).then(() => {
        ElMessage.success('修改成功')
        open.value = false
        getList()
      }).catch(() => {
        ElMessage.error('修改失败')
      })
    } else {
      addOutbound(form).then(() => {
        ElMessage.success('新增成功')
        open.value = false
        getList()
      }).catch(() => {
        ElMessage.error('新增失败')
      })
    }
  }

  const handleDelete = (row?: OutboundRecord) => {
    const delIds = row ? [row.id as number] : []
    if (!row) {
      ElMessage.warning('请选择要删除的数据')
      return
    }
    ElMessageBox.confirm('是否确认删除出库记录？', '提示', { type: 'warning' })
      .then(() => delOutbound(String(delIds[0])))
      .then(() => {
        getList()
        ElMessage.success('删除成功')
      })
      .catch(() => {})
  }

  const cancel = () => {
    open.value = false
    reset()
  }

  onMounted(() => {
    getList()
  })

  return {
    loading,
    outboundList,
    total,
    showSearch,
    open,
    title,
    queryParams,
    form,
    rules,
    dateFormatter,
    getList,
    handleCurrentChange,
    handleSizeChange,
    handleQuery,
    resetQuery,
    handleAdd,
    handleUpdate,
    submitForm,
    handleDelete,
    cancel
  }
}