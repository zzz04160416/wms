import { ref } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getUserList as apiGetUserList, addUser, updateUser, deleteUser as apiDeleteUser } from '@/api/user'

// ==================== 类型定义 ====================

// 用户信息结构（后端返回的数据格式）
export interface User {
  userId: number        // 用户ID
  userName: string      // 登录名
  phonenumber: string   // 手机号
  email: string         // 邮箱
  status: string        // 0=正常，1=停用
  createTime?: string   // 注册时间
  nickName?: string     // 昵称（真实姓名）
}

// 表单数据结构（页面上填的表单）
export interface UserForm {
  userId: number | string    // 用户ID（编辑时用）
  userName: string           // 用户名
  nickName: string           // 真实姓名
  password: string           // 密码
  confirmPassword: string    // 确认密码
  phonenumber: string        // 手机号
  email: string              // 邮箱
  status: string             // 状态
}

/**
 * 用户管理功能
 * 把用户相关的数据和方法打包在一起，页面直接调用就行
 */
export function useUser() {
  // ==================== 数据 ====================

  const userList = ref<User[]>([])           // 用户列表（表格显示用）
  const dialogVisible = ref<boolean>(false)  // 弹窗开关（true=显示，false=隐藏）
  const dialogTitle = ref<string>('新增用户') // 弹窗标题
  const searchUsername = ref<string>('')     // 搜索框输入的内容
  const saving = ref<boolean>(false)         // 保存按钮是否在转圈圈
  const isEdit = ref<boolean>(false)         // 当前是编辑模式还是新增模式
  const passwordError = ref<string>('')      // 密码错误提示文字

  // 表单数据（用户填的内容）
  const form = ref<UserForm>({
    userId: '',
    userName: '',
    nickName: '',
    password: '',
    confirmPassword: '',
    phonenumber: '',
    email: '',
    status: '0'        // 默认正常
  })

  // ==================== 功能函数 ====================

  // 检查两次密码是否一致（输入框失去焦点时触发）
  const checkPasswordMatch = (): void => {
    if (form.value.confirmPassword !== form.value.password) {
      passwordError.value = '两次输入的密码不一致'
    } else {
      passwordError.value = ''//如果输入的正确则清空提示
    }
  }

  // 获取用户列表（页面加载和搜索时调用）
  const getUserList = async (): Promise<void> => {
    try {
      // 调用后端接口获取数据
      const res: any = await apiGetUserList({ userName: searchUsername.value })
      const allUsers: User[] = res.rows || []
      // 把 admin 藏起来，不让普通用户看到和操作（这里用 '110' 过滤）
      userList.value = allUsers.filter((user: User) => user.userName !== '110')
    } catch (error) {
      console.error('获取用户列表失败:', error)
      ElMessage.error('获取用户列表失败')
    }
  }

  // 搜索防抖（输入时等0.3秒再搜索，避免频繁请求）
  let timer: ReturnType<typeof setTimeout> | null = null
  const handleSearch = (): void => {
    if (timer) clearTimeout(timer)
    timer = setTimeout(() => {
      getUserList()
    }, 300)
  }

  // 打开新增弹窗
  const openAdd = (): void => {
    isEdit.value = false                      // 设置为新增模式
    dialogTitle.value = '新增用户'
    passwordError.value = ''
    // 清空表单
    form.value = {
      userId: '',
      userName: '',
      nickName: '',
      password: '',
      confirmPassword: '',
      phonenumber: '',
      email: '',
      status: '0'
    }
    dialogVisible.value = true                // 显示弹窗
  }

  // 打开编辑弹窗（点击表格里的编辑按钮时触发）
  const editUser = (row: User): void => {
    isEdit.value = true                       // 设置为编辑模式
    dialogTitle.value = '编辑用户'
    passwordError.value = ''
    // 把选中的用户数据填到表单里
    form.value = {
      userId: row.userId,
      userName: row.userName,
      nickName: row.nickName || '',
      password: '',
      confirmPassword: '',
      phonenumber: row.phonenumber,
      email: row.email,
      status: row.status
    }
    dialogVisible.value = true
  }

  // 保存用户（新增或编辑）
  const saveUser = async (): Promise<void> => {
    // ----- 校验数据 -----
    if (!form.value.nickName) {
      ElMessage.warning('请输入真实姓名')
      return
    }
    if (!isEdit.value) {
      if (!form.value.password) {
        ElMessage.warning('请输入密码')
        return
      }
      if (form.value.password !== form.value.confirmPassword) {
        ElMessage.warning('两次输入的密码不一致')
        return
      }
    }

    if (!form.value.phonenumber) {
      ElMessage.warning('请输入手机号')
      return
    }

    if (!/^\d{11}$/.test(form.value.phonenumber)) {
      ElMessage.warning('手机号必须是11位数字')
      return
    }

    // ----- 保存数据 -----
    saving.value = true   // 按钮开始转圈圈

    try {
      if (isEdit.value) {
        // 编辑：调修改接口
        await updateUser({
          userId: Number(form.value.userId),
          userName: form.value.userName,
          phonenumber: form.value.phonenumber,
          email: form.value.email,
          status: form.value.status
        })
        ElMessage.success('修改成功')
      } else {
        // 新增：调新增接口
        await addUser({
          userName: form.value.phonenumber || '用户',
          password: form.value.password,
          nickName: form.value.nickName || form.value.userName || '用户',
          phonenumber: form.value.phonenumber,
          email: form.value.email,
          status: form.value.status
        })
        ElMessage.success('新增成功')
      }

      dialogVisible.value = false   // 关闭弹窗
      getUserList()                 // 刷新列表
    } catch (error: any) {
      console.error('保存失败:', error)
      if (error.msg && (error.msg.includes('手机号') || error.msg.includes('Duplicate'))) {
        ElMessage.error('手机号已存在，请更换手机号')
      } else {
        ElMessage.error(error.msg || '保存失败')
      }
    } finally {
      saving.value = false          // 按钮停止转圈圈
    }
  }

  // 删除用户
  const deleteUser = (userId: number, userName: string): void => {
    // 不能删管理员（这里用 '110' 判断）
    if (userName === '110') {
      ElMessage.warning('不能删除管理员账户')
      return
    }

    // 弹出确认框
    ElMessageBox.confirm(
      '确定要删除这个用户吗？',
      '删除确认',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }
    ).then(async () => {
      try {
        // 调用 API 删除用户
        await apiDeleteUser(userId)
        ElMessage.success('删除成功')
        getUserList()  // 刷新列表
      } catch (error: any) {
        console.error('删除失败:', error)
        ElMessage.error(error.msg || '删除失败')
      }
    }).catch(() => {
      ElMessage.info('已取消删除')
    })
  }

  // ==================== 返回给页面用 ====================
  return {
    // 数据
    userList,        // 用户列表数据（表格显示用的数组）
    dialogVisible,   // 弹窗开关（true=显示弹窗，false=隐藏弹窗）
    dialogTitle,     // 弹窗标题（"新增用户" 或 "编辑用户"）
    searchUsername,  // 搜索框输入的关键词
    saving,          // 保存按钮状态（true=显示转圈圈，false=正常）
    isEdit,          // 当前模式（true=编辑模式，false=新增模式）
    passwordError,   // 密码错误提示文字（比如"两次输入的密码不一致"）
    form,            // 表单数据（用户填写的用户名、密码、手机号等）

    // ==================== 方法 ====================
    getUserList,        // 获取用户列表
    handleSearch,       // 处理搜索输入
    openAdd,            // 打开新增弹窗
    editUser,           // 打开编辑弹窗
    saveUser,           // 保存用户
    deleteUser,         // 删除用户
    checkPasswordMatch  // 检查两次密码是否一致
  }
}