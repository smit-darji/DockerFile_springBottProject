
FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /usr/app/
COPY pom.xml /usr/app
COPY src /usr/app/src
RUN pwd
RUN mvn install
FROM tomcat:latest
COPY --from=maven_builder /usr/app/target/myproject-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]