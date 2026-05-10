import { createRouter, createWebHistory } from 'vue-router'
import { useUserStore } from '@/stores/user'
import { getToken, getUsername, getRole } from '@/composables/auth'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    // 登录页（独立，全屏）
    {
      path: '/',
      name: 'dengLu',
      component: () => import('@/dengLu.vue')
    },


    {
      path: '/main',
      component: () => import('@/views/yidai/MainLayout.vue'),
      children: [
        {
          path: 'shouYe',
          name: 'shouYe',
          component: () => import('@/views/erdai/shouYe.vue')
        },
        {
          path: 'caigouRuku',
          name: 'caigouRuku',
          component: () => import('@/views/erdai/caigouRuku.vue')
        },
        {
          path: 'xiaoshouChuku',
          name: 'xiaoshouChuku',
          component: () => import('@/views/erdai/xiaoshouChuku.vue')
        },
        {
          path: 'shangpinGuanli',
          name: 'shangpinGuanli',
          component: () => import('@/views/erdai/shangpinGuanli.vue')
        },
         
        {
          path: 'Shezhi',
          name: 'Shezhi',
          component: () => import('@/views/erdai/Shezhi.vue'),
          meta: { role: 'admin' }
        },
       

        {
          path: '',
          redirect: '/main/shouYe'
        }
      ]
    },

    // 404
    {
      path: '/404',
      component: () => import('@/views/404.vue')
    },
    {
      path: '/:pathMatch(.*)*',
      redirect: '/404'
    }
  ]
})


// ========== 全局前置守卫 ==========
router.beforeEach((to, from) => {
  // 获取用户 store
  const userStore = useUserStore()

  // 需要登录才能访问的页面（/main 开头的）
  const needAuth = to.path.startsWith('/main')//.startsWith()检查以...开头

  if (needAuth) {
    // 刷新后 pinia state 会丢失，但 localStorage 里的 token 仍在；
    // 以 localStorage 为准，避免误判“未登录”导致刷新退出登录。
    const storedToken = getToken()
    const storedUsername = getUsername() || ''
    const storedRole = getRole() || ''
    if (storedToken) {
      // 同步回 pinia，保证后续页面能直接使用 store 的 token/username
      if (!userStore.isLoggedIn) {
        userStore.setUserInfo({
          username: storedUsername,
          token: storedToken,
          role: storedRole
        })
      }
      return true//放行
    }

    return '/' // 未登录，跳转到登录页
  } else {
    return true  // 不需要登录的页面，直接放行
  }
})


export default router