# 指定镜像
FROM node:14
# 创建一个目录 
RUN mkdir -p /home/fe-docs
# 把新建的目录指定为工作目录
WORKDIR /home/fe-docs
# 复制本机内容到 容器内部的工作目中 , " . " 是指 dockerfile 文件 相对的当前目录下的所有文件 , 当然你也可以 指定目录
COPY . /home/fe-docs
# 指定下载依赖淘宝镜像 , 学过前端都懂吧~
RUN npm config set registry https://registry.npm.taobao.org
# 安装工具
RUN npm i docsify-cli -g
# 对本机暴露一个 3000端口
EXPOSE 3000
# 在镜像运行时候 , 执行安装依赖以及启动命令
CMD docsify serve docs
