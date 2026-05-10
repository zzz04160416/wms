import request from '@/utils/request'

// 登录接口
export function login(data: any) {
  return request({
    url: '/login',
    method: 'post',
    data: {
      username: data.username,
      password: data.password,
      code: data.code,
      uuid: data.uuid
    }
  })
}

// 获取图形验证码
export function getCaptchaImage() {
  return request({
    url: '/captchaImage',
    method: 'get'
  })
}

// 获取当前用户信息
export function getUserInfo() {
  return request({
    url: '/getInfo',
    method: 'get'
  })
}

// 退出登录
export function logout() {
  return request({
    url: '/logout',
    method: 'delete'
  })
}