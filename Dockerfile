FROM adoptopenjdk/openjdk11
RUN apt-get update -y
RUN apt-get install -y netcat
RUN groupadd -g 1001 spring
RUN useradd -u 1002 spring -g spring
#FROM openjdk:8-jdk-alpine
#RUN addgroup -S spring && adduser -S spring -G spring
#RUN mkdir -p /app/atomikos-tlogs
#RUN chmod 755 /app/atomikos-tlogs
USER spring:spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} kubernetes-pract-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/kubernetes-pract-0.0.1-SNAPSHOT.jar"]