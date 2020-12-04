FROM maven:3-openjdk-11

WORKDIR /tmp/

ADD . /tmp/

RUN mvn clean package -B -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn \
    && mvn -B install dependency:copy-dependencies -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn \
    && cp /tmp/target/dependency/apm-agent-core-8.3.0.jar /opt/apm.jar \
    && cp /tmp/target/app.jar /opt/app.jar \
    && rm -rf /tmp/* "${MAVEN_HOME}" "${MAVEN_CONFIG}"

USER 1001
EXPOSE 5273

ENTRYPOINT ["java","-jar","/opt/app.jar"]
