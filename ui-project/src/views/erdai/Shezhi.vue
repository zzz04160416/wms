<template>
  <div class="page-container">
    <!-- 页面头部 -->
    <div class="page-header">
      <h2 class="page-title">用户管理</h2>
      <el-button type="primary" @click="openAdd">新增用户</el-button>
    </div>

    <!-- 搜索栏 -->
    <div class="search-bar">
      <el-input
        v-model="searchUsername"
        placeholder="搜索手机号"
        class="search-input"
        @input="handleSearch"
      />
      <el-button type="primary" @click="getUserList">搜索</el-button>
    </div>

    <!-- 表格 -->
    <div class="table-card">
      <el-table :data="userList" style="width: 100%">
        <el-table-column type="index" label="ID" width="60" />
        <el-table-column prop="userName" label="用户名" />
        <el-table-column prop="nickName" label="真实姓名" />
        <el-table-column prop="status" label="状态" width="80">
          <template #default="scope">
            <el-tag :type="scope.row.status === '0' ? 'success' : 'danger'">
              {{ scope.row.status === '0' ? '正常' : '停用' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间" width="180" />
        <el-table-column label="操作" width="180">
          <template #default="scope">
            <el-button size="small" @click="editUser(scope.row)">编辑</el-button>
            <el-button
              size="small"
              type="danger"
              @click="deleteUser(scope.row.userId, scope.row.userName)"
            >
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!-- 新增/编辑弹窗 -->
    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="450px">
      <el-form label-width="80px">
        <el-form-item label="姓名" required>
          <el-input v-model="form.nickName" placeholder="真实姓名" />
        </el-form-item>

        <!-- 新增时显示密码和确认密码 -->
        <template v-if="!isEdit">
          <el-form-item label="密码" required>
            <el-input v-model="form.password" type="password" placeholder="请输入密码" />
          </el-form-item>

          <el-form-item label="确认密码" required>
            <el-input 
              v-model="form.confirmPassword" 
              type="password" 
              placeholder="请再次输入密码"
              @blur="checkPasswordMatch"
            />
            <span v-if="passwordError" class="password-error">{{ passwordError }}</span>
          </el-form-item>
        </template>

        <el-form-item label="手机号" required>
          <el-input v-model="form.phonenumber" placeholder="请输入11位手机号" />
        </el-form-item>

        <el-form-item label="状态">
          <el-select v-model="form.status" style="width: 100%">
            <el-option label="正常" value="0" />
            <el-option label="停用" value="1" />
          </el-select>
        </el-form-item>
      </el-form>

      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="saveUser" :loading="saving">
          保存
        </el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { onMounted, onActivated } from 'vue'
import { useUser } from '@/composables/useUser'

// ==================== 使用封装的 composable ====================
const {
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
} = useUser()

// ==================== 生命周期 ====================
onMounted(() => {
  getUserList()
})

onActivated(() => {
  getUserList()
})
</script>

<style scoped>
.page-container {
  margin-top: -20px;
  background: #f5f7fa;
  min-height: 100%;
}

.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
  padding:0 35px 0 20px;
}

.page-title {
  margin: 0;
  font-size: 20px;
  font-weight: 600;
}

.search-bar {
  background: #fff;
  padding: 10px 10px 0 15px;
  border-radius: 8px;
  margin-bottom: 15px;
  display: flex;
  gap: 10px;
  justify-content: flex-end;
 padding-bottom: 10px;
}

.search-input {
  width: 200px;
}

.table-card {
  background: #fff;
  padding: 15px;
  border-radius: 8px;
}

/* 密码错误提示样式 */
.password-error {
  color: #f56c6c;
  font-size: 12px;
  line-height: 1;
  margin-top: 4px;
  display: inline-block;
}
</style>