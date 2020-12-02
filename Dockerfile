FROM maven:3-openjdk-11

WORKDIR /tmp/

ADD . /tmp/

RUN mvn clean package -B -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn \
    && cp /tmp/target/app.jar /opt/app.jar \
    && rm -rf /tmp/* "${MAVEN_HOME}" "${MAVEN_CONFIG}"

USER 1001
EXPOSE 5273

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/opt/app.jar"]

