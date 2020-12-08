FROM maven:3-openjdk-11

WORKDIR /tmp/

ADD . /tmp/

RUN mvn clean package -B -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn \
    && curl -s https://mirrors.tuna.tsinghua.edu.cn/apache/skywalking/8.3.0/apache-skywalking-apm-es7-8.3.0.tar.gz | tar xz -C /opt/ \
    && mv /opt/apache-skywalking-apm-bin-es7 /opt/skywalking \
    && cp /tmp/target/app.jar /opt/app.jar \
    && rm -rf /tmp/* "${MAVEN_HOME}" "${MAVEN_CONFIG}"

USER 1001
EXPOSE 5273

ENTRYPOINT ["java","-jar","/opt/app.jar"]
