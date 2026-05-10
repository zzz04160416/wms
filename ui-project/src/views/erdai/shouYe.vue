<template>
  <div class="warehouse-container">
    <!-- Three.js画布容器，3D内容会渲染到这里 -->
    <div ref="canvasRef" class="canvas"></div>

    <!-- 货物详情弹窗：点击货架后显示 -->
    <div
      v-if="selectedShelf"          
      class="detail-dialog"
      @click="selectedShelf = null" 
    >
      <div class="dialog-content" @click.stop>  
        <div class="dialog-header">
          <h3>📦 库位 {{ selectedShelf.name }}</h3> 

          <button class="close-btn" @click="selectedShelf = null">
            ✕
          </button>
        </div>

        <div class="dialog-body">

          <!-- 有货物时就循环显示 -->
          <div
            class="goods-list"
            v-if="selectedShelf.goodsList.length > 0"
          >
            <div
              v-for="(goods, idx) in selectedShelf.goodsList"
              :key="idx"
              class="goods-item"
            >
              <span class="goods-name">
                {{ goods.productName || '未知产品' }}  
              </span>

              <span class="goods-quantity">
                {{ goods.quantity }} {{ goods.unit || '件' }}  
              </span>
            </div>
          </div>

          <!-- 没货物时显示空状态 -->
          <div v-else class="empty-tip">
            📭 暂无货物
          </div>

          <!-- 合计行：显示总共有多少件 -->
          <div class="total-row">
            <span>📊 合计</span>

            <span
              class="total-value"
              :style="{ color: getStockColor(selectedShelf.totalStock) }"
            >
              {{ selectedShelf.totalStock }} 件
            </span>
          </div>

        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue' 
import * as THREE from 'three' 
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'  
import {
  CSS2DRenderer,
  CSS2DObject
} from 'three/examples/jsm/renderers/CSS2DRenderer.js' 
import { listStock } from '@/api/stock' 

// ========== DOM引用 ==========
const canvasRef = ref(null)  // 画布容器的引用
const selectedShelf = ref(null)  // 当前选中的货架，null就是没选中

// ========== Three.js核心变量 ==========
let scene  // 场景：装所有3D物体的大容器
let camera  // 相机：从哪个角度看
let renderer  // WebGL渲染器：把3D画成2D显示在屏幕上
let labelRenderer  // CSS2渲染器：专门画文字的
let controls  // 轨道控制器：鼠标拖拽旋转缩放
let shelves = []  // 存所有货架对象，用于点击检测
let raycaster  // 射线检测器：判断鼠标点到了哪个物体
let mouse  // 鼠标位置
let animationId = null  // 动画循环的ID，用于销毁时停止
const textureLoader = new THREE.TextureLoader()  // 图片加载器
let woodTexture = null  // 木纹贴图
let shelfTexture = null  // 货架贴图
let floorTexture = null  // 地面贴图

// ========== 货架配置 ==========
// 10个货架，2排，每排5个，每个容量50件
const SHELF_CONFIG = [
  { name: 'A1', position: { x: -6, z: -3 }, capacity: 50 },
  { name: 'A2', position: { x: -3, z: -3 }, capacity: 50 },
  { name: 'A3', position: { x: 0, z: -3 }, capacity: 50 },
  { name: 'A4', position: { x: 3, z: -3 }, capacity: 50 },
  { name: 'A5', position: { x: 6, z: -3 }, capacity: 50 },

  { name: 'A6', position: { x: -6, z: 3 }, capacity: 50 },
  { name: 'A7', position: { x: -3, z: 3 }, capacity: 50 },
  { name: 'A8', position: { x: 0, z: 3 }, capacity: 50 },
  { name: 'A9', position: { x: 3, z: 3 }, capacity: 50 },
  { name: 'A10', position: { x: 6, z: 3 }, capacity: 50 }
]

