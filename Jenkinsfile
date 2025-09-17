pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "node-app:latest"
        SONARQUBE_ENV = "MySonarQube"  // Name of SonarQube server config in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/prudhviraj310/devopspractice'
            }
        }

        stage('Install & Test') {
            steps {
                dir('node-app') {
                    sh 'npm install'
                    sh 'npm test || true'   // run tests (won’t fail pipeline if tests fail)
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    withSonarQubeEnv("${SONARQUBE_ENV}") {
                        dir('node-app') {
                            sh 'npx sonar-scanner \
                                -Dsonar.projectKey=node-app \
                                -Dsonar.sources=. \
                                -Dsonar.host.url=$SONAR_HOST_URL \
                                -Dsonar.login=$SONAR_AUTH_TOKEN'
                        }
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE ./node-app'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker stop node-app || true'
                sh 'docker rm node-app || true'
                sh 'docker run -d --name node-app -p 3000:3000 $DOCKER_IMAGE'
            }
        }
    }
}
