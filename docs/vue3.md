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



## 2.代码格式化

1.安装prettier

```shell
npm install prettier -D
```

2.配置.prettierrc文件：

* useTabs：使用tab缩进还是空格缩进，选择false；
* tabWidth：tab是空格的情况下，是几个空格，选择2个；
* printWidth：当行字符的长度，推荐80，也有人喜欢100或者120；
* singleQuote：使用单引号还是双引号，选择true，使用单引号；
* trailingComma：在多行输入的尾逗号是否添加，设置为 `none`；
* semi：语句末尾是否要加分号，默认值true，选择false表示不加；

```
{
  "printWidth": 120,
  "tabWidth": 2,
  "useTabs": false,
  "semi": false,
  "singleQuote": true,
  "bracketSpacing": true,
  "endOfLine": "lf",
  "htmlWhitespaceSensitivity": "ignore",
  "ignorePath": ".prettierignore",
  "trailingComma": "none"
}
```

3.创建..prettierignore忽略文件

```
/dist/*
.local
.output.js
/node_modules/**

**/*.svg
**/*.sh

/public/*
```

4.VSCode需要安装prettier的插件