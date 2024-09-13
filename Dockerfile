#
# Build stage
#
FROM maven:3.9-eclipse-temurin-21-alpine AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM eclipse-temurin:21-jdk-alpine
COPY --from=build /target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]