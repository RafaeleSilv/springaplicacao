# Etapa 1: Construir o aplicativo
FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /app

# Copiar arquivos do projeto
COPY pom.xml .
COPY src ./src

# Construir o projeto
RUN mvn clean install

# Etapa 2: Executar o aplicativo
FROM openjdk:17-jdk-slim
WORKDIR /app

# Expor a porta 8080
EXPOSE 8080

# Copiar o JAR construído da etapa anterior
COPY --from=build /app/target/conversor-temperatura-0.0.1-SNAPSHOT.jar app.jar

# Definir o comando para executar o aplicativo
ENTRYPOINT ["java", "-jar", "app.jar"]
