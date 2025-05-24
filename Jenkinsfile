pipeline {
    agent {
        label 'K8s-M'
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dhubcred')
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'patch-1', url: 'https://github.com/Ilamparidhi-21/Website-PRT-ORG-1.git'
            }
        }

        stage('Docker Build & Push') {
            steps {
                sh '''
                    echo "Logging into DockerHub..."
                    docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW

                    echo "Building Docker Image..."
                    docker build -t ilamparidhi/prt-task .

                    echo "Pushing Docker Image..."
                    docker push ilamparidhi/prt-task
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    echo "Applying Kubernetes Deployment..."
                    kubectl apply -f Deployment.yaml

                    echo "Applying Kubernetes Service..."
                    kubectl apply -f service.yaml
                '''
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed!'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}
