pipeline {
    agent any

    stages {
        stage('Maven Build') {
            when {
                branch "develop"
            }
            steps {
               echo "Maven build..."
            }
        }
        stage('Dev Deploy') {
            when {
                branch "develop"
            }
            steps {
               echo "Deploying to dev"
            }
        }
        stage('Test Deploy') {
            when {
                branch "test"
            }
            steps {
               echo "Deploying to Test"
            }
        }
        stage('Prod Deploy') {
            when {
                branch "main"
            }
            steps {
               echo "Deploying to Production"
            }
        }
    }
}
