// 这个文件是应用的入口，负责初始化Vue应用
import { createApp } from 'vue'           // Vue核心
import { createPinia } from 'pinia'       // 状态管理
import App from './App.vue'                // 根组件
import router from './router'
import '@/utils/request' // 注册 axios 拦截器（请求自动携带 token）
import Antd from 'ant-design-vue'
// 引入Bootstrap样式 - 注意路径要正确
import 'bootstrap/dist/css/bootstrap.min.css'  // Bootstrap核心样式
import 'bootstrap-icons/font/bootstrap-icons.css'  // Bootstrap图标库
// 引入 Element Plus
import 'element-plus/dist/index.css'  // 引入样式
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import ElementPlus from 'element-plus'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
// 创建Vue应用实例
const app = createApp(App)
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}
// 使用插件
app.use(createPinia())  // 使用Pinia状态管理
app.use(Antd)           // 使用Ant Design Vue
app.use(router)         // 使用路由

// 使用 Element Plus（只使用一次，并配置中文）
app.use(ElementPlus, {
    locale: zhCn,  // 设置中文
})

// 挂载到DOM
app.mount('#app')