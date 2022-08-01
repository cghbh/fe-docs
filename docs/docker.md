## 下载Docker

```shell
# 安装依赖
yum install -y yum-utils device-mapper-persistent-data lvm2

# 设置yum源
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装docker
yum install -y docker-ce

# 设置开机启动
systemctl enable docker

# 启动 Docker
systemctl start docker

# 查看版本
docker version

```

> 特别注意：在Centos8中安装docker可能会报这样的错（Centos8于2021年年底停止了服务）：`错误：Failed to download metadata for repo 'AppStream': Cannot prepare internal mirrorlist: No URLs in mirrorlist`。解决的办法按照下面的步骤执行即可：

```shell
# 1.进入yum的repos目录
cd /etc/yum.repos.d/

# 2.修改所有的CentOS文件内容，依次执行下面的两条命令
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# 3.更新yum源为阿里镜像
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo
# 如果wget提示没有安装的话，执行下面这条命令（其实到这步基本上已解决问题）：
yum install wget -y
# 清除所有的缓存
yum clean all
# 把服务器的包信息下载到本地电脑缓存起来
yum makecache

# 4.测试是否安装成功
yum install wget –y
```

