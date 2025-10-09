FROM openjdk:8
EXPOSE 8081
ADD target/java-application-devops.jar java-application-devops.jar
ENTRYPOINT ["java","-jar","/java-application-devops.jar"]