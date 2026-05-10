<template>
  <div class="login-page">
    <div class="login-card">
      <!-- Logo -->
      <div class="logo">
       <el-icon class="logo-icon" :size="40"><Coin /></el-icon>
        <h1>聚宝盆
        </h1>
      </div>

      <p class="subtitle">欢迎回来，请登录您的账号</p>

      <!-- 登录表单 -->
      <el-form ref="formRef" :model="form" :rules="rules" label-position="top" @keyup.enter="handleLogin">
        <el-form-item label="手机号" prop="phonenumber">
          <el-input v-model="form.phonenumber" placeholder="请输入手机号" :prefix-icon="Phone" size="large" />
        </el-form-item>

        <el-form-item label="密码" prop="password">
          <el-input v-model="form.password" type="password" placeholder="请输入密码" :prefix-icon="Lock"
            show-password size="large" @keyup.enter="handleLogin" />
        </el-form-item>

        <!-- 图形验证码 -->
        <el-form-item label="验证码" prop="captcha">
          <div class="captcha-box">
            <el-input v-model="form.captcha" placeholder="请输入验证码" size="large" />
            <img :src="captchaImg" class="captcha-img" @click="getCaptcha" />
          </div>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" size="large" :loading="loading" @click="handleLogin" class="login-btn">
            登录
          </el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { login, getCaptchaImage, getUserInfo } from '@/api/dengLu'
import { setToken, setUsername, setRole } from '@/composables/auth'
import { useUserStore } from '@/stores/user'
import { User, Lock, Phone, Box } from '@element-plus/icons-vue'

const router = useRouter()
const loading = ref(false)
const formRef = ref(null)
const userStore = useUserStore()

// 图形验证码
const captchaImg = ref('')
const captchaUuid = ref('')

const form = reactive({
  phonenumber: '',
  password: '',
  captcha: '',
  uuid: ''
})

const rules = {
  phonenumber: [
    { required: true, message: '请输入手机号', trigger: 'blur' },
    { 
      validator: (rule, value, callback) => {
        // 允许 110 或者 11位手机号
        if (value === '110' || /^\d{11}$/.test(value)) {
          callback()
        } else {
          callback(new Error('请输入正确的手机号(11位数字)'))
        }
      }, 
      trigger: 'blur' 
    }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
  ],
  captcha: [
    { required: true, message: '请输入验证码', trigger: 'blur' }
  ]
}

// 获取图形验证码
const getCaptcha = async () => {
  try {
    const res = await getCaptchaImage()
    console.log('验证码响应:', res)
    captchaImg.value = 'data:image/gif;base64,' + res.img
    captchaUuid.value = res.uuid
    form.uuid = res.uuid
  } catch (error) {
    console.error('获取验证码失败:', error)
  }
}

// 登录方法
const handleLogin = async () => {
  if (!formRef.value) return
  await formRef.value.validate(async (valid) => {
    if (!valid) return
    loading.value = true

    try {
      // ========== 第一步：登录，获取 token ==========
      const response = await login({
        username: form.phonenumber,
        password: form.password,
        code: form.captcha,
        uuid: form.uuid
      })
      console.log('登录响应:', response)

      if (response.code === 200) {
        const token = response.token
        setToken(token)  // 先保存 token
        
        // ========== 第二步：获取用户信息（包括角色）==========
        const userInfoRes = await getUserInfo()
        console.log('用户信息响应:', userInfoRes)
        
        if (userInfoRes.code === 200) {
          // 从用户信息中获取用户名和角色
          const username = userInfoRes.user?.userName || form.phonenumber
          let role = userInfoRes.user?.roles?.[0]?.roleKey || 'common'
          
          // 强制设置：手机号是 110 就是管理员（防止数据库角色不对）
          if (form.phonenumber === '110') {
            role = 'admin'
          }

          setUsername(username)
          setRole(role)
          
          userStore.setUserInfo({
            username: username,
            token: token,
            role: role
          })
          
          ElMessage.success('登录成功')
          router.replace('/main/shouYe')
        } else {
          ElMessage.error(userInfoRes.msg || '获取用户信息失败')
          getCaptcha()
        }
      } else {
        ElMessage.error(response.msg || '登录失败')
        getCaptcha()
      }
    } catch (error) {
      console.log('请求异常：', error)
      ElMessage.error('登录失败，请检查网络或账号密码')
      getCaptcha()
    } finally {
      loading.value = false
    }
  })
}

// 页面加载时获取验证码
onMounted(() => {
  getCaptcha()
})
</script>

<style scoped>
.login-page {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(-45deg, #d4af37, #f5e7a3, #b8860b, #8b6914);
  position: relative;
  overflow: hidden;
}




.login-card {
  width: 400px;
  padding: 40px;
  background: white;
  border-radius: 16px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
}

.logo {
  text-align: center;
  margin-bottom: 20px;
}

.logo h1 {
  margin: 10px 0 0;
  font-size: 28px;
  color: #333;
}

.subtitle {
  text-align: center;
  color: #999;
  margin-bottom: 30px;
  font-size: 14px;
}

.login-btn {
  width: 100%;
}

.captcha-box {
  display: flex;
  gap: 10px;
  align-items: center;
}

.captcha-img {
  width: 120px;
  height: 40px;
  cursor: pointer;
  border-radius: 4px;
  border: 1px solid #dcdfe6;
}
</style>