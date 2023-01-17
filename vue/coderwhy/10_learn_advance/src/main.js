import { createApp } from 'vue'
import App from './01_自定义指令/App.vue'
// import App from './02_内置组件补充/App.vue'
// import App from './03_安装插件/App.vue'
// import useDirectives from "./01_自定义指令/directives/index"
import directives from "./01_自定义指令/directives/index"

// import router from "./router"

// const app = createApp(App)
// // useDirectives(app)
// directives(app)
// app.mount('#app')

createApp(App).use(directives).mount("#app")

