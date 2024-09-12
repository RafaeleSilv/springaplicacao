FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean install

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/conversor-temperatura-0.0.1-SNAPSHOT.jar /app/conversor-temperatura.jar
ENTRYPOINT ["java", "-jar", "/app/conversor-temperatura.jar"]
