pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git url: "https://github.com/javahometech/ai-leads", branch:"main"
            }
        }
    }
}
