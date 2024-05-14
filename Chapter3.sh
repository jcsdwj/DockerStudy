# Docker核心原理解读

# 查看/proc/[pid]/ns文件 $$表示当前运行的进程号
ls -l /proc/$$/ns

# 通过setns()加入一个已经存在的namespace

# 创建一个message queue
ipcmk -Q

# 查看已开启的message queue 
ipcs -q