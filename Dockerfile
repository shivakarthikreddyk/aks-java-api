# ===== Build stage =====
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -q -DskipTests=false -e -B clean package

# ===== Run stage =====
FROM eclipse-temurin:17-jre
ENV JAVA_OPTS=""
WORKDIR /app
# copy the fat JAR (spring-boot repackage outputs <artifact>-<version>.jar)
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
