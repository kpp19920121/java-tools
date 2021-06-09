#!/bin/bash




echo "kill dubbo-admin process"

ps -ef  |grep xxl-job-admin |awk '{print $2}' |xargs kill -9

nohup java -jar  xxl-job-admin-2.3.1-SNAPSHOT.jar\
	-server.port=9080\
	--spring.datasource.username=root\
	--spring.datasource.password=root & 