// ========== 辅助函数 ==========
// 根据库存数量返回颜色（用于弹窗边框和文字）
const getStockColor = (stock) => {
  const percent = stock / 50  // 计算占比
  if (percent < 0.3) return '#4caf50'  // 少于30%绿色
  if (percent < 0.7) return '#ff9800'  // 30%-70%橙色
  return '#f44336'  // 超过70%红色
}

// 根据库存获取货物方块的颜色
const getGoodsColor = (stock) => {
  const percent = stock / 50
  if (percent < 0.3) return 0x6aab5a  // 绿色
  if (percent < 0.7) return 0xe6a33c  // 橙色
  return 0xc95a4a  // 红色
}

// ========== 核心：从数据库加载库存数据 ==========
const loadStockData = async () => {
  try {
    // 调用后端API获取库存列表
    const res = await listStock({
      pageNum: 1,
      pageSize: 10
    })
    // 解析返回的数据
    const list = res.code === 200 ? (res.rows || []) : []

    // 创建一个Map，key是货架名，value是货物数组
    const stockMap = new Map()
    // 先初始化所有货架为空数组
    SHELF_CONFIG.forEach(config => {
      stockMap.set(config.name, [])
    })

    // 遍历每条库存记录，按location分类
    list.forEach(item => {
      const loc = item.location  // 获取库位，如"A1"
      if (stockMap.has(loc)) {
        // 把货物信息加到对应货架的数组里
        stockMap.get(loc).push({
          productName: item.productName,
          quantity: item.quantity,
          unit: item.unit,
          location: item.location
        })
      }
    })
    return stockMap
  } catch (error) {
    console.error('库存加载失败', error)
    // 失败时返回空数据
    const emptyMap = new Map()
    SHELF_CONFIG.forEach(config => {
      emptyMap.set(config.name, [])
    })
    return emptyMap
  }
}

// ========== 创建单个货架（3D模型）==========
const createShelf = (config, totalStock) => {
  const group = new THREE.Group()  // 创建组，把货架所有零件放一起
  const { x, z } = config.position
  group.position.set(x, 0, z)  // 设置位置

  // 金属材质（用于后挡板）
  const metalMaterial = new THREE.MeshStandardMaterial({
    map: woodTexture,  // 贴木纹
    color: 0x6c757d,
    metalness: 0.7,
    roughness: 0.3
  })

  // 货架材质（用于隔板）
  const shelfMaterial = new THREE.MeshStandardMaterial({
    map: shelfTexture,
    color: 0xc99e6f,
    roughness: 0.5
  })

  // 三层隔板
  const shelfLevels = [0.5, 1.2, 1.9]  // 高度
  shelfLevels.forEach(y => {
    const board = new THREE.Mesh(
      new THREE.BoxGeometry(1.9, 0.05, 1.5),  // 宽、高、深
      shelfMaterial
    )
    board.position.set(0, y, 0)
    group.add(board)
  })

  // 后挡板（防止货物掉出去）
  const backBoard = new THREE.Mesh(
    new THREE.BoxGeometry(2.0, 2.0, 0.05),
    metalMaterial
  )
  backBoard.position.set(0, 1.1, -0.85)
  group.add(backBoard)

  // 创建货物小方块，根据总库存数量显示
  const goodsList = []  // 存所有货物对象
  const displayCount = Math.min(totalStock, 45)  // 最多显示45个
  const levels = [0.65, 1.35, 2.05]  // 货物所在高度
  const columns = [-0.8, -0.4, 0, 0.4, 0.8]  // X轴位置（5列）
  const rows = [-0.5, 0, 0.5]  // Z轴位置（3行）
  const goodsColor = getGoodsColor(totalStock)

  for (let i = 0; i < displayCount; i++) {
    const level = levels[Math.floor(i / 15) % 3]  // 计算在哪一层
    const colIndex = i % 5  // 第几列
    const rowIndex = Math.floor((i % 15) / 5)  // 第几行
    const goods = new THREE.Mesh(
      new THREE.BoxGeometry(0.28, 0.12, 0.28),
      new THREE.MeshStandardMaterial({ color: goodsColor })
    )
    goods.position.set(columns[colIndex], level + 0.06, rows[rowIndex])
    group.add(goods)
    goodsList.push(goods)
  }

  // 文字标签（显示货架名和库存数）
  const div = document.createElement('div')
  div.textContent = `${config.name}\n${totalStock}件`
  div.style.cssText = `
    color: white;
    background: rgba(0,0,0,.7);
    padding: 4px 8px;
    border-radius: 4px;
    font-size: 14px;
    text-align: center;
    border-left: 3px solid ${getStockColor(totalStock)};
  `
  const label = new CSS2DObject(div)
  label.position.set(0, 2.4, 0)
  group.add(label)

  // 保存货架数据，方便后面更新和点击时用
  group.userData = {
    name: config.name,
    capacity: config.capacity,
    totalStock,
    goodsList: [],  // 货物明细数组，稍后填充
    goodsMeshes: goodsList,
    label
  }
  return group
}

