FROM tomcat:8
LABEL app=my-app
COPY /home/runner/work/ai-leads/ai-leads/target/*.war /usr/local/tomcat/webapps/ai-leads.war
