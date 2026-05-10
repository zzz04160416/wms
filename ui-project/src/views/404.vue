<template>
  <div class="flex-center h-screen">
    <el-empty description="页面不存在" :image-size="180">
      <el-button type="primary" @click="$router.push('/')">
        返回首页
      </el-button>
    </el-empty>
  </div>
</template>

<style scoped>
.flex-center {
  display: flex;
  justify-content: center;
  align-items: center;
}
.h-screen {
  height: 100vh;
}
</style>