## 1.在vite+vue中使用scss

```js
// 安装sass
npm install --save-dev sass
// 1.使用全局变量的方式注入./src/style/globalVar.scss
// 配置vite.config.js
import { defineConfig } from "vite";
import path from "path";
// 特别注意：在vite的配置文件中不要使用require，会报这个错误：Dynamic require of "path" is not supported
// const path = require("path");
import vue from "@vitejs/plugin-vue";
export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
  //全局引入
  css: {
    preprocessorOptions: {
      scss: {
        /**如果引入多个文件，可以使用
         * '@import "@/assets/scss/globalVariable1.scss";
         * @import"@/assets/scss/globalVariable2.scss";'
         **/
        // 在这里如果使用@路径的话，需要先在上面的alias中配置
        additionalData: '@import "@/style/globalVar.scss";',
      },
    },
  },
});


# 2.按需引入的方式
<style scoped lang="scss">
// 这里说导入的scss文件
@import "@/style/light.scss";
.app {
  width: 200px;
  height: 200px;
  background-color: $color;
  font-size: $font-size;
}
</style>
```

