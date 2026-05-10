import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { listPurchaseIn, addPurchaseIn, updatePurchaseIn, delPurchaseIn, getPurchaseIn, type PurchaseInRecord, type PurchaseInQueryParams } from '@/api/purchase'



export function usePurchaseIn() {
  const loading = ref(false)
  const purchaseList = ref<PurchaseInRecord[]>([])
  const total = ref(0)
  const showSearch = ref(true)
  const open = ref(false)
  const title = ref('')

  const queryParams = reactive<PurchaseInQueryParams>({
    pageNum: 1,
    pageSize: 10,
    productName: null,
    specification: null,
    storageDate: null
  })

  const form = reactive<PurchaseInRecord>({
    id: null,
    productName: null,
    specification: null,
    quantity: null,
    unit: null,
    productionDate: null,
    shelfLife: null,
    storageDate: null,
    remark: null,
     location: null,   
  type: 'in' 
  })

  const rules = {
    productName: [{ required: true, message: '产品名称不能为空', trigger: 'blur' }],
    quantity: [{ required: true, message: '入库数量不能为空', trigger: 'blur' }],
    unit: [{ required: true, message: '单位不能为空', trigger: 'blur' }]
  }

  const getList = () => {
    loading.value = true
    listPurchaseIn(queryParams).then(response => {
      purchaseList.value = response.rows || []
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
    queryParams.storageDate = null
    queryParams.pageNum = 1
    getList()
  }

  const reset = () => {
    form.id = null
    form.productName = null
    form.specification = null
    form.quantity = null
    form.unit = null
    form.productionDate = null
    form.shelfLife = null
    form.storageDate = null
    form.remark = null
  }

  const handleAdd = () => {
    reset()
    open.value = true
    title.value = '新增入库'
  }

  const handleUpdate = (row: PurchaseInRecord) => {
    reset()
    const id = row.id
    if (!id) return
    getPurchaseIn(id).then(response => {
      Object.assign(form, response.data)
      open.value = true
      title.value = '修改入库'
    }).catch(() => {
      ElMessage.error('获取详情失败')
    })
  }

  const submitForm = () => {
    if (!form.productName || !form.quantity || !form.unit) {
      ElMessage.warning('请填写必填项')
      return
    }
    
    if (form.id != null) {
      updatePurchaseIn(form).then(() => {
        ElMessage.success('修改成功')
        open.value = false
        getList()
      }).catch(() => {
        ElMessage.error('修改失败')
      })
    } else {
      addPurchaseIn(form).then(() => {
        ElMessage.success('新增成功')
        open.value = false
        getList()
      }).catch(() => {
        ElMessage.error('新增失败')
      })
    }
  }

  const cancel = () => {
    open.value = false
    reset()
  }

  // 多选
  const handleSelectionChange = (selection: PurchaseInRecord[]) => {
    // 用于批量删除
  }

  // 删除（支持单个和批量）
  const handleDelete = (row?: PurchaseInRecord) => {
    const delIds = row ? [row.id as number] : []
    if (!row) {
      ElMessage.warning('请选择要删除的数据')
      return
    }
    ElMessageBox.confirm('是否确认删除入库记录？删除后库存将自动减少！', '提示', { type: 'warning' })
      .then(() => delPurchaseIn(String(delIds[0])))
      .then(() => {
        ElMessage.success('删除成功')
        getList()
      })
      .catch(() => {})
  }

  onMounted(() => {
    getList()
  })

  return {
    loading,
    purchaseList,
    total,
    showSearch,
    open,
    title,
    queryParams,
    form,
    rules,
    getList,
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
  }
}