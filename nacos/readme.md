# nacos常用命令
	单机模式启动:
		./startup.sh    -m standalone
# nacos访问地址
	http://192.168.233.133:8848/nacos/index.html

# nacos核心概念 #
##  1） 命名空间 ##
	nacos的命令空间(namespace)来进行租户粒度的环境隔离。换句话来说就是使用namespace来进行环境的隔离，如：开发环境、测试环境、uat环境、生产环境等。

## 2）配置集、配置集id、配置分组 ##
	

- 配置集通常指的是一个配置文件，
- 每个配置集有一个id，全局唯一，称为data-id。
- 每个配置集属于一个配置分组（group）,默认的配置分组为:DEFAULT_GROUP
- 每个配置分组中，配置集id（data-id）唯一。

## 3）配置快照 ##

- 配置快照就是配置信息的缓存，在nacos server挂掉时，任然能对外提供服务。

## 4）服务注册中心 ##

- nacos 服务端提供的功能之一。服务提供者将调用信息注册到注册中心，服务调用者从注册中心拿到服务提供者的ip地址、端口等信息，然后通过获取的信息进行rpc调用。



# 最佳实践 #


##  1）Namespace，Group，DataId： ##



- Namespace：代表不同的环境，如：开发、测试， 生产等；


- Group：代表某个项目，如：XX物流项目，XX教育项目；


- DataId：每个项目下往往有若干个应用，每个配置集(DataId)是一个应用的主配置文件



## 2）公共配置 ##

	每个配置集对应一个应用，项目中可能存在一个配置被多个项目使用，为了复用配置，nacos中提出了扩展配置集和共享配置集来实现。

- 扩展配置集

	在nacos客户端中，添加ext-config来实现扩展配置集，扩展配置集中需要指定data-id、type等。如果需要自动刷新，还需要指定autoRefresh=true。参考配置如下:


		nacos:
		  config:
		    data-id: application.yml # nacos 配置的 data-id
		    server-addr: 192.168.233.133:8848 # nacos 服务器地址
		    group: TEST_GROUP # 配置文件 Group
		    namespace: develop_namespace # 命名空间ID
		    type: yaml # nacos 配置文件类型
		    auto-refresh: true # 是否启用动态刷新配置(为false，则不动态刷新)
		    bootstrap:
		      enable: true # 这个需要为 true, 否则启动项目时不设置 value默认值会报错，也不会自动更新，请查看 NacosConfigApplicationContextInitializer 文件
		    ext-config[0]:
		      data-id: ext-config-common01.yaml # 配置集 id
		      type: yaml # nacos 配置文件类型
		      autoRefresh: true # 是否支持动态刷新   
		    ext-config[1]:
		      data-id: ext-config-common02.yaml # 配置集 id
		      group: DEFAULT_GROUP # 组，默认为 DEFAULT_GROUP
		      autoRefresh: true # 是否支持动态刷新   
		      type: yaml # nacos 配置文件类型
		    ext-config[2]:
		      data-id: ext-config-common03.yaml # 配置集 id
		      group: DEFAULT_GROUP # 组，默认为 DEFAULT_GROUP
		      autoRefresh: true # 是否支持动态刷新   
		      type: yaml # nacos 配置文件类型      


- 共享配置集


# spring boot中使用nacos注意事项 #
## 1） 自动刷新
	

- 自动刷新需要指定auto-refresh=true。


- type需要根据nacos配置中心的类型来填写


- 扩展配置集[ext-config]需要指定autoRefresh参数来自动刷新

	
## 2) ##