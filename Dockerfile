FROM openjdk:8
EXPOSE 8080
ADD target/java-application-devops.jar java-application-devops.jar
ENTRYPOINT ["java","-jar","/java-application-devops.jar"]