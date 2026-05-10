import request from '@/utils/request'

// 注册接口（若依默认没有，需要自己加）
// 注意：若依默认没有开放注册，这个接口需要后端自己添加
export function registerApi(data: any) {
  return request({
    url: '/register',
    method: 'post',
    data: {
      username: data.username,
      password: data.password
    }
  })
}