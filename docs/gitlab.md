## gitlab的运行

```shell
# 下载GitLab镜像
docker pull gitlab/gitlab-ce:15.0.0-ce.0

# 在/home目录下创建下面的文件夹
mkdir /home/gitlab /home/gitlab/etc /home/gitlab/log /home/gitlab/opt 

# 启动容器
docker run -id -p 9543:443 -p 9527:80 -p 9522:22 -v /home/gitlab/etc:/etc/gitlab  -v /home/gitlab/log:/var/log/gitlab -v /home/gitlab/opt:/var/opt/gitlab --restart always --privileged=true --name gitlab gitlab/gitlab-ce:15.0.0-ce.0

# 关于上面命令的解释
-i  以交互模式运行容器，通常与 -t 同时使用命令解释：

-d  后台运行容器，并返回容器ID

-p 8843:443 将容器内部端口向外映射

-p 9528:80  将容器内80端口映射至宿主机9528端口，这是访问gitlab的端口

-p 9522:22  将容器内22端口映射至宿主机9522端口，这是访问ssh的端口

-v /home/gitlab/etc:/etc/gitlab  将容器/etc/gitlab目录挂载到宿主机/home/gitlab/etc目录下，若宿主机内此目录不存在将会自动创建，其他两个挂载同这个一样

--restart always  容器自启动

--privileged=true  让容器获取宿主机root权限

--name gitlab  设置容器名称为gitlab

gitlab/gitlab-ce:15.0.0-ce.0  镜像的名称，这里也可以写镜像ID
```



## 配置修改

