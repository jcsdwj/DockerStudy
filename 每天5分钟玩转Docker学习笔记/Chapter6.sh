# Docker存储

#查看系统默认driver
docker info

# 通过-v 将文件mount到httpd容器
docker run -d -p 80:80 -v /home/wj/Desktop/DockerProject/DockerStudy/htdocs:/usr/local/apache2/htdocs httpd

# 创建volume container
docker create --name vc_data -v /home/wj/Desktop/DockerProject/DockerStudy/htdocs:/usr/local/apache2/htdocs -v /other/useful/tools busybox

# 其他容器通过 --volumes-from使用vc_data
docker run --name web2 -d -p 80 --volumes-from vc_data httpd