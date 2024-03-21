pipeline {
    agent any
   environment {
        DOCCKER_TAG = "kammana/ai-leads:${getDockerTag()}"
    }
    stages {
        stage('Maven Build') {
            steps {
               sh "mvn clean package"
            }
        }
        stage('Docker Build') {
            steps {
               sh "docker build . -t ${DOCCKER_TAG}"
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        // Run docker login command
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker push ${DOCCKER_TAG}"
                }
            }
        }
        stage("Docker - Dev Deploy"){
            steps{
                sshagent(["dev-docker-host"]){
                    script{
                        def DOCKER_RUN = "docker run -d -p 8080:8080 --name=aileads ${DOCCKER_TAG}"
                        sh "ssh ec2-user@172.17.0.10 ${DOCKER_RUN}"
                    }
                }
            }
        }
    }
}
def getDockerTag(){
    def tag = sh script: "git rev-parse --short HEAD", returnStdout: true
    return tag
}
