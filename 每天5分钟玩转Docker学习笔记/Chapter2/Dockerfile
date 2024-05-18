from busybox
# 设置镜像作者
MAINTAINER 798989631@qq.com 
# 设置镜像当前工作目录
WORKDIR /testdir 
RUN touch tmpfile1
COPY ["tmpfile2","."]
ADD ["bunch.tar.gz","."]
# 设置环境变量
ENV WELCOME "You are in my container,welcome!"

