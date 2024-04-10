# Stage 1: Build the Java project with Gradle
FROM gradle:jdk17 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy only the Gradle build files
COPY build.gradle settings.gradle /app/
COPY gradle /app/gradle
COPY src /app/src

# Build the project
RUN gradle build --no-daemon

# Stage 2: Create a minimal Java runtime image
FROM openjdk:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=builder /app/build/libs/*.jar /app/app.jar

# Expose the port that the Spring Boot application runs on
EXPOSE 8080

# Command to run the Spring Boot application when the container starts
CMD ["java", "-jar", "app.jar"]
