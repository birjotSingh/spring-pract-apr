FROM adoptopenjdk/openjdk11
RUN apt-get update -y
RUN apt-get install -y netcat
RUN groupadd -g 1001 spring
RUN useradd -u 1002 spring -g spring
USER spring:spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} kubernetes-pract-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/kubernetes-pract-0.0.1-SNAPSHOT.jar"]