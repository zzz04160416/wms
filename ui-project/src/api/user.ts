import request from '@/utils/request'

// ==================== 类型定义 ====================

// 用户数据类型
export interface User {
  userId: number
  userName: string
  phonenumber: string
  email: string
  status: string
  createTime?: string
  nickName?: string
}

// 分页响应数据类型
export interface PageResult<T> {
  code: number
  msg: string
  rows: T[]      // 数据列表
  total: number  // 总数
}

// 新增用户参数类型
export interface AddUserParams {
  userName: string
  password: string
  nickName: string
  phonenumber: string
  email?: string
  status?: string
  deptId?: number
  roleIds?: number[]
}

// 编辑用户参数类型
export interface UpdateUserParams {
  userId: number
  userName: string
  phonenumber: string
  email?: string
  status?: string
}

// ==================== API 接口 ====================

/**
 * 获取用户列表
 * @param params 查询参数（可选）
 * @returns Promise<PageResult<User>> 分页数据
 */
export function getUserList(params?: { userName?: string }) {
  return request<PageResult<User>>({
    url: '/system/user/list',
    method: 'get',
    params
  })
}

/**
 * 新增用户
 * @param data 用户信息
 * @returns Promise
 */
export function addUser(data: AddUserParams) {
  return request({
    url: '/system/user',
    method: 'post',
    data
  })
}

/**
 * 编辑用户
 * @param data 用户信息
 * @returns Promise
 */
export function updateUser(data: UpdateUserParams) {
  return request({
    url: '/system/user',
    method: 'put',
    data
  })
}

// src/api/user.ts

// 软删除用户（若依自带的，标记 del_flag = 2）
export function deleteUser(userId: number) {
  return request({
    url: `/system/user/${userId}`,
    method: 'delete'
  })
}