// ========== 更新货架显示 ==========
const updateShelfDisplay = (shelf, goodsArray) => {
  // 重新计算总数
  const newTotal = goodsArray.reduce((sum, item) => sum + (item.quantity || 0), 0)
  shelf.userData.totalStock = newTotal
  shelf.userData.goodsList = goodsArray

  // 更新文字标签的内容
  const div = shelf.userData.label.element
  div.textContent = `${shelf.userData.name}\n${newTotal}件`
  div.style.borderLeftColor = getStockColor(newTotal)
}

// ========== 刷新整个3D场景（入库/出库后调用）==========
const refreshScene = async () => {
  const stockMap = await loadStockData()  // 重新从数据库拿数据
  for (const shelf of shelves) {
    const goodsArray = stockMap.get(shelf.userData.name) || []
    updateShelfDisplay(shelf, goodsArray)
  }
}

// ========== 点击检测（射线检测）==========
const onClick = (event) => {
  if (!renderer || !camera || !raycaster) return

  // 计算鼠标在canvas上的位置
  const rect = renderer.domElement.getBoundingClientRect()
  mouse.x = ((event.clientX - rect.left) / rect.width) * 2 - 1
  mouse.y = -((event.clientY - rect.top) / rect.height) * 2 + 1

  raycaster.setFromCamera(mouse, camera)  // 从相机发射射线
  const intersects = raycaster.intersectObjects(shelves, true)  // 检测碰撞

  if (intersects.length > 0) {
    let obj = intersects[0].object
    // 向上找，直到找到货架组
    while (obj.parent && !shelves.includes(obj)) {
      obj = obj.parent
    }
    if (shelves.includes(obj)) {
      // 显示弹窗
      selectedShelf.value = {
        name: obj.userData.name,
        totalStock: obj.userData.totalStock,
        capacity: obj.userData.capacity,
        goodsList: obj.userData.goodsList
      }
    }
  }
}

// ========== 窗口大小改变时重新适配 ==========
const onWindowResize = () => {
  if (!canvasRef.value) return
  const width = canvasRef.value.clientWidth
  const height = canvasRef.value.clientHeight
  camera.aspect = width / height
  camera.updateProjectionMatrix()
  renderer.setSize(width, height)
  if (labelRenderer) labelRenderer.setSize(width, height)
}

