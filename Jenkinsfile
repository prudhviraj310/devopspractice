pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "node-app:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Public repo, no credentials needed
                git branch: 'main', url: 'https://github.com/prudhviraj310/devopspractice'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $DOCKER_IMAGE ./node-app'
            }
        }

        stage('Run Container') {
            steps {
                echo "Running Docker container..."
                sh 'docker stop node-app || true'  // stop previous container if running
                sh 'docker rm node-app || true'    // remove previous container if exists
                sh 'docker run -d --name node-app -p 3000:3000 $DOCKER_IMAGE'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo 'SonarQube analysis placeholder'
            }
        }
    }
}
