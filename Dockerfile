FROM maven:3-openjdk-11

WORKDIR /tmp/

ADD * /tmp/

RUN mvn -B clean package \
    && cp /tmp/target/app.jar /opt/app.jar \
    && rm -rf /tmp/* "${MAVEN_HOME}" "${MAVEN_CONFIG}"

EXPOSE 5273

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/opt/app.jar"]