// ========== 初始化3D场景 ==========
const initScene = async () => {
  if (!canvasRef.value) return

  // 加载贴图图片
  woodTexture = textureLoader.load('/木纹.png')
  shelfTexture = textureLoader.load('/浅地板.png')
  floorTexture = textureLoader.load('/水泥地.jpg')

  // 创建场景
  scene = new THREE.Scene()
  scene.background = new THREE.Color(0x111122)
  scene.fog = new THREE.FogExp2(0x111122, 0.008)  // 雾效

  // 创建相机
  const width = canvasRef.value.clientWidth
  const height = canvasRef.value.clientHeight
  camera = new THREE.PerspectiveCamera(40, width / height, 0.1, 1000)
  camera.position.set(0, 8, 15)

  // 创建WebGL渲染器
  renderer = new THREE.WebGLRenderer({ antialias: true })
  renderer.setSize(width, height)
  renderer.shadowMap.enabled = true  // 开启阴影
  canvasRef.value.appendChild(renderer.domElement)

  // 创建CSS2渲染器（文字用）
  labelRenderer = new CSS2DRenderer()
  labelRenderer.setSize(width, height)
  labelRenderer.domElement.style.position = 'absolute'
  labelRenderer.domElement.style.top = '0'
  labelRenderer.domElement.style.left = '0'
  labelRenderer.domElement.style.pointerEvents = 'none'  // 让文字不干扰点击
  canvasRef.value.appendChild(labelRenderer.domElement)

  // 轨道控制器
  controls = new OrbitControls(camera, renderer.domElement)
  controls.enableDamping = true  // 惯性
  controls.target.set(0, 1.5, 0)

  // 灯光
  scene.add(new THREE.AmbientLight(0xffffff, 4))  // 环境光
  const dirLight = new THREE.DirectionalLight(0xfff5e6, 2)  // 方向光
  dirLight.position.set(3, 8, 2)
  dirLight.castShadow = true
  scene.add(dirLight)

  // 地面
  const groundPlane = new THREE.Mesh(
    new THREE.PlaneGeometry(20, 20),
    new THREE.MeshStandardMaterial({
      map: floorTexture,
      color: 0x6c757d,
      roughness: 0.8,
      metalness: 0.1
    })
  )
  groundPlane.rotation.x = -Math.PI / 2  // 旋转90度变平
  groundPlane.position.y = -0.08
  scene.add(groundPlane)

  // 加载库存数据并创建货架
  const stockMap = await loadStockData()
  SHELF_CONFIG.forEach(config => {
    const goodsArray = stockMap.get(config.name) || []
    const total = goodsArray.reduce((sum, item) => sum + (item.quantity || 0), 0)
    const shelf = createShelf(config, total)
    shelf.userData.goodsList = goodsArray
    scene.add(shelf)
    shelves.push(shelf)
  })

  // 射线检测器
  raycaster = new THREE.Raycaster()
  mouse = new THREE.Vector2()

  // 绑定点击事件（绑定到canvas上）
  renderer.domElement.addEventListener('click', onClick)
  window.addEventListener('resize', onWindowResize)

  // 动画循环
  function animate() {
    animationId = requestAnimationFrame(animate)
    controls.update()
    renderer.render(scene, camera)
    if (labelRenderer) labelRenderer.render(scene, camera)
  }
  animate()
}

// ========== 生命周期：组件挂载时执行 ==========
onMounted(() => {
  initScene()
})

