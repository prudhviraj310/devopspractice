pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "node-app:latest"
        APP_CONTAINER = "node-app"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out the repo..."
                git branch: 'main', url: 'https://github.com/prudhviraj310/devopspractice.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                // Ensure Docker uses full path
                sh 'docker build -t $DOCKER_IMAGE ./node-app'
            }
        }

        stage('Run Container') {
            steps {
                echo "Running Docker container..."
                // Stop and remove previous container safely
                sh 'docker stop $APP_CONTAINER || true'
                sh 'docker rm $APP_CONTAINER || true'
                sh 'docker run -d --name $APP_CONTAINER -p 3000:3000 $DOCKER_IMAGE'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo 'SonarQube analysis placeholder'
                // You can add actual SonarQube steps later
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
