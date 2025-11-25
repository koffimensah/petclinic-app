FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy Maven wrapper first
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Make mvnw executable
RUN chmod +x mvnw

# Resolve dependencies
RUN ./mvnw dependency:resolve

# Copy source code
COPY src ./src

# Expose default Spring Boot port
EXPOSE 8080

# Run the application
CMD ["./mvnw", "spring-boot:run"]
