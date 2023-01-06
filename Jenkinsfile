pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t my-wp-app .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yml'
            }
        }
    }
}
