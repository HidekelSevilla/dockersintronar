FROM openjdk:8-jdk-slim
ARG JAR_FILE=target/*.jar
ARG JAVA_AGENT_FILE=/elastic-apm-agent-1.39.0.jar
ARG APP_PROPERTIES=/application.properties


RUN mkdir ./apmKioAgent
COPY ${JAVA_AGENT_FILE} ./apmKioAgent


COPY ${JAR_FILE} ./
COPY ${APP_PROPERTIES} ./

CMD ["java", "-javaagent:/apmKioAgent/elastic-apm-agent-1.39.0.jar", "-Delastic.apm.service_name=coppelPrueba", "-Delastic.apm.application_packages=com.coppel.*", "-Delastic.apm.server_url=http://172.24.1.16:8200", "-jar", "/demo-0.0.1-SNAPSHOT.jar", "--spring.config.location=/app/application.properties"]
