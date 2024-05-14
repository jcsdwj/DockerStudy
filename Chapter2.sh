# 查看docker命令
sudo docker 

# Docker环境信息
sudo docker info

# 从Ubuntu镜像启动一个容器，执行echo命令打印hello world
sudo docker run ubuntu echo "Hello World"

# 启动一个容器 分配一个伪终端执行bin/bash命令
# -i 表示使用交互模式 -t 表示分配一个伪终端 --name 指定docker run启动容器的名字
# -c 表示给运行在容器的进程分配CPU的shares值
sudo docker run -i -t --name mytest ubuntu:latest /bin/bash

# 应用栈容器节点互联
sudo docker run --link redis:redis --name console ubuntu bash

# 部分实验待做