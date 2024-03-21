# Use Tomcat 9 image as the base image
FROM tomcat:9

# Remove the default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file into the webapps directory of Tomcat
COPY target/ai-leads.war /usr/local/tomcat/webapps/ROOT.war

# Optionally, you may expose the port if you want to access the Tomcat server externally
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
