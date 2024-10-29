pipeline{
    agent any
    environment{
        TOMCAT_IP="172.31.11.38"
        TOMCAT_USER="ec2-user"

    }
    stages{
        stage("Maven Build"){
            steps{
                sh 'mvn clean package'
            }
        }
        stage("Tomcat Deploy - Dev"){
            steps{
                sshagent(['tomcat-dev']) {
                    sh """
                        # Copy war file to tomcat
                        scp -o StrictHostKeyChecking=no target/ai-leads.war ${TOMCAT_USER}@${TOMCAT_IP}:/opt/tomcat9/webapps/
                        # Stop tomcat
                        ssh ${TOMCAT_USER}@${TOMCAT_IP} /opt/tomcat9/bin/shutdown.sh
                        # Start tocmcat
                        ssh ${TOMCAT_USER}@${TOMCAT_IP} /opt/tomcat9/bin/startup.sh
                    """
                }
            }
        }
    }
}
