# Docker 网络
# Docker 安装时会自动创建三个网络 bridge host none
docker network ls

# 连接host网络，容器配置与主机配置一致

# 通过bridge驱动创建bridge网络
docker network create --driver bridge my_net_1

# 指定IP 网段
docker network create --driver bridge --subnet 172.22.16.0/24 --gateway 172.22.16.1 my_net2

# 设置固定ip
docker run -it --network=my_net2 --ip 172.22.16.8  busybox

# 查看路由表
ip r

# 添加网卡
docker network connect my_net2 265b1ce18bea

# DNS server通过容器名访问（但没有ping通，但直接ping地址可以）
docker run -it --network=my_net2 --name=bbox1 busybox
docker run -it --network=my_net2 --name=bbox2 busybox

# 共享网络栈，共享网卡和配置信息
docker run -d -it --name=web1 httpd
docker run -it --network=container:web1 busybox