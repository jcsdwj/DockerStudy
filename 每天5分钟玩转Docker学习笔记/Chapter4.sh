# 删除所有已退出的容器 (docker rm 删除容器; docker rmi 删除镜像)
docker rm -v $(docker ps -aq -f status=exited)

# -m设置内存的使用限额 --memory-swap 设置内存+swap的使用限额
# -vm 1 启动一个内存工作线程 --vm-bytes 280M 每个线程分配280MB 内存
docker run -it -m 200M --memory-swap=300M progrium/stress --vm 1 --vm-bytes 280M