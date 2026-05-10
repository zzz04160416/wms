import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  // ========== state（数据） ==========
  state: () => ({
    username: '',    // 用户名
    token: '',        // token
    role: ''
  }),

  // ========== getters（计算属性） ==========
  getters: {
    // 是否已登录 !!表示一旦非空转换为布尔值
    isLoggedIn: (state) => !!state.token,

    // 用户名（方便使用）
    userName: (state) => state.username,
     // 是否管理员
    isAdmin: (state) => state.role === 'admin'
  },

  // ========== actions（方法） ==========
  actions: {
    // 记录用户信息（登录时调用）
    setUserInfo(data: { username: string; token: string;role: string }) {
      this.username = data.username
      this.token = data.token
      this.role = data.role
    },

    // 清空用户信息（退出时调用）
    clearUserInfo() {
      this.username = ''
      this.token = ''
      this.role = ''
    }
  }
})