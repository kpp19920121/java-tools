#!/bin/bash


DUBBO_REGISTRY_ADDRESS="zookeeper://10.16.20.36:2181;zookeeper://10.16.20.37:2181;zookeeper://10.16.20.38:2181"
SERVER_PORT=8888

echo "kill dubbo-admin process"

ps -ef  |grep dubbo-admin |awk '{print $2}' |xargs kill -9

nohup java -jar  dubbo-admin-0.0.1-SNAPSHOT.jar\
	--dubbo.registry.address=$DUBBO_REGISTRY_ADDRESS\
	--server.port=$SERVER_PORT\
	--spring.root.password=root & 
