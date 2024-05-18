# docker commit创建新镜像

# docker build创建镜像
docker build -t ubuntu-with-vi-dockerfile .

# 查看镜像分层
docker history ubuntu-with-vi-dockerfile

# 本地搭建registry -v将容器的/var/lib/registry映射到本地/myregistry
docker run -d -p 5000:5000 -v /myregistry:/var/lib/registry registry:2

# 长期运行保持容器运行状态 加上-d后台启动
docker run ubuntu /bin/bash -c "while true ; do sleep 1; done"