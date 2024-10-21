# Stage 1: Build stage
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
# Copy the Maven project file

COPY pom.xml .
# Download and cache Maven dependencies
RUN mvn dependency:go-offline -B

# Copy the entire project source
COPY src ./src

# Build the application
RUN mvn package

# Stage 2: Deployment stage
FROM tomcat:8.5.76-jdk11-openjdk-slim AS deploy

# Copy the built WAR file from the build stage to Tomcat's webapps directory
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/my-app.war

# Optionally, you can set environment variables or perform other configurations here
# For example:
# ENV JAVA_OPTS="-Xms512m -Xmx1024m"

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

