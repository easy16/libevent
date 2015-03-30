/*************************************************************************
    > File Name: test.c
    > Author: liujunq2
    > Mail: liujunq2@163.com 
    > Created Time: Sat 28 Mar 2015 04:55:15 AM EDT
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include "event.h"

int sock_fd;
void event_occur(int fd,short evt,void *args)
{
	if(evt == EV_READ && fd == sock_fd)
	{
		printf("sock_fd read\n");
	}
	else if(evt ==EV_TIMEOUT)
	{
		printf("EV_TIMEOUT\n");
	}
}
int main(int argc, const char *argv[])
{
	sock_fd = open_server_socket();

	struct event evt;
	struct timeval timeout={
		10,0
	};
	event_init();
	event_set(&evt,sock_fd,EV_READ,event_occur,NULL);
	event_add(&evt,&timeout);
	event_dispatch();
	close(sock_fd);
	return 0;
}
