# seata是什么 #
	 seata是阿里开源的一款分布式事务框架，是基于两阶段提交协议演变而来的。提供了AT、TCC、SAGA和XA等事务模式。
	
1. XA分布式事务的几种角色

		Transaction Coordinator(TC): 全局事务协调者，用来协调全局事务和各个分支事务（不同服务）的状态， 驱动全局事务和各个分支事务的回滚或提交。

		Transaction Manager事务管理者，业务层中用来开启/提交/回滚一个整体事务（在调用服务的方法中用注解开启事务）。

		Resource Manager(RM):  资源管理者，一般指业务数据库代表了一个分支事务（Branch Transaction），管理分支事务与TC进行协调注册分支事务并且汇报分支事务的状态，驱动分支事务的提交或回滚。

1. seata架构

	seata分为服务端和客户端，服务端为全局事务协调者，需要单独部署。客户端需要集成在应用程序中，包含事务管理者和资源管理者。

# seata服务端介绍 #

- 数据存储

	数据存储主要指的是事务日志的存储位置，目前提供file、db、redis三种模式。在
seata/conf/file.conf中配置。

- 注册中心和配置中心


- 启动方式

		windows: ./bin/seata-server.bat
		linux: ./bin/seata-server.sh