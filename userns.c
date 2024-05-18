// 第三章 
// UTS namespace

#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <sched.h>
#include <signal.h>
#include <unistd.h>

#include <sys/capability.h>

#define STACK_SIZE (1024*1024) 
static char child_stack[STACK_SIZE];
char * const child_args[] = {
    "/bin/bash",
    NULL
};

int child_main(void *args){
    printf("在子进程中!\n");

    cap_t caps;
    printf("eUID=%ld; eGid = %ld; ",(long) geteuid(), (long) getegid());
    caps = cap_get_proc();
    printf("capabilities: %s\n",cap_to_text(caps,NULL));

    // 加入UTS隔离
    // sethostname("NewNamespace",12);
    
    execv(child_args[0],child_args);
    return 1;
}

int main(){
    printf("程序开始: \n");
    
    // int child_pid = clone(child_main,child_stack+STACK_SIZE,SIGCHILD,NULL);
    int child_pid = clone(child_main,child_stack+STACK_SIZE,CLONE_NEWUTS | SIGCHILD,NULL);

    waitpid(child_pid,NULL,0);
    printf("已退出\n");
    return 0;
}