# Start with a base image containing Java runtime
FROM adoptopenjdk/openjdk11:alpine-slim
# The application's jar file
RUN mkdir /app && addgroup springboot && adduser  -H  -S -G springboot springboot && chown -R springboot:springboot /app
# Add the application's jar to the container
ADD target/kubernetes-pract-0.0.1-SNAPSHOT.jar /app/app.jar
#Application run as user
USER springboot
# entry point to start the app
ENTRYPOINT ["java","-jar","/app/app.jar"]