// ========== 生命周期：组件销毁时清理资源 ==========
onUnmounted(() => {
  console.log('开始销毁Three.js')

  // 停止动画
  if (animationId) {
    cancelAnimationFrame(animationId)
    animationId = null
  }

  // 移除窗口事件
  window.removeEventListener('resize', onWindowResize)

  // 移除canvas上的点击事件
  if (renderer?.domElement) {
    renderer.domElement.removeEventListener('click', onClick)
  }

  // 销毁控制器
  if (controls) {
    controls.dispose()
    controls = null
  }

  // 遍历场景，释放所有几何体和材质的内存
  if (scene) {
    scene.traverse(obj => {
      if (obj.geometry) obj.geometry.dispose()
      if (obj.material) {
        if (Array.isArray(obj.material)) {
          obj.material.forEach(m => {
            if (m.map) m.map.dispose()
            m.dispose()
          })
        } else {
          if (obj.material.map) obj.material.map.dispose()
          obj.material.dispose()
        }
      }
    })
  }

  // 销毁渲染器
  if (renderer) {
    renderer.dispose()
    renderer.forceContextLoss()  // 强制释放WebGL上下文
    if (renderer.domElement?.parentNode) {
      renderer.domElement.parentNode.removeChild(renderer.domElement)
    }
    renderer = null
  }

  // 销毁CSS2渲染器
  if (labelRenderer) {
    if (labelRenderer.domElement?.parentNode) {
      labelRenderer.domElement.parentNode.removeChild(labelRenderer.domElement)
    }
    labelRenderer = null
  }

  // 销毁贴图
  if (woodTexture) woodTexture.dispose()
  if (shelfTexture) shelfTexture.dispose()
  if (floorTexture) floorTexture.dispose()

  // 清空数组和变量
  shelves = []
  scene = null
  camera = null
  raycaster = null
  mouse = null

  console.log('Three.js销毁完成')
})

// 暴露刷新方法给父组件调用
defineExpose({ refreshScene })
</script>

<style scoped>
/* 容器占满全屏 */
.warehouse-container {
  width: 100%;
  height: 100%;
  position: relative;
  overflow: hidden;
  background: #0a0a1a;
}

/* canvas占满容器 */
.canvas {
  width: 100%;
  height: 100%;
}

/* 弹窗定位在右上角 */
.detail-dialog {
  position: absolute;
  top: 24px;
  right: 24px;
  z-index: 1000;
}

/* 弹窗内容样式：毛玻璃效果 */
.dialog-content {
  width: 250px;
  max-height: 70vh;
  overflow: hidden;
  border-radius: 20px;
  background: rgba(20, 20, 30, 0.82);
  backdrop-filter: blur(14px);
  border: 1px solid rgba(255,255,255,.08);
  box-shadow: 0 10px 30px rgba(0,0,0,.35);
  animation: dialogShow .25s ease;
}

/* 弹窗淡入动画 */
@keyframes dialogShow {
  from {
    opacity: 0;
    transform: translateY(-10px) scale(.96);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

/* 弹窗头部 */
.dialog-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 18px 20px;
  border-bottom: 1px solid rgba(255,255,255,.06);
}

.dialog-header h3 {
  margin: 0;
  font-size: 18px;
  color: #ffb347;
}

/* 关闭按钮 */
.close-btn {
  width: 32px;
  height: 32px;
  border: none;
  border-radius: 10px;
  background: rgba(255,255,255,.06);
  color: #bbb;
  cursor: pointer;
}

.close-btn:hover {
  background: rgba(255,255,255,.12);
  color: white;
}

/* 弹窗内容区域 */
.dialog-body {
  padding: 18px 20px;
  max-height: 420px;
  overflow-y: auto;
}

/* 滚动条 */
.dialog-body::-webkit-scrollbar {
  width: 6px;
}
.dialog-body::-webkit-scrollbar-thumb {
  background: rgba(255,255,255,.15);
  border-radius: 10px;
}

/* 货物列表 */
.goods-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

/* 单个货物 */
.goods-item {
  display: flex;
  justify-content: space-between;
  padding: 12px 14px;
  border-radius: 12px;
  background: rgba(255,255,255,.04);
}

.goods-name {
  color: #e5e7eb;
  font-size: 14px;
}

.goods-quantity {
  color: #ffb347;
  font-size: 14px;
  font-weight: 600;
}

/* 空状态 */
.empty-tip {
  text-align: center;
  padding: 40px 0;
  color: #888;
}

/* 合计行 */
.total-row {
  margin-top: 18px;
  padding-top: 16px;
  border-top: 1px solid rgba(255,255,255,.08);
  display: flex;
  justify-content: space-between;
  color: #ddd;
}

.total-value {
  font-size: 24px;
  font-weight: 700;
}
</style>