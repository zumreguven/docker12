pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/zumreguven/docker12'
            }
        }
        stage('Build') {
            steps {
                sh 'docker-compose build'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}
