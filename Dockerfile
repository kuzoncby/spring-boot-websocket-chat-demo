# Java 运行时镜像
FROM openjdk:11-jdk

# 允许 Github Action 挂载
VOLUME /tmp

# 添加 Java 文件
ADD target/app.jar /opt

# 允许 5273 端口外部访问
EXPOSE 5273

# 运行 Java
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/opt/app.jar"]

