#Build
FROM maven:3.8.4-openjdk-17 AS Build

WORKDIR /app

# Copia apenas o pom primeiro (cache melhor)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copia o source
COPY src ./src

# Compila o projeto
RUN mvn clean package -DskipTests


#Runtime
FROM eclipse-temurin:17-jdk


WORKDIR /app

# Copia o jar gerado do estagio anterior
COPY --from=Build /app/target/learning-0.0.1-SNAPSHOT.jar app.jar

# Expõe porta padrão do Spring Boot
EXPOSE 8080

# Executa a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
