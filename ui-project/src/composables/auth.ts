// src/utils/auth.ts

// 存储的 key 常量
const TOKEN_KEY = 'token'
const USERNAME_KEY = 'username'
const ROLE_KEY = 'role'
// 存储 token
export function setToken(token: string) {
  localStorage.setItem(TOKEN_KEY, token)
}

// 获取 token
export function getToken() {
  return localStorage.getItem(TOKEN_KEY)
}

// 删除 token
export function removeToken() {
  localStorage.removeItem(TOKEN_KEY)
}

// 存储用户名
export function setUsername(username: string) {
  localStorage.setItem(USERNAME_KEY, username)
}

// 获取用户名
export function getUsername() {
  return localStorage.getItem(USERNAME_KEY)
}

// 删除用户名
export function removeUsername() {
  localStorage.removeItem(USERNAME_KEY)
}
// ===== role（管理员 / 普通用户）=====
export function setRole(role: string) {
  localStorage.setItem(ROLE_KEY, role)
}

export function getRole() {
  return localStorage.getItem(ROLE_KEY)
}

export function removeRole() {
  localStorage.removeItem(ROLE_KEY)
}

// 清除所有登录信息（退出登录用）
export function clearAuth() {
  removeToken()
  removeUsername()
}

// 检查是否已登录
export function isLoggedIn() {
  return !!getToken()  // 有 token 就代表已登录
}
