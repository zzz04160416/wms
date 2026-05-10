<template>
  <div class="layout-container">
    <!-- 顶部导航栏 -->
    <el-header class="navbar" height="60px">
      <div class="navbar-left">
        <el-icon class="logo-icon" :size="24"><Coin /></el-icon>
        <span class="logo-text">聚宝盆</span>
      </div>
     
      <div class="navbar-center">
       
      </div>
      
      <div class="navbar-right">
  
    <div class="user-card">
    <div class="avatar-icon">
      <el-icon :size="18"><UserFilled /></el-icon>
    </div>
    <span class="username">{{ username }}</span>
  </div>

        <el-button type="info" @click="logout">退出登录</el-button>
      </div>
    </el-header>

    <!-- 主体区域 -->
    <el-container class="main-layout">
      <!-- 侧边栏导航 -->
      <el-aside class="sidebar" width="220px">
        <el-menu
          :default-active="$route.path"  
          router
          class="sidebar-menu"
          background-color="#ffffff"
          text-color="#4b5563"
          active-text-color="#2563eb"
        >
          <div class="menu-title">主菜单</div>
          <!-- 修改菜单路径：加上 /main 前缀 -->
          <el-menu-item index="/main/shouYe">
            <el-icon><Odometer /></el-icon>
            <span>首页</span>
          </el-menu-item>
          
          <el-menu-item index="/main/caigouRuku">
            <el-icon><Download /></el-icon>
            <span>采购入库</span>
          </el-menu-item>
          
          <el-menu-item index="/main/xiaoshouChuku">
            <el-icon><ShoppingCart /></el-icon>
            <span>销售出库</span>
          </el-menu-item>
          
          <el-menu-item index="/main/shangpinGuanli">
            <el-icon><GoodsFilled /></el-icon>
            <span>商品库存</span>
          </el-menu-item>
          
     
        <div  v-if="userStore.role === 'admin'">
          <div class="menu-divider"></div>
          <div class="menu-title">系统</div>

          <el-menu-item index="/main/shezhi">
            <el-icon><User /></el-icon>
            <span>用户管理</span>
          </el-menu-item>
        </div>
          
        </el-menu>
      </el-aside>
      <!-- 内容区域 -->
      <!-- <el-main class="content-area">
        <router-view />
      </el-main> -->
      <!-- 内容区域 -->
<el-main class="content-area">
  <keep-alive>
    <router-view />
  </keep-alive>
</el-main>
    </el-container>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { removeToken, removeUsername } from '@/composables/auth'
import { useUserStore } from '@/stores/user'
import {
  Box,
  Search,
  ArrowDown,
  Setting,
  Odometer,
  Download,
  ShoppingCart,
  GoodsFilled,
} from '@element-plus/icons-vue'


const router = useRouter()
const username = ref('管理员')
const userStore = useUserStore()

// 退出登录
const logout = () => {
  removeToken()
  removeUsername()
  userStore.clearUserInfo()
  ElMessage.success('已退出登录')
  router.replace('/')
}

onMounted(() => {
  const storedUsername = localStorage.getItem('username')
  if (storedUsername) {
    username.value = storedUsername
  }
})
</script>

<style scoped>
.layout-container {
  height: 100vh;
  display: flex;
  flex-direction: column;
  background-color: #f3f6f9;
}

/* 导航栏样式 */
.navbar {
  background: white;
  border-bottom: 1px solid #e9eef2;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 24px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.02);
  flex-shrink: 0;
}

.navbar-left {
  display: flex;
  align-items: center;
  gap: 12px;
}

.logo-icon {
  width: 40px;
  height: 40px;
  background: linear-gradient(135deg, #f5e7a3 0%, #f6c936 50%, #c28e09 100%);
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
   color: #fff;
}

.logo-text {
  font-size: 20px;
  font-weight: 600;
  color: #1e293b;
  letter-spacing: 0.5px;
}

.logo-light {
  color: #2563eb;
  font-weight: 700;
  margin-left: 2px;
}

.navbar-center {
  flex: 0 1 400px;
}

.global-search {
  --el-input-border-radius: 20px;
  --el-input-hover-border-color: #2563eb;
}

.navbar-right {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-right: -90px;
}



.user-profile:hover {
  background: #f1f5f9;
}

/* 主体布局 */
.main-layout {
  flex: 1;
  overflow: hidden;
  display: flex;
}

/* 侧边栏样式 */
.sidebar {
  background: white;
  border-right: 1px solid #e9eef2;
  height: 100%;
  overflow-y: auto;
  box-shadow: 2px 0 8px rgba(0,0,0,0.02);
  flex-shrink: 0;
}

.sidebar-menu {
  border-right: none;
  height: 100%;
  /* 顶部贴紧导航栏，避免产生视觉缝隙 */
  padding: 0;
}

.menu-title {
  font-size: 12px;
  font-weight: 600;
  color: #94a3b8;
  padding: 8px 20px 4px;
  letter-spacing: 0.5px;
  text-transform: uppercase;
}

.sidebar-menu .el-menu-item {
  display: flex;
  align-items: center;
  margin: 2px 12px;
  padding: 0 12px;
  border-radius: 8px;
  height: 44px;
  transition: all 0.2s;
}

.sidebar-menu .el-menu-item:hover {
  background-color: #f1f5f9;
}

.sidebar-menu .el-menu-item.is-active {
  background: linear-gradient(90deg, #eef2ff, #ffffff);
  font-weight: 600;
  border-left: 3px solid #2563eb;
}

.sidebar-menu .el-menu-item i {
  margin-right: 12px;
  font-size: 18px;
}

.menu-divider {
  height: 1px;
  background: #e9eef2;
  margin: 12px 12px;
}

/* 自定义滚动条 */
.sidebar::-webkit-scrollbar {
  width: 4px;
}

.sidebar::-webkit-scrollbar-track {
  background: transparent;
}

.sidebar::-webkit-scrollbar-thumb {
  background: #d1d9e6;
  border-radius: 4px;
}

/* 内容区域 */
.content-area {
  flex: 1;
  /* Element Plus 的 el-main 默认 padding=20px，这里强制顶部为 0 */
  padding: 0 20px 20px !important;
  background: #f3f6f9;
  overflow-y: auto;
}
.main-layout{
  margin-top: -20px;
}
.user-card {
  display: flex;
  align-items: center;
  gap: 10px;
  background: linear-gradient(135deg, #f5f7fa, #e9edf2);
  padding: 6px 16px 6px 8px;
  border-radius: 40px;
  cursor: pointer;
  transition: all 0.2s ease;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
}



.avatar-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  background: linear-gradient(135deg, #667eea, #764ba2);
  border-radius: 50%;
  color: white;
  box-shadow: 0 2px 6px rgba(102, 126, 234, 0.3);
}

.username {
  font-size: 14px;
  font-weight: 500;
  color: #1e293b;
}
</style>