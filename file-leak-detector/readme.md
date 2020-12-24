# 监控应用程序句柄泄漏（具备重启的情况） #

	java -javaagent:./file-leak-detector-1.13-jar-with-dependencies.jar=http=19999
	注：停止应用程序，添加监控参数，重启，在jvm参数中追加:-javaagent...，访问http://127.0.0.1:19999获取泄漏信息。
# 监控应用程序句柄泄漏（不具备重启的情况） #

	java -jar ./file-leak-detector-1.13-jar-with-dependencies.jar 1500 threshold=200,strong