# Stage 1: Build the Java project with Gradle
FROM openjdk:17-jdk-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project directory into the container
COPY . .

# Run the Gradle build command to compile the source code and generate artifacts
RUN ./gradlew build -x test

# Stage 2: Create a minimal Tomcat image and deploy the WAR file
FROM tomcat:latest

# Set the working directory inside the container
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file generated in the previous stage into the Tomcat webapps directory
COPY --from=builder /app/build/libs/demo-0.0.1-SNAPSHOT.war .
