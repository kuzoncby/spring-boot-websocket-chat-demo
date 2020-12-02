# Java 运行时镜像
FROM openjdk:11-jdk

# 添加 Java 文件
ADD target/app.jar .

# 允许 5273 端口外部访问
EXPOSE 5273

# 运行 Java
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

