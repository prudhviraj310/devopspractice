pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "node-app:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/prudhviraj310/devopspractice'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE ./node-app'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 3000:3000 $DOCKER_IMAGE'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo 'SonarQube analysis placeholder'
            }
        }
    }
}
