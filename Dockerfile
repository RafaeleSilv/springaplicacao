# Etapa 1: Construir o aplicativo usando uma imagem Maven com JDK
FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean install

# Etapa 2: Executar o aplicativo usando uma imagem JDK mais leve
FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/conversor-temperatura-0.0.1-SNAPSHOT.jar /app/conversor-temperatura.jar
ENTRYPOINT ["java", "-jar", "/app/conversor-temperatura.jar"